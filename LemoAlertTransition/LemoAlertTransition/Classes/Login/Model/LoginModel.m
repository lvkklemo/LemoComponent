//
//  LoginModel.m
//  HWDGlasses
//
//  Created by apple on 2017/4/11.
//  Copyright © 2017年 HWD. All rights reserved.
//

#import "LoginModel.h"
#import "YYModel.h"

@implementation LoginModel
- (void)encodeWithCoder:(NSCoder *)aCoder {
    [self yy_modelEncodeWithCoder:aCoder];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    return [self yy_modelInitWithCoder:aDecoder];
}

@end
