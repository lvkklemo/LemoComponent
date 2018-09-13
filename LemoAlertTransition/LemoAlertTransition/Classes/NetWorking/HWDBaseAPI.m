//
//  HWDBaseAPI.m
//  ZhangXinMao-iOS
//
//  Created by 宇航 on 2018/3/6.
//  Copyright © 2018年 ZhangXinMao. All rights reserved.
//

#import "HWDBaseAPI.h"
#import "LoginMethods.h"

@interface HWDBaseAPI ()

@property (nonatomic, copy, readwrite) NSString *wctBaseURL;

@end

@implementation HWDBaseAPI


- (NSString *)baseURL {
        if (!_baseURL) {
            
            _baseURL = kBaseURL;
        }
    return _baseURL;
}

- (NSString *)relativeURL {
    //    if (!_relativeURL) {
    //        _relativeURL = @"/proxy/FaceRec";
    //    }
    return _relativeURL;
}

- (NSString *)wctBaseURL {
    //#if DEBUG
    //    return @"http://localhost:8080";
    //#else
    //    return [NSString stringWithFormat:@"%@%@", self.baseURL, self.relativeURL];
    //#endif
    //    NSLog(@"%@", [NSString stringWithFormat:@"%@%@", self.baseURL, self.relativeURL]);
    return [NSString stringWithFormat:@"%@%@", self.baseURL, self.relativeURL];
}


- (AFHTTPSessionManager *)wct_defaultAPISetupManager {
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    return manager;
}

- (void)apiPostWithCompletion:(void(^)(id responseObject))completion failure:(void(^)(NSError *error))failure {
    
    AFHTTPSessionManager *manager = [self wct_defaultAPISetupManager];
    id param = [self param];
    if (!param) {
        NSAssert(false, @"param is nil, please set param");
        return;
    }
    
    if (_loadToken) {
        LoginModel*login = [LoginMethods getLoginModel];
         [manager.requestSerializer setValue:[NSString stringWithFormat:@"%@",login.accessToken] forHTTPHeaderField:@"Authorization"];
    }
    
    [manager POST:[self wctBaseURL] parameters:[self param] progress:^(NSProgress * _Nonnull uploadProgress) {

    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject){
        if (completion) {
            completion(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
    }];
}
- (void)apiGetWithCompletion:(void(^)(id responseObject))completion failure:(void(^)(NSError *error))failure {
    
    AFHTTPSessionManager *manager = [self wct_defaultAPISetupManager];
    id param = [self param];
    if (!param) {
        NSAssert(false, @"param is nil, please set param");
        return;
    }
    
    if (_loadToken) {
        LoginModel*login = [LoginMethods getLoginModel];
        [manager.requestSerializer setValue:[NSString stringWithFormat:@"%@",login.accessToken] forHTTPHeaderField:@"Authorization"];
    }
    
    
    [manager GET:[self wctBaseURL] parameters:[self param] progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (completion) {
            completion(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
    }];
    
}
- (id)param {
    return nil;
}

@end
