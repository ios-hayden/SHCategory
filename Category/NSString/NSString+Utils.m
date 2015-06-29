//
//  NSString+Utils.m
//  SHCategory
//
//  Created by Hayden Wang on 15/6/29.
//  Copyright (c) 2015年 YardLAN. All rights reserved.
//

#import "NSString+Utils.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (Utils)
#pragma mark - Trim
- (NSString*)trimAll
{
    return [self stringByReplacingOccurrencesOfString:@" " withString:@""];
}

- (NSString*)trim
{
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

#pragma mark - Encode
- (NSString*)MD5
{
    NSString *md5 = nil;
    if ( [self length] > 0 ) {
        const char *str = [self UTF8String];
        unsigned char r[CC_MD5_DIGEST_LENGTH];
        CC_MD5(str, (CC_LONG)strlen(str), r);
        md5 = [NSString stringWithFormat:@"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
                    r[0], r[1], r[2], r[3], r[4], r[5], r[6], r[7], r[8], r[9], r[10], r[11], r[12], r[13], r[14], r[15]];
    }
    return md5;
}

- (NSString*)URLEncode
{
    CFStringRef encodedCFString = CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (__bridge CFStringRef)self,nil,CFSTR("?!@#$^&%*+,:;='\"`<>()[]{}/\\| "),   kCFStringEncodingUTF8);
    
    NSString *encodedString = [[NSString alloc] initWithString:(__bridge_transfer NSString*) encodedCFString];
    return encodedString;
}

#pragma mark - URL Param
- (NSString*)getURLParamValueForKey:(NSString*)key
{
    NSRange range = [self rangeOfString:[NSString stringWithFormat:@"(\\?|&)%@=([^&]*)", key] options:NSRegularExpressionSearch];
    if (range.length > 0) {
        range.location++;
        range.length--;
        NSString* keyAndEqual = [NSString stringWithFormat:@"%@=", key];
        return [[self substringWithRange:range] stringByReplacingOccurrencesOfString:keyAndEqual withString:@""];
    } else {
        return nil;
    }
}

- (NSString*)changeURLParamValue:(NSString*)value forKey:(NSString*)key
{
    NSRange range = [self rangeOfString:[NSString stringWithFormat:@"(\\?|&)%@=([^&]*)", key] options:NSRegularExpressionSearch];
    NSString* stringTmp = [NSString stringWithFormat:@"%@=%@", key, value];
    if (range.length > 0) {
        range.location++;
        range.length--;
        return [self stringByReplacingCharactersInRange:range withString:stringTmp];
    } else {
        if([self rangeOfString:@"?"].length > 0) {
            return [NSString stringWithFormat:@"%@&%@", self, stringTmp];
        } else {
            return [NSString stringWithFormat:@"%@?%@", self, stringTmp];
        }
    }
}

#pragma mark - Request
- (NSMutableDictionary*)dictionaryByRequest
{
    if ([self trim].length==0) {
        return nil;
    }
    
    NSURL *url = [NSURL URLWithString:self];
    if (url==nil) {
        return nil;
    }
    
    NSData *data = [NSData dataWithContentsOfURL:url];
    if (data) {
        id jsonObj = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        if (jsonObj && [jsonObj isKindOfClass:[NSDictionary class]]) {
            return (NSMutableDictionary*)jsonObj;
        }
    }
    
    return nil;
}
@end
