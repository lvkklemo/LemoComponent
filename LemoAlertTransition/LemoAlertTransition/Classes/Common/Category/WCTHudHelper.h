//
//  WCTHudHelper.h
//  MegLiveDemo
//
//  Created by Guo Zhi Cong on 06/02/2018.
//  Copyright © 2018 megvii. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <MBProgressHUD.h>

@interface WCTHudHelper (HWDHUDProgress)

+ (void)showInView:(UIView *)view withLabelText:(NSString *)text detailLabelText:(NSString *)text2 hideAfterDelay:(NSTimeInterval)delay completion:(MBProgressHUDCompletionBlock)completionBlock;
+ (void)showInView:(UIView *)view withLabelText:(NSString *)text hideAfterDelay:(NSTimeInterval)delay completion:(MBProgressHUDCompletionBlock)completionBlock;
+ (void)showInView:(UIView *)view hideAfterDelay:(NSTimeInterval)delay completion:(MBProgressHUDCompletionBlock)completionBlock;

@end
