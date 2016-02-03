//
//  UIWindow+Additions.h
//  SHCategory
//
//  Created by Hayden Wang on 15/8/12.
//  Copyright (c) 2015年 YardLAN. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIWindow (Additions)
@property (nonatomic, strong, readonly) UIViewController *visibleViewController;
@property (nonatomic, strong, readonly) UINavigationController *visibleNavigationController;
@property (nonatomic, strong, readonly) UITabBarController *visibleTabBarController;
@end
