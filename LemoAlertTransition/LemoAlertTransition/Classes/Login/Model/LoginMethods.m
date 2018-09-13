//
//  LoginMethods.m
//  HWDGlasses
//
//  Created by apple on 2017/4/11.
//  Copyright © 2017年 HWD. All rights reserved.
//

#import "LoginMethods.h"
#import "KHLoginController.h"
//#import "GTMBase64.h"
//#import "Qy3DES.h"

//#import "NSString+Trim.h"

static NSString *loginModelKey = @"LoginModelKey";
@implementation LoginMethods

+ (void)showLoginWithController:(UIViewController *)vc {
//    KHLoginController *loginVC = [[KHLoginController alloc]init];
//    [vc presentViewController:loginVC animated:YES completion:nil];
}

+ (void)setLoginModel:(LoginModel *)loginModel {
    [[NSUserDefaults standardUserDefaults] setObject:[NSKeyedArchiver archivedDataWithRootObject:loginModel] forKey:loginModelKey];
}

+ (LoginModel *)getLoginModel {
    NSData *data = [[NSUserDefaults standardUserDefaults] objectForKey:loginModelKey];
    LoginModel *loginModel = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    return loginModel;
}

+ (BOOL)judgeLogin {
    NSData *data = [[NSUserDefaults standardUserDefaults] objectForKey:loginModelKey];
    LoginModel *loginModel = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    return loginModel;
}

+ (void)logout {
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:loginModelKey];
}

+ (BOOL)isPassWordNumber:(NSString *)text {
#ifdef DEBUG
    if ([text isEqualToString:@"Password1"]) return YES;
#endif
    return YES;
}

+ (BOOL)isPhoneNumber:(NSString *)text {
#ifdef DEBUG
    if ([text isEqualToString:@"jerry123456"]) return YES;
#endif
    
    NSString *validMobileNum = @"^1(3[0-9]|4[0-9]|5[0-35-9]|7[0-9]|8[0-9])+[0-9]{8}";
    NSPredicate *regexTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", validMobileNum];
    return [regexTest evaluateWithObject:text];
}

@end
