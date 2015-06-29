//
//  NSDictionary+Additions.m
//  SHCategory
//
//  Created by Hayden Wang on 15/6/29.
//  Copyright (c) 2015年 YardLAN. All rights reserved.
//

#import "NSDictionary+Additions.h"
#import "NSString+Convert.h"
#import "NSString+Utils.h"
#import <float.h>

@implementation NSDictionary (Additions)
#pragma mark - Value For Key
- (NSString*)stringValueForKey:(NSString*)key
{
    id obj = [self valueForKey:key];
    if ([obj isKindOfClass:[NSString class]]) {
        return (NSString*)obj;
    }else if ([obj isKindOfClass:[NSNumber class]]){
        return [NSString stringOfNumber:obj withNumberStyle:NSNumberFormatterDecimalStyle];
    }
    return nil;
}

- (NSNumber*)numberValueForKey:(NSString*)key
{
    id obj = [self valueForKey:key];
    if ([obj isKindOfClass:[NSNumber class]]){
        return (NSNumber*)obj;
    }
    return nil;
}

- (NSInteger)integerValueForKey:(NSString*)key
{
    id obj = [self valueForKey:key];
    if ([obj isKindOfClass:[NSString class]]) {
        return [(NSString*)obj integerValueForce];
    }else if ([obj isKindOfClass:[NSNumber class]]){
        return [(NSNumber*)obj integerValue];
    }
    
    return NSIntegerMin;
}

- (float)floatValueForKey:(NSString*)key
{
    id obj = [self valueForKey:key];
    if ([obj isKindOfClass:[NSString class]] || [obj isKindOfClass:[NSNumber class]]) {
        return [obj floatValue];
    }
    return FLT_MIN;
}

- (double)doubleValueForKey:(NSString*)key
{
    id obj = [self valueForKey:key];
    if ([obj isKindOfClass:[NSString class]] || [obj isKindOfClass:[NSNumber class]]) {
        return [obj doubleValue];
    }
    return DBL_MIN;
}

- (NSDictionary*)dictionaryValueForKey:(NSString*)key
{
    id obj = [self valueForKey:key];
    if ([obj isKindOfClass:[NSDictionary class]]) {
        return (NSDictionary*)obj;
    }else if([obj isKindOfClass:[NSString class]]){
        id jsonObj = [(NSString*)obj JSONValue];
        if ([jsonObj isKindOfClass:[NSDictionary class]]) {
            return (NSDictionary*)jsonObj;
        }
    }
    return nil;
}

- (NSArray*)arrayValueForKey:(NSString*)key
{
    id obj = [self valueForKey:key];
    if ([obj isKindOfClass:[NSArray class]]) {
        return (NSArray*)obj;
    }else if([obj isKindOfClass:[NSString class]]){
        id jsonObj = [(NSString*)obj JSONValue];
        if ([jsonObj isKindOfClass:[NSArray class]]) {
            return (NSArray*)jsonObj;
        }
    }
    return nil;
}

#pragma mark - Convert
- (NSString*)JSONString
{
    NSData *data = [NSJSONSerialization dataWithJSONObject:self options:0 error:nil];
    if (data) {
        return  [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    }
    return nil;
}

#pragma mark - Request
+ (NSDictionary*)dictionaryWithContentsOfStringURL:(NSString *)stringURL
{
    if ([stringURL trim].length==0) {
        return nil;
    }
    
    NSURL *url = [NSURL URLWithString:stringURL];
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
