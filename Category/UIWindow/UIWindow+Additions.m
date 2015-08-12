//
//  UIWindow+Additions.m
//  SHCategory
//
//  Created by Hayden Wang on 15/8/12.
//  Copyright (c) 2015年 YardLAN. All rights reserved.
//

#import "UIWindow+Additions.h"

@implementation UIWindow (Additions)
- (UIViewController*)visibleViewController
{
    UIViewController *rootViewController = self.rootViewController;
    return [UIWindow getVisibleViewControllerFrom:rootViewController];
}

- (UINavigationController*)visibleNavigationController
{
    UIViewController *vc = self.visibleViewController;
    if ([vc isKindOfClass:[UINavigationController class]]) {
        return (UINavigationController*)vc;
    }
    return vc.navigationController;
}

+ (UIViewController *) getVisibleViewControllerFrom:(UIViewController *) vc {
    if ([vc isKindOfClass:[UINavigationController class]]) {
        return [UIWindow getVisibleViewControllerFrom:[((UINavigationController *) vc) visibleViewController]];
    } else if ([vc isKindOfClass:[UITabBarController class]]) {
        return [UIWindow getVisibleViewControllerFrom:[((UITabBarController *) vc) selectedViewController]];
    } else {
        if (vc.presentedViewController) {
            return [UIWindow getVisibleViewControllerFrom:vc.presentedViewController];
        } else {
            return vc;
        }
    }
}
@end
