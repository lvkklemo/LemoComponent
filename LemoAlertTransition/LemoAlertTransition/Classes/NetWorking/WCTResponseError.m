//
//  WCTErroResponserModel.m
//  MegLiveDemo
//
//  Created by Guo Zhi Cong on 12/02/2018.
//  Copyright © 2018 megvii. All rights reserved.
//

#import "WCTResponseError.h"

NSString *const WCTErrorResponseErrMsgKey = @"errMsg";
NSString *const WCTErrorResponseRetCodeKey = @"retCode";
NSString *const WCTResponseErrorDomain = @"com.wisecotech.reponseError";
NSString *const WCTResponseErrorValueSuccess = @"SUCCESS";
NSString *const WCTResponseErrorValueFAILED = @"FAILED";



@interface WCTResponseError ()

@property (nonatomic, copy, readwrite) NSString *errMsg;
@property (nonatomic, copy, readwrite) NSString *retCode;

@end

@implementation WCTResponseError

+ (instancetype)errorWithErrorDict:(NSDictionary *)dict {
    NSString *errMsg = nil;
    NSString *rectCode = nil;
    if ([dict objectForKey:WCTErrorResponseErrMsgKey]) {
        errMsg = dict[WCTErrorResponseErrMsgKey];
    }
    if ([dict objectForKey:WCTErrorResponseRetCodeKey]) {
        rectCode = dict[WCTErrorResponseRetCodeKey];
    }
    NSDictionary *errorDict = @{WCTErrorResponseErrMsgKey:errMsg?:[NSNull null],
                                WCTErrorResponseRetCodeKey:rectCode?:[NSNull null]
                                };
    
    WCTResponseError *error = [[WCTResponseError alloc] initWithDomain :WCTResponseErrorDomain code:-1 userInfo:[errorDict copy]];
    return error;
}

@end
