//
//  UIView+Style.h
//  SHCategory
//
//  Created by Hayden on 16/2/3.
//  Copyright © 2016年 YardLAN. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Style)
/**
 *  实例化视图（便捷方法）
 *
 *  @param frame 视图frame
 *
 *  @return 视图实例
 */
+ (UIView*)viewWidthFrame:(CGRect)frame;

/**
 *  获得浅灰色横线视图
 *
 *  @param width 横线宽度
 *
 *  @return 浅灰色横线视图实例
 */
+ (UIView*)lightGrayHorizontalLineWithWidth:(CGFloat)width;

/**
 *  获得横线视图
 *
 *  @param color 横线颜色
 *  @param width 横线宽度
 *
 *  @return 横线视图实例
 */
+ (UIView*)horizontalLineWithColor:(UIColor*)color width:(CGFloat)width;

/**
 *  获得浅灰色竖线视图
 *
 *  @param height 竖线高度
 *
 *  @return 浅灰色竖线视图实例
 */
+ (UIView*)lightGrayVerticalLineWithHeight:(CGFloat)height;

/**
 *  获得竖线视图
 *
 *  @param color  竖线颜色
 *  @param height 竖线高度
 *
 *  @return 竖线视图实例
 */
+ (UIView*)verticalLineWithColor:(UIColor*)color height:(CGFloat)height;
@end
