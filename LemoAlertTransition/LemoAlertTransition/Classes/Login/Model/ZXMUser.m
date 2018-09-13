//
//  ZXMUser.m
//  ZhangXinMao-iOS
//
//  Created by Guo Zhi Cong on 08/03/2018.
//  Copyright © 2018 ZhangXinMao. All rights reserved.
//
#import "HWDConstant.h"
#import "ZXMUser.h"

@implementation ZXMUser
- (void)encodeWithCoder:(NSCoder *)aCoder {
    [self yy_modelEncodeWithCoder:aCoder];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    return [self yy_modelInitWithCoder:aDecoder];
}

- (NSString*)getIdNumberPSD{
    
    NSString *psdIdNumber = @"";
    if (_idNumber.length>15) {
        psdIdNumber = [_idNumber stringByReplacingCharactersInRange:NSMakeRange(6, 8) withString:@"********"];
    }else{
        psdIdNumber = _idNumber;
    }
    return psdIdNumber;
}

@end
