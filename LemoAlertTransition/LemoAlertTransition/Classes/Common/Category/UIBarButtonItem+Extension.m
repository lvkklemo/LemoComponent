//
//  UIBarButtonItem+Extension.m
//
//  Created by lkk on 14/8/16.
//  Copyright (c) 2014年 ld. All rights reserved.
//

#import "UIBarButtonItem+Extension.h"
#import "UIViewExt.h"
//#import "UIView+CGRectUtils.h"

@implementation UIBarButtonItem (Extension)

+ (instancetype)itemWithImageName:(NSString *)imageName target:(id)target action:(SEL)action{
    UIButton *button = [[UIButton alloc] init];
    //设置不同状态的image
    [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@_highlighted",imageName]] forState:UIControlStateHighlighted];
    //根据图片大小设置当前button的大小
    button.size = button.currentImage.size;
    //添加点击事件
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return [[UIBarButtonItem alloc] initWithCustomView:button];
}

+ (instancetype)itemWithIName:(NSString *)name color:(UIColor*)color target:(id)target action:(SEL)action{
    UIButton *button = [[UIButton alloc] init];
    //设置不同状态的image
    [button setTitle:name forState:UIControlStateNormal];
    [button setTitleColor:color forState:UIControlStateNormal];
    [button setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    [button sizeToFit];
    //根据图片大小设置当前button的大小
    //button.size = button.currentImage.size;
    //添加点击事件
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return [[UIBarButtonItem alloc] initWithCustomView:button];
}

+ (instancetype)itemWithImageName:(NSString *)imageName title:(NSString *)title target:(id)target action:(SEL)action{
    
    UIButton *button = [[UIButton alloc] init];
    //button.backgroundColor = [UIColor lightGrayColor];
    button.frame = CGRectMake(0, 0, 60, 20);
    //设置不同状态的image
    [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@_highlighted",imageName]] forState:UIControlStateHighlighted];
    
    button.imageView.contentMode = UIViewContentModeLeft;
    //设置title
    [button setTitle:title forState:UIControlStateNormal];
    
    //设置title不同状态的颜色
    [button setTitleColor:[UIColor orangeColor] forState:UIControlStateHighlighted];
    
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    //根据内容调整大小
//    [button sizeToFit];
    
    //添加点击事件
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return [[UIBarButtonItem alloc] initWithCustomView:button];
    
    
}


@end
