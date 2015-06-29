//
//  NSString+Utils.h
//  SHCategory
//
//  Created by Hayden Wang on 15/6/29.
//  Copyright (c) 2015年 YardLAN. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Utils)
#pragma mark - Trim
- (NSString*)trimAll;
- (NSString*)trim;

#pragma mark - Encode
- (NSString*)MD5;
- (NSString*)URLEncode;

#pragma mark - URL Param
- (NSString*)getURLParamValueForKey:(NSString*)key;
- (NSString*)changeURLParamValue:(NSString*)value forKey:(NSString*)key;

#pragma mark - Request
- (NSDictionary*)dictionaryByRequest;

@end
