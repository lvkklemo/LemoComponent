//
//  UIBarButtonItem+Extension.h
//
//  Created by lkk on 14/8/16.
//  Copyright (c) 2014年 ldu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Extension)
/**
 *  通过一张图片返回一个UIBarButtonItem
 *
 *  @param imageName <#imageName description#>
 *
 *  @return <#return value description#>
 */
+ (instancetype)itemWithImageName:(NSString *)imageName target:(id)target action:(SEL)action;

/**
 *  通过一张图片与文字返回一个UIBarButtonItem
 *
 *  @param imageName <#imageName description#>
 *  @param title     <#title description#>
 *  @param target    <#target description#>
 *  @param action    <#action description#>
 *
 *  @return <#return value description#>
 */
+ (instancetype)itemWithImageName:(NSString *)imageName title:(NSString *)title target:(id)target action:(SEL)action;

+ (instancetype)itemWithIName:(NSString *)name color:(UIColor*)color target:(id)target action:(SEL)action;

@end

//[self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17],NSForegroundColorAttributeName:[UIColor whiteColor]}];
//[self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
