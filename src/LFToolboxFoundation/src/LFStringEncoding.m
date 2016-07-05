//
//  LFStringEncoding.m
//  LFToolboxKit
//
//  Created by zhiwei wang on 16/7/5.
//  Copyright © 2016年 Youku. All rights reserved.
//

#import "LFStringEncoding.h"
#import "LFFoundationDefines.h"

#if !defined(_LFDevAssert)
#if DEBUG
    #define _LFDevAssert(condition, desc, ...)	\
        do {				\
            __PRAGMA_PUSH_NO_EXTRA_ARG_WARNINGS \
            if (!(condition)) {		\
            NSString *__assert_file__ = [NSString stringWithUTF8String:__FILE__]; \
            __assert_file__ = __assert_file__ ? __assert_file__ : @"<Unknown File>"; \
            [[NSAssertionHandler currentHandler] handleFailureInMethod:_cmd \
                                                                object:self file:__assert_file__ \
                                            lineNumber:__LINE__ description:(desc), ##__VA_ARGS__]; \
            }				\
            __PRAGMA_POP_NO_EXTRA_ARG_WARNINGS \
        } while(0)
    #endif
#else
    #define _LFDevAssert(condition, desc, ...) do {} while(0)
#endif /*_LFDevAssert */


enum {
    kUnknownChar = -1,
    kPaddingChar = -2,
    kIgnoreChar = -3
};




#pragma mark --_LFStringCommonEncoding

@interface _LFStringCommonEncoding : LFStringCoding
{
@private
    NSData *_charMapData;
    char *_charMap;
    int _reverseCharMap[128];
    int _shift;
    int _mask;
    int _padLength;
}
@property (nonatomic, assign) BOOL doPad;

@property (nonatomic, assign) char paddingChar;

- (instancetype)initWithString:(NSString *)string;

@end

@implementation _LFStringCommonEncoding

#pragma mark --life cycle
- (instancetype)initWithString:(NSString *)string {
    if (self = [super init]) {
        _charMapData = [string dataUsingEncoding:NSASCIIStringEncoding];
        if (!_charMapData) {
            _LFDevLog(@"Unable to convert string to ASCII");
            return nil;
        }
        _charMap = (char *)_charMapData.bytes;
        NSUInteger length = _charMapData.length;
        if (length < 2 || length > 128 || length & (length - 1)) {
            _LFDevLog(@"Length not a power of 2 between 2 and 128");
            return nil;
        }
        
        memset(_reverseCharMap, kUnknownChar, sizeof(_reverseCharMap));
        
        for (unsigned int i = 0; i < length; i++) {
            if (_reverseCharMap[(int)_charMap[i]] != kUnknownChar) {
                _LFDevLog(@"Duplicate character at pos %d",i);
                return nil;
            }
            _reverseCharMap[(int)_charMap[i]] = i;
        }
        
        for (NSUInteger i = 1; i < length; i <<= 1) {
            _shift++;
        }
        _mask = (1 << _shift) - 1;
        _padLength = lcm(8,_shift) / _shift;
    }
    return self;
}

#pragma mark --protrol LFStringCoding
- (NSString *)encodeString:(NSString *)string  usingEncoding:(NSStringEncoding)encoding{
    
    NSData *data = [string dataUsingEncoding:encoding ? encoding : NSUTF8StringEncoding];
    return [self encode:data];
}

- (NSString *)encode:(NSData *)inData {
    NSUInteger inLength = inData.length;
    if (inLength <= 0) {
        _LFDevLog(@"Empty input");
        return @"";
    }
    
    unsigned char *inBuf = (unsigned char *)inData.bytes;
    NSUInteger inPos = 0;
    
    NSUInteger outLength = (inLength * 8 + _shift - 1) / _shift;
    if (_doPad) {
        outLength = ((outLength + _padLength - 1) / _padLength) * _padLength;
    }
    
    NSMutableData *outData = [NSMutableData dataWithLength:outLength];
    unsigned char *outBuf = (unsigned char *)outData.mutableBytes;
    NSUInteger outPos = 0;
    
    int buffer = inBuf[inPos++];
    int bitsLeft = 8;
    
    while (bitsLeft > 0 || inPos < inLength) {
        if (bitsLeft < _shift) {
            if (inPos < inLength) {
                buffer <<= 8;
                buffer |= (inBuf[inPos++] & 0xff);
                bitsLeft += 8;
            } else {
                int pad = _shift - bitsLeft;
                buffer <<= pad;
                bitsLeft += pad;
            }
        }
        int idx = (buffer >> (bitsLeft - _shift)) & _mask;
        bitsLeft -= _shift;
        outBuf[outPos++] = _charMap[idx];
    }
    if (_doPad) {
        while (outPos < outLength)
            outBuf[outPos++] = _paddingChar;
    }
    
    _LFDevAssert(outPos == outLength, @"Underflowed output buffer");
    [outData setLength:outPos];
    
    return [[NSString alloc] initWithData:outData encoding:NSASCIIStringEncoding];
    
}


- (NSString *)decodeString:(NSString *)string  usingEncoding:(NSStringEncoding)encoding{
    
    NSData *ret = [self decode:string];
    return [[NSString alloc] initWithData:ret encoding:encoding ? encoding : NSUTF8StringEncoding];
}

- (NSData *)decode:(NSString *)inString {
    char *inBuf = (char *)[inString cStringUsingEncoding:NSASCIIStringEncoding];
    if (!inBuf) {
        _LFDevLog(@"unable to convert buffer to ASCII");
        return nil;
    }
    NSUInteger inLen = strlen(inBuf);
    NSUInteger outLen = inLen * _shift / 8;
    NSMutableData *outData = [NSMutableData dataWithLength:outLen];
    unsigned char *outBuf = (unsigned char *)[outData mutableBytes];
    NSUInteger outPos = 0;
    
    int buffer = 0;
    int bitsLeft = 0;
    BOOL expectPad = NO;
    for (NSUInteger i = 0; i < inLen; i++) {
        int val = _reverseCharMap[(int)inBuf[i]];
        switch (val) {
            case kIgnoreChar:
                break;
            case kPaddingChar:
                expectPad = YES;
                break;
            case kUnknownChar:
                _LFDevLog(@"Unexpected data in input pos %lu", (unsigned long)i);
                return nil;
            default:
                if (expectPad) {
                    _LFDevLog(@"Expected further padding characters");
                    return nil;
                }
                buffer <<= _shift;
                buffer |= val & _mask;
                bitsLeft += _shift;
                if (bitsLeft >= 8) {
                    outBuf[outPos++] = (unsigned char)(buffer >> (bitsLeft - 8));
                    bitsLeft -= 8;
                }
                break;
        }
    }
    if (bitsLeft && buffer & ((1 << bitsLeft) - 1)) {
        _LFDevLog(@"Incomplete trailing data");
        return nil;
    }
    
    // Shorten buffer if needed due to padding chars
    _LFDevAssert(outPos <= outLen, @"Overflowed buffer");
    [outData setLength:outPos];
    return outData;
}

#pragma mark --private
- (NSString *)description {
    // TODO(iwade) track synonyms
    return [NSString stringWithFormat:@"<Base%d StringEncoder: %@>",
            1 << _shift, _charMapData];
}

- (void)setPaddingChar:(char)paddingChar {
    _paddingChar = paddingChar;
    _reverseCharMap[(int)paddingChar] = kPaddingChar;
}

- (void)addDecodeSynonyms:(NSString *)synonyms {
    char *buf = (char *)[synonyms cStringUsingEncoding:NSASCIIStringEncoding];
    int val = kUnknownChar;
    
    while (*buf) {
        int c = *buf++;
        if (_reverseCharMap[c] == kUnknownChar) {
            _reverseCharMap[c] = val;
        }else {
            val = _reverseCharMap[c];
        }
    }
}
@end

#pragma mark --_LFStringURLEncoding
@interface _LFStringURLEncoding : LFStringCoding


@end

@implementation _LFStringURLEncoding

#pragma mark --protrol LFStringCoding
- (NSString *)encodeString:(NSString *)string  usingEncoding:(NSStringEncoding)encoding{
    
    static NSString * const  allowedCharacters = @"!*'();:@&=+$,/?%#[]";
    BOOL g_allowedCharacters = [NSString instancesRespondToSelector:@selector(stringByAddingPercentEncodingWithAllowedCharacters:)];
    if (g_allowedCharacters) {
        static NSCharacterSet * characterSet = nil;
        if (characterSet == nil) {
            characterSet = [NSCharacterSet characterSetWithCharactersInString:allowedCharacters];
        }
        return  [string stringByAddingPercentEncodingWithAllowedCharacters:characterSet];
    } else {
        CFStringRef escaped = NULL;
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        escaped = CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
                                                          (CFStringRef)string,
                                                          NULL,
                                                          (CFStringRef)allowedCharacters,
                                                          (CFStringEncoding)encoding);
#pragma clang diagnostic pop
        
#if defined(__has_feature) && __has_feature(objc_arc)
        return CFBridgingRelease(escaped);
#else
        return [(NSString *)escaped autorelease];
#endif
    }

}

- (NSString *)decodeString:(NSString *)string  usingEncoding:(NSStringEncoding)encoding{
    
    BOOL g_stringByRemovingPercentEncoding = [NSString instancesRespondToSelector:@selector(stringByRemovingPercentEncoding)];
    NSMutableString *resultString = [NSMutableString stringWithString:string];
    [resultString replaceOccurrencesOfString:@"+"
                                  withString:@" "
                                     options:NSLiteralSearch
                                       range:NSMakeRange(0, [resultString length])];
    
    
    if (g_stringByRemovingPercentEncoding) {
        return resultString.stringByRemovingPercentEncoding;
    }else{
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        return [resultString stringByReplacingPercentEscapesUsingEncoding:encoding];
#pragma clang diagnostic pop
    }

}

@end


@implementation LFStringCoding

/**
 * 父类的protrol方法暂不实现
 */
#pragma mark --protrol LFStringCoding
- (NSString *)encodeString:(NSString *)string  usingEncoding:(NSStringEncoding)encoding{
    
    return nil;
}

- (NSString *)decodeString:(NSString *)string  usingEncoding:(NSStringEncoding)encoding{
    
    return nil;
}

#pragma mark --public
+ (id<LFStringCoding>)commonCoderWithType:(LFCommonCoderType)coderType{
    
    switch (coderType) {
        case LFBinaryStringEncoding:
        {
            _LFStringCommonEncoding *ret = [[_LFStringCommonEncoding alloc] initWithString:@"01"];
            return ret;
        }
            break;
        case LFHexStringEncoding:
        {
            _LFStringCommonEncoding *ret = [[_LFStringCommonEncoding alloc] initWithString:@"0123456789ABCDEF"];
            [ret addDecodeSynonyms:@"AaBbCcDdEeFf"];
            return ret;
        }
            break;
        case LFBase64StringEncoding:
        {
            _LFStringCommonEncoding *ret = [[_LFStringCommonEncoding alloc] initWithString:@"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"];
            [ret setPaddingChar:'='];
            [ret setDoPad:YES];
            return ret;
        }
            break;
        case LFBase64WebsafeStringEncoding:
        {
            _LFStringCommonEncoding *ret = [[_LFStringCommonEncoding alloc] initWithString:@"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-_"];
            [ret setPaddingChar:'='];
            [ret setDoPad:YES];
            return ret;
        }
            break;
            
        default:
            break;
    }
    return nil;
}


+ (id<LFStringCoding>)URLCoder{
    
    _LFStringURLEncoding *ret = [[_LFStringURLEncoding alloc]init];
    return ret;
}

@end



