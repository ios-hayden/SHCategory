//
//  UIView+Utils.m
//  SHCategory
//
//  Created by Hayden on 16/2/3.
//  Copyright © 2016年 YardLAN. All rights reserved.
//

#import "UIView+Utils.h"

@implementation UIView (Utils)
#pragma mark - Public Methods
- (void)removeAllSubviews
{
    NSArray *subviews = self.subviews;
    [subviews enumerateObjectsUsingBlock:^(UIView *view, NSUInteger idx, BOOL * _Nonnull stop) {
        [view removeFromSuperview];
    }];
}

- (void)removeSubviewsWithClass:(Class)viewClass
{
    if (viewClass == nil) {
        return;
    }
    NSArray *subviews = self.subviews;
    [subviews enumerateObjectsUsingBlock:^(UIView *view, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([view isKindOfClass:viewClass]) {
            [view removeFromSuperview];
        }else{
            [view removeSubviewsWithClass:viewClass];
        }
    }];
}

- (BOOL)removeSubview:(UIView*)subview
{
    if (subview == nil) {
        return NO;
    }
    
    NSArray *subviews = self.subviews;
    for (UIView *view in subviews) {
        if (view == subview) {
            [view removeAllSubviews];
            return YES;
        }else{
            BOOL removed = [view removeSubview:subview];
            if (removed) {
                return YES;
            }
        }
    }
    return NO;
}

- (NSArray<UIView*>*)subviewsForClass:(Class)viewClass
{
    if (viewClass == nil) {
        return nil;
    }
    NSMutableArray *muArray = [[NSMutableArray alloc]init];
    NSArray *subviews = [self.subviews copy];
    for (UIView *view in subviews) {
        if ([view isKindOfClass:viewClass]) {
            [muArray addObject:view];
        }
        NSArray *temp = [view subviewsForClass:viewClass];
        if (temp.count) {
            [muArray addObjectsFromArray:temp];
        }
    }
    if (muArray.count) {
        return [[NSArray alloc]initWithArray:muArray];
    }else{
        return nil;
    }
}

- (BOOL)containsView:(UIView*)view
{
    if (view == nil) {
        return NO;
    }
    
    NSArray *subviews = [self.subviews copy];
    for (UIView *subview in subviews) {
        if (view == subview) {
            return YES;
        }else{
            return [subview containsView:view];
        }
    }
    return NO;
}

- (BOOL)hasSubview:(UIView*)view
{
    return view.superview == self;
}

- (BOOL)isSubviewOfView:(UIView*)view
{
    return self.superview == view;
}

- (void)printHierarchy
{
    NSLog(@"%@", [self hierarchy]);
}

- (NSDictionary<NSString*, NSArray*>*)hierarchy
{
    NSString *key = [self customDescription];
    NSArray *value = [self subviewHierarchy];
    return @{key:value};
}

- (NSArray<NSDictionary*>*)subviewHierarchy
{
    NSArray *subviews = [self.subviews copy];
    NSMutableArray *muArray = [[NSMutableArray alloc]initWithCapacity:subviews.count];
    for (UIView *view in subviews) {
        [muArray addObject:[view hierarchy]];
    }
    return [[NSArray alloc]initWithArray:muArray];
}

- (UIImage *)snapshot
{
    UIGraphicsBeginImageContext(self.bounds.size);
    [self drawViewHierarchyInRect:self.bounds afterScreenUpdates:YES];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

#pragma mark - Private Methods
- (NSString*)customDescription
{
    return [NSString stringWithFormat:@"%@:(Tag:%ld, Frame:[%f, %f, %f, %f])", [self class], self.tag, self.frame.origin.x, self.frame.origin.y, self.frame.size.width, self.frame.size.height];
}
@end
