//
//  RegisterAPI.m
//  ZhangXinMao-iOS
//
//  Created by Guo Zhi Cong on 08/03/2018.
//  Copyright © 2018 ZhangXinMao. All rights reserved.
//

#import "RegisterAPI.h"
#import "YYModel.h"

@interface RegisterAPI ()

@property (nonatomic, strong) NSDictionary *dict;
@end

@implementation RegisterAPI

//- (instancetype)initWithRequestModel:(RegisterAccountRequestModel *)requestModel {
//    self = [self init];
//    if (self) {
//        _requestModel = requestModel;
//    }
//    return self;
//}

- (instancetype)initWithDict:(NSDictionary *)dict{
    self = [self init];
    if (self) {
        _dict = dict;
    }
    return self;
}

- (id)param {
    return _dict;
}

- (NSString *)relativeURL {
    return @"/Regist";
}

@end
