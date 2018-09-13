//
//  RegisterAPI.h
//  ZhangXinMao-iOS
//
//  Created by Guo Zhi Cong on 08/03/2018.
//  Copyright © 2018 ZhangXinMao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HWDBaseAPI.h"

@interface RegisterAPI : HWDBaseAPI

//- (instancetype)initWithRequestModel:(RegisterAccountRequestModel *)requestModel;
- (instancetype)initWithDict:(NSDictionary *)dict;

@end
