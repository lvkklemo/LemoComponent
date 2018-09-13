//
//  LoginAPI.m
//  ZhangXinMao-iOS
//
//  Created by Guo Zhi Cong on 08/03/2018.
//  Copyright © 2018 ZhangXinMao. All rights reserved.
//

#import "LoginAPI.h"

@interface LoginAPI()

@property (nonatomic, copy) NSString *userName;
@property (nonatomic, copy) NSString *password;


@end

@implementation LoginAPI

- (instancetype)initWithUserName:(NSString *)userName password:(NSString *)password {
    self = [self init];
    if (self) {
        _userName = userName;
        _password = password;
    }
    return self;
}

- (id)param {
    NSDictionary *dict = @{@"userName": _userName,
                           @"password": _password,
                           @"deviceId": @"iOS-test",
                           @"deviceType": @(0)
                           };
    return dict;
}

- (NSString *)relativeURL {
    return @"/Login";
}
@end
