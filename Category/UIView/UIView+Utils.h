//
//  UIView+Utils.h
//  SHCategory
//
//  Created by Hayden on 16/2/3.
//  Copyright © 2016年 YardLAN. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Utils)
/**
 *  删除所有子视图
 */
- (void)removeAllSubviews;

/**
 *  删除所有某类型子视图
 *
 *  @param viewClass 子视图类
 */
- (void)removeSubviewsWithClass:(Class)viewClass;

/**
 *  删除某子视图
 *
 *  @param subview 子视图对象
 *
 *  @return 是否移除
 */
- (BOOL)removeSubview:(UIView*)subview;

/**
 *  获得某类型的所有子视图对象
 *
 *  @param viewClass 视图类
 *
 *  @return 某类型的所有子视图对象
 */
- (NSArray<UIView*>*)subviewsForClass:(Class)viewClass;

/**
 *  判断视图树中是否包含某视图
 *
 *  @param view 判断是否被包含的视图对象
 *
 *  @return 视图树中是否包含某视图
 */
- (BOOL)containsView:(UIView*)view;

/**
 *  判断直系子视图是否有某视图
 *
 *  @param view 被包含的试图对象
 *
 *  @return 直系子视图是否有某视图
 */
- (BOOL)hasSubview:(UIView*)view;

/**
 *  判断是否是某视图的直系子视图
 *
 *  @param view 父视图
 *
 *  @return 是否是某视图的直系子视图
 */
- (BOOL)isSubviewOfView:(UIView*)view;

/**
 *  打印视图结构
 */
- (void)printHierarchy;

/**
 *  获得视图结构描述
 *
 *  @return 视图结构描述
 */
- (NSDictionary<NSString*, NSArray*>*)hierarchy;

/**
 *  获得所有子视图结构描述
 *
 *  @return 所有子视图结构描述
 */
- (NSArray<NSDictionary*>*)subviewHierarchy;

/**
 *  截图
 *
 *  @return 截图图像
 */
- (UIImage *)snapshot;
@end
