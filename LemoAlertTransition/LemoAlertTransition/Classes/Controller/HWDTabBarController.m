//
//  HWDTabBarController.m
//  HWDGlasses
//
//  Created by 宇航 on 17/3/15.
//  Copyright © 2017年 HWD. All rights reserved.
//

#import "HWDTabBarController.h"
#import "MyController.h"
#import "AlertController.h"


@interface HWDTabBarController () <UITabBarControllerDelegate>
@end

@implementation HWDTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.delegate = self;
    
    [self addOneChildVc:[AlertController new] title:@"首页" image:nil selectedImage:nil titleAttributeDict:nil];
    [self addOneChildVc:[MyController new] title:@"我的" image:nil selectedImage:nil titleAttributeDict:nil];
    
}

/**
 * 添加一个子控制器
 * @param vc : 子控制器
 * @param title : 标题
 * @param image : 图片
 * @param selectedImage : 选中的图片
 */
- (void)addOneChildVc:(UIViewController *)vc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage titleAttributeDict:(NSDictionary *)attributeDict
{
    if (title) {
        vc.title = title;
    }
    
    if (image) {
        vc.tabBarItem.image = [UIImage imageNamed:image];
        vc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }

    vc.tabBarItem.imageInsets = UIEdgeInsetsMake(8, 0, -8, 0);
    if (attributeDict) {
        [vc.tabBarItem setTitleTextAttributes:attributeDict forState:UIControlStateSelected];
    }
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    [self addChildViewController:nav];
}

/**
 * 添加一个子控制器
 * @param vcClass : 子控制器的类名
 * @param title : 标题
 * @param image : 图片
 * @param selectedImage : 选中的图片
 */
- (void)addOneChildVcClass:(Class)vcClass title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage titleAttributeDict:(NSDictionary *)attributeDict {
    
    UIViewController *vc = [[vcClass alloc] init];
    [self addOneChildVc:vc title:title image:image selectedImage:selectedImage titleAttributeDict:(NSDictionary *)attributeDict];
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
    
//    [tabBarController.tabBarItem clearBadge];
//    [self.tabBarItem clearBadge];
//    self.tabBarItem.badgeValue = nil;
//    [[NSNotificationCenter defaultCenter] postNotificationName:kTabbarDidSelectsNotify object:nil];
    
}
- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController {
    return YES;
}


- (UIImage *) createNewImageWithColor:(UIImage *)image multiple:(CGFloat)multiple
 {
         CGFloat newMultiple = multiple;
         if (multiple == 0) {
                 newMultiple = 1;
             }
         else if((fabs(multiple) > 0 && fabs(multiple) < 1) || (fabs(multiple)>1 && fabs(multiple)<2))
             {
                     newMultiple = multiple;
                 }
         else
             {
                     newMultiple = 1;
                 }
         CGFloat w = image.size.width*newMultiple;
         CGFloat h = image.size.height*newMultiple;
         CGFloat scale = [UIScreen mainScreen].scale;
         UIImage *tempImage = nil;
         CGRect imageFrame = CGRectMake(0, 0, w, h);
         UIGraphicsBeginImageContextWithOptions(image.size, NO, scale);
         [[UIBezierPath bezierPathWithRoundedRect:imageFrame cornerRadius:0] addClip];
         [image drawInRect:imageFrame];
         tempImage = UIGraphicsGetImageFromCurrentImageContext();
         UIGraphicsEndImageContext();
         return tempImage;
     }
@end
