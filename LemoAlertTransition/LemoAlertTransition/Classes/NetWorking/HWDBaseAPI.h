//
//  HWDBaseAPI.h
//  ZhangXinMao-iOS
//
//  Created by 宇航 on 2018/3/6.
//  Copyright © 2018年 ZhangXinMao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
#import "WCTResponseError.h"
//#import "NSString+MD5.h"

#if DEBUG
#define kBaseURL @"http://dev.huaweidun.com:9029/api"
#else
#define kBaseURL @"http://dev.huaweidun.com:9029/api"
#endif

@interface HWDBaseAPI : NSObject

@property (nonatomic, copy) NSString *baseURL;
@property (nonatomic, copy) NSString *relativeURL;
@property (nonatomic, copy, readonly) NSString *wctBaseURL;
@property(nonatomic, assign) BOOL loadToken;

- (AFHTTPSessionManager *)wct_defaultAPISetupManager;
- (id)param;
- (NSString *)relativeURL;
- (void)apiPostWithCompletion:(void(^)(id responseObject))completion failure:(void(^)(NSError *error))failure;
- (void)apiGetWithCompletion:(void(^)(id responseObject))completion failure:(void(^)(NSError *error))failure;
@end
