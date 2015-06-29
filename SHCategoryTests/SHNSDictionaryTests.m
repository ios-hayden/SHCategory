//
//  SHNSDictionaryTests.m
//  SHCategory
//
//  Created by Hayden Wang on 15/6/29.
//  Copyright (c) 2015年 YardLAN. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "NSString+Convert.h"
#import "NSDictionary+Additions.h"

@interface SHNSDictionaryTests : XCTestCase

@end

@implementation SHNSDictionaryTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)test01ValueForKey {
    NSString *strJSON = @"{\"errno\":10,\"msg\":\"Test Msg\",\"price\":\"100.120\",\"user\":{\"name\":\"Hayden\",\"age\":20},\"items\":[\"a\",\"b\",\"c\"]}";
    NSDictionary *dic = [strJSON JSONValue];
    NSInteger iErrno = [dic integerValueForKey:@"msg"];
    if (iErrno == NSIntegerMin) {
        iErrno = [dic integerValueForKey:@"errno"];
        NSString *strMsg = [dic stringValueForKey:@"msg"];
        double fPrice = [dic doubleValueForKey:@"price"];
        NSDictionary *dicUser = [dic dictionaryValueForKey:@"user"];
        NSArray *arrayItems = [dic arrayValueForKey:@"items"];
        NSDictionary *dicTemp = [dic dictionaryValueForKey:@"items"];
        NSArray *arrayTemp = [dic arrayValueForKey:@"test"];
        BOOL bPass = iErrno==10 && [strMsg isEqualToString:@"Test Msg"] && fPrice==100.12 && [dicUser valueForKey:@"name"] && arrayItems.count==3 && dicTemp==nil && arrayTemp==nil;
        XCTAssert(bPass);
    }else{
        XCTAssert(NO, @"Failed!");
    }
}

- (void)test02JSONConvert {
    NSString *strJSON = @"{\"errno\":10,\"msg\":\"Test Msg\",\"price\":\"100.120\",\"user\":{\"name\":\"Hayden\",\"age\":20},\"items\":[\"a\",\"b\",\"c\"]}";
    NSDictionary *dicJSON = [strJSON JSONValue];
    NSString *strConvert = [dicJSON JSONString];
    NSDictionary *dicConvert = [strConvert JSONValue];
    if ([dicConvert arrayValueForKey:@"items"].count==3) {
        XCTAssert(YES, @"Pass!");
    }else{
        XCTAssert(NO, @"Failed!");
    }
}

- (void)test03Request {
    NSString *strURL = @"http://www.weather.com.cn/adat/sk/101281601.html";
    NSDictionary *dic = [NSDictionary dictionaryWithContentsOfStringURL:strURL];
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
