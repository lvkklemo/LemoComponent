//
//  InitiateVerificationAPI.m
//  ZhangXinMao-iOS
//
//  Created by Guo Zhi Cong on 09/03/2018.
//  Copyright © 2018 ZhangXinMao. All rights reserved.
//

#import "InitiateVerificationAPI.h"

@interface InitiateVerificationAPI ()

@property (nonatomic, copy, readwrite) NSString *mobileNumber;
@property (nonatomic, assign, readwrite) InitiateVerificationAPIType verificationType;


@end

@implementation InitiateVerificationAPI

- (instancetype)initWithMobileNumber:(NSString *)mobileNumber {
    self = [self initWithMobileNumber:mobileNumber verificationType:InitiateVerificationAPITypeRegister];
    if (self) {
    }
    return self;
}

- (instancetype)initWithMobileNumber:(NSString *)mobileNumber verificationType:(InitiateVerificationAPIType) verificationType{
    self = [self init];
    if (self) {
        _mobileNumber = [mobileNumber copy];
        _verificationType = verificationType;
    }
    return self;
}

- (NSString *)relativeURL {
    return @"/Register/InitiateVerification";
}

- (id)param {
    NSDictionary *dict = @{@"phoneNumber" : _mobileNumber,
                           @"verificationType": @(_verificationType)
                           };
    return dict;
}
@end

