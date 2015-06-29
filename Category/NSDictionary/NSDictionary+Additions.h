//
//  NSDictionary+Additions.h
//  SHCategory
//
//  Created by Hayden Wang on 15/6/29.
//  Copyright (c) 2015年 YardLAN. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (Additions)
#pragma mark - Value For Key
- (NSString*)stringValueForKey:(NSString*)key;
- (NSNumber*)numberValueForKey:(NSString*)key;
- (NSInteger)integerValueForKey:(NSString*)key;
- (float)floatValueForKey:(NSString*)key;
- (double)doubleValueForKey:(NSString*)key;
- (NSDictionary*)dictionaryValueForKey:(NSString*)key;
- (NSArray*)arrayValueForKey:(NSString*)key;

#pragma mark - Convert
- (NSString*)JSONString;

#pragma mark - Request
+ (NSDictionary*)dictionaryWithContentsOfStringURL:(NSString *)stringURL;
@end
