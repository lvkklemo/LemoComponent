//
//  WCTHudHelper.m
//  MegLiveDemo
//
//  Created by Guo Zhi Cong on 06/02/2018.
//  Copyright © 2018 megvii. All rights reserved.
//

#import "MBProgressHUD+HWDHUDProgress.h"

@implementation MBProgressHUD (HWDHUDProgress)

+ (void)showInView:(UIView *)view withLabelText:(NSString *)text detailLabelText:(NSString *)text2 hideAfterDelay:(NSTimeInterval)delay completion:(MBProgressHUDCompletionBlock)completionBlock{
    MBProgressHUD * theHud = ({
        MBProgressHUD *hud = [MBProgressHUD HUDForView:view]?:[[MBProgressHUD alloc] initWithView:view];
        hud.removeFromSuperViewOnHide = YES;
        if (!text || !text.length || [text isEqual:[NSNull null]]) {
            hud.mode = MBProgressHUDModeIndeterminate;
        }else{
            hud.mode = MBProgressHUDModeText;
            //            [text boundingRectWithSize:CGSizeMake(kWCTHUDScreenWidth, kWCTHUDScreenHeight) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingTruncatesLastVisibleLine attributes:nil context:nil];
            hud.label.text = text;
            //            hud.label.text labelText = text;
            
            if (text2 || text2.length || ![text2 isEqual:[NSNull null]]) {
                hud.detailsLabel.text = text2;
                //                hud.detailsLabel.text detailsLabelText = text2;
                
            }
        }
        if (completionBlock) {
            hud.completionBlock = completionBlock;
        }
        if (!hud.superview) {
            [view addSubview:hud];
        }
        hud;
        
    });
    dispatch_async(dispatch_get_main_queue(), ^{
        [theHud showAnimated:YES];
        if (delay > 0) {
            [theHud hideAnimated:YES afterDelay:delay];
        }
    });
    
}

+ (void)showInView:(UIView *)view withLabelText:(NSString *)text hideAfterDelay:(NSTimeInterval)delay completion:(MBProgressHUDCompletionBlock)completionBlock{
    [self showInView:view withLabelText:text detailLabelText:nil hideAfterDelay:delay completion:completionBlock];
}

+ (void)showInView:(UIView *)view hideAfterDelay:(NSTimeInterval)delay completion:(MBProgressHUDCompletionBlock)completionBlock{
    [self showInView:view withLabelText:nil hideAfterDelay:delay completion:completionBlock];
}

//+ (void)showHUDWithLogicErrorMessage:(NSString * (^)
//                                      (NSString *code, NSString *msg))logicErrorHandler
//                  serverErrorMessage:(NSString * (^)
//                                      (NSString *code, NSString *msg))serverErrorHandler
//                              inView:(UIView *)view
//                             byError:(NSError *)error {
//    
//    if (![error.domain isEqualToString:WCTResponseErrorDomain]) {
//        [MBProgressHUD showInView:view withLabelText:@"网络错误，请重试" hideAfterDelay:1.2 completion:nil];
//        return;
//    }
//    
//    NSString *message = @"";
//    NSString *code =
//    [error.userInfo objectForKey:WCTErrorResponseRetCodeKey]?error.userInfo[WCTErrorResponseRetCodeKey]:@"";
//    NSString *msg = [error.userInfo objectForKey:WCTErrorResponseErrMsgKey]?error.userInfo[WCTErrorResponseErrMsgKey]:@"";
//    
//    if ([code isEqualToString:WCTResponseErrorValueFAILED]) {
//        if (logicErrorHandler) {
//            message = logicErrorHandler(code,msg);
//        } else {
//            message = msg?:@"提交失败，请重试";
//        }
//    } else {
//        if (serverErrorHandler) {
//            message = serverErrorHandler(code,msg);
//        } else {
//            message = @"服务器错误，请重试";
//        }
//        
//    }
//    [MBProgressHUD showInView:view withLabelText:message hideAfterDelay:1.2 completion:nil];
//}

@end
