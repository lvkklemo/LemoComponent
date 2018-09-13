//
//  WCTErroResponserModel.h
//  MegLiveDemo
//
//  Created by Guo Zhi Cong on 12/02/2018.
//  Copyright © 2018 megvii. All rights reserved.
//

#import <Foundation/Foundation.h>
extern NSString *const WCTErrorResponseErrMsgKey;
extern NSString *const WCTErrorResponseRetCodeKey;
extern NSString *const WCTResponseErrorDomain;
extern NSString *const WCTResponseErrorValueSuccess;
extern NSString *const WCTResponseErrorValueFAILED;

@interface WCTResponseError : NSError

+ (NSError *)errorWithErrorDict:(NSDictionary *)dict;

@property (nonatomic, copy, readonly) NSString *errMsg;
@property (nonatomic, copy, readonly) NSString *retCode;

@end
