//
//  NSString+Convert.h
//  SHCategory
//
//  Created by Hayden Wang on 15/6/29.
//  Copyright (c) 2015年 YardLAN. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Convert)
#pragma mark - Number Format
+ (NSString*)stringOfNumber:(NSNumber*)number;
+ (NSString*)stringOfNumber:(NSNumber*)number withNumberStyle:(NSNumberFormatterStyle)style;
+ (NSString*)stringOfInt:(int)intValue;
+ (NSString*)stringOfInteger:(NSInteger)integer;
+ (NSString*)stringOfUInteger:(NSUInteger)integer;
- (NSInteger)integerValueForce;

#pragma mark - Date Format
+ (NSString*)stringOfDate:(NSDate*)date;
+ (NSString*)stringOfDate:(NSDate*)date withFormat:(NSString*)format;
- (NSDate*)convertToDateWithFormat:(NSString*)format;

#pragma mark - JSON
- (id)JSONValue;
@end
