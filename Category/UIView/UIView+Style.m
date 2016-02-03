//
//  UIView+Style.m
//  SHCategory
//
//  Created by Hayden on 16/2/3.
//  Copyright © 2016年 YardLAN. All rights reserved.
//

#import "UIView+Style.h"

@implementation UIView (Style)
+ (UIView*)viewWidthFrame:(CGRect)frame
{
    return [[UIView alloc] initWithFrame:frame];
}

+ (UIView*)lightGrayHorizontalLineWithWidth:(CGFloat)width
{
    return [self horizontalLineWithColor:[UIColor lightGrayColor] width:width];
}

+ (UIView*)horizontalLineWithColor:(UIColor*)color width:(CGFloat)width
{
    CGFloat height = [UIScreen mainScreen].scale > 1 ? 0.5 : 1;
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, width, height)];
    view.backgroundColor = color;
    return view;
}

+ (UIView*)lightGrayVerticalLineWithHeight:(CGFloat)height
{
    return [self verticalLineWithColor:[UIColor lightGrayColor] height:height];
}

+ (UIView*)verticalLineWithColor:(UIColor*)color height:(CGFloat)height
{
    CGFloat width = [UIScreen mainScreen].scale > 1 ? 0.5 : 1;
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, width, height)];
    view.backgroundColor = color;
    return view;
}
@end
