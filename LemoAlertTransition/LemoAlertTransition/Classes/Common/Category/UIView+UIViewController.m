//
//  UIView+UIViewController.m
//  YXYMovie
//
//  Created by imac on 15/8/23.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import "UIView+UIViewController.h"

@implementation UIView (UIViewController)

- (UIViewController *)viewController
{
    UIResponder *next = self.nextResponder;
    do {
        if ([next isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)next;
        }
        
        next = next.nextResponder;
    } while (next);
    return (UIViewController *)next;
}

@end
