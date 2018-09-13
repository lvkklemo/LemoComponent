//
//  LoginAPI.h
//  ZhangXinMao-iOS
//
//  Created by Guo Zhi Cong on 08/03/2018.
//  Copyright © 2018 ZhangXinMao. All rights reserved.
//

#import "HWDBaseAPI.h"

@interface LoginAPI : HWDBaseAPI

- (instancetype)initWithUserName:(NSString *)userName password:(NSString *)password;

@end
