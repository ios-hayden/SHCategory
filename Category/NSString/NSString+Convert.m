//
//  NSString+Convert.m
//  SHCategory
//
//  Created by Hayden Wang on 15/6/29.
//  Copyright (c) 2015年 YardLAN. All rights reserved.
//

#import "NSString+Convert.h"
#import "NSString+Utils.h"

@implementation NSString (Convert)
#pragma mark - Number Format
+ (NSString*)stringOfNumber:(NSNumber*)number
{
    if (number==nil) {
        return nil;
    }
    
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc]init];
    return [numberFormatter stringFromNumber:number];
}

+ (NSString*)stringOfNumber:(NSNumber*)number withNumberStyle:(NSNumberFormatterStyle)style
{
    if (number==nil) {
        return nil;
    }
    
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc]init];
    numberFormatter.numberStyle = style;
    return [numberFormatter stringFromNumber:number];
}

+ (NSString*)stringOfInt:(int)intValue
{
    NSNumber *number = [NSNumber numberWithInt:intValue];
    return [NSString stringOfNumber:number];
}

+ (NSString*)stringOfInteger:(NSInteger)integer
{
    NSNumber *number = [NSNumber numberWithInteger:integer];
    return [NSString stringOfNumber:number];
}

+ (NSString*)stringOfUInteger:(NSUInteger)integer
{
    NSNumber *number = [NSNumber numberWithUnsignedInteger:integer];
    return [NSString stringOfNumber:number];
}

- (NSInteger)integerValueForce
{
    NSScanner *scanner = [NSScanner scannerWithString:self];
    [scanner scanUpToCharactersFromSet:[NSCharacterSet decimalDigitCharacterSet] intoString:nil];
    NSInteger number = NSIntegerMin ;
    [scanner scanInteger:&number];
    return number;
}

#pragma mark - Date Format
+ (NSString*)stringOfDate:(NSDate*)date
{
    return [NSString stringOfDate:date withFormat:nil];
}

+ (NSString*)stringOfDate:(NSDate*)date withFormat:(NSString*)format
{
    if (date==nil) {
        return nil;
    }
    format = [format trim].length>0 ? format : @"yyyy-MM-dd HH:mm:ss";
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:format];
    return [dateFormatter stringFromDate:date];
}

- (NSDate*)convertToDateWithFormat:(NSString*)format
{
    if ([self trim].length==0 || [format trim].length==0) {
        return nil;
    }
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:format];
    return [dateFormatter dateFromString:self];
}

#pragma mark - JSON
- (id)JSONValue
{
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
    return [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
}
@end
