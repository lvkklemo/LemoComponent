//
//  LoginModel.h
//  HWDGlasses
//
//  Created by apple on 2017/4/11.
//  Copyright © 2017年 HWD. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZXMUser.h"

@interface LoginModel : NSObject

@property (nonatomic, copy) NSString *accessToken;
@property (nonatomic, copy) NSString *refreshToken;
@property (nonatomic, copy) NSString *createdDate;
@property (nonatomic, copy) NSString *expiredDate;

@property (nonatomic, strong) ZXMUser * user;

@end
