//
//  SHNSStringTests.m
//  SHCategory
//
//  Created by Hayden Wang on 15/6/29.
//  Copyright (c) 2015年 YardLAN. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "NSString+Convert.h"
#import "NSString+Utils.h"

@interface SHNSStringTests : XCTestCase

@end

@implementation SHNSStringTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)test01FormatDate {
    NSString *strOriginDate = @"2015-06-14 12:23:56";
    NSDate *date = [strOriginDate convertToDateWithFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *strDate = [NSString stringOfDate:date withFormat:@"yyyy-MM-dd HH:mm:ss"];
    if ([strDate isEqualToString:strOriginDate]) {
        XCTAssert(YES, @"Pass!");
    }else{
        XCTAssert(NO, @"Failed!");
    }
}

- (void)test02FormatInteger {
    NSString *strNumber = [NSString stringOfInteger:123];
    if ([strNumber isEqualToString:@"123"]) {
        XCTAssert(YES, @"Pass!");
    }else{
        XCTAssert(NO, @"Failed!");
    }
}

- (void)test03JSON {
    NSString *strDicJSON = @"{\"errno\":12,\"msg\":\"Not found!\"}";
    NSString *strArrJSON = @"[\"aaa\",\"bbb\"]";
    NSDictionary *dic = [strDicJSON JSONValue];
    NSArray *arr = [strArrJSON JSONValue];
    if (dic && arr && [dic isKindOfClass:[NSDictionary class]] && [arr isKindOfClass:[NSArray class]]) {
        NSLog(@"=== Dic:%@",dic);
        for (NSString *str in arr) {
            NSLog(@"=== Arr:%@",str);
        }
        XCTAssert(YES, @"Pass!");
    }else{
        XCTAssert(NO, @"Failed!");
    }
}

- (void)test04MD5 {
    NSString *strOrigin = @"This is a MD5 origin string!";
    NSString *strMD5 = [strOrigin MD5];
    if ([strMD5 isEqualToString:@"9a0988393a62dc03a728f251d10c43b3"]) {
        XCTAssert(YES, @"Pass!");
    }else{
        XCTAssert(NO, @"Failed!");
    }
}

- (void)test05Trim {
    NSString *strOrigin = @"   This is a origin string!          ";
    NSString *strTrimAll = [strOrigin trimAll];
    NSString *strTrim = [strOrigin trim];
    if ([strTrim isEqualToString:@"This is a origin string!"] && [strTrimAll isEqualToString:@"Thisisaoriginstring!"]) {
        XCTAssert(YES, @"Pass!");
    }else{
        XCTAssert(NO, @"Failed!");
    }
}

- (void)test06URLParamHandle
{
    NSString *strURL = @"http://www.yardlan.com/action.do?name=hayden&num=36&code=ejuz2YY3";
    strURL = [strURL changeURLParamValue:@"denty" forKey:@"name"];
    strURL = [strURL changeURLParamValue:@"Ejuz3yy3" forKey:@"code"];
    
    NSString *strName = [strURL getURLParamValueForKey:@"name"];
    NSString *strNum = [strURL getURLParamValueForKey:@"num"];
    NSString *strCode = [strURL getURLParamValueForKey:@"code"];
    if ([strName isEqualToString:@"denty"] && [strNum isEqualToString:@"36"] && [strCode isEqualToString:@"Ejuz3yy3"]) {
        XCTAssert(YES, @"Pass!");
    }else{
        XCTAssert(NO, @"Failed!");
    }
}

- (void)test07IntegerValueForce {
    NSString *strNumber = @"SK0120E01";
    NSInteger number = [strNumber integerValueForce];
    if (number==120) {
        XCTAssert(YES, @"Pass!");
    }else{
        XCTAssert(NO, @"Failed!");
    }
}

- (void)test08Request {
    NSString *strURL = @"http://www.weather.com.cn/adat/sk/101281601.html";
    NSDictionary *dic = [strURL dictionaryByRequest];
    if (dic && [dic isKindOfClass:[NSDictionary class]] && [dic valueForKey:@"weatherinfo"]) {
        XCTAssert(YES, @"Pass!");
    }else{
        XCTAssert(NO, @"Failed!");
    }
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
