//
//  NSString+WCTPasswordRegExp.m
//  MegLiveDemo
//
//  Created by Guo Zhi Cong on 16/02/2018.
//  Copyright © 2018 megvii. All rights reserved.
//

#import "NSString+HWDPasswordRegExp.h"

@implementation NSString (HWDPasswordRegExp)

- (BOOL)isValidHWDUserPassword {
//    NSString *regex = @"^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)[^]{6,32}$";
    NSString *regex = @"^[a-zA-Z0-9]+$";
//    NSString *regex = @"^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)[a-zA-Z\\d]{8,32}$";
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [predicate evaluateWithObject:self];
}

@end
