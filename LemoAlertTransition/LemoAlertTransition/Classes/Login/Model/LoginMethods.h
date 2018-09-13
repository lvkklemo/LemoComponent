//
//  LoginMethods.h
//  HWDGlasses
//
//  Created by apple on 2017/4/11.
//  Copyright © 2017年 HWD. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "LoginModel.h"

@interface LoginMethods : NSObject

+ (void)showLoginWithController:(UIViewController *)vc;

+ (void)setLoginModel:(LoginModel *)loginModel;

+ (LoginModel *)getLoginModel;

+ (BOOL)judgeLogin;

+ (void)logout;

+ (BOOL)isPhoneNumber:(NSString *)text;

+ (BOOL)isPassWordNumber:(NSString *)text;

+ (NSString*)telePhoneNumber3DES:(NSString*)phoneNumString;

@end
