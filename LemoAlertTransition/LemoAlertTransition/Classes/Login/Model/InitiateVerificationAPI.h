//
//  InitiateVerificationAPI.h
//  ZhangXinMao-iOS
//
//  Created by Guo Zhi Cong on 09/03/2018.
//  Copyright © 2018 ZhangXinMao. All rights reserved.
//

#import "HWDBaseAPI.h"

typedef NS_ENUM(NSInteger, InitiateVerificationAPIType) {
    InitiateVerificationAPITypeRegister = 0,
    InitiateVerificationAPITypeResetPassword = 1,
    InitiateVerificationAPITypePhoneLogin
};

@interface InitiateVerificationAPI : HWDBaseAPI

- (instancetype)initWithMobileNumber:(NSString *)mobileNumber;

- (instancetype)initWithMobileNumber:(NSString *)mobileNumber verificationType:(InitiateVerificationAPIType) verificationType;

@end
