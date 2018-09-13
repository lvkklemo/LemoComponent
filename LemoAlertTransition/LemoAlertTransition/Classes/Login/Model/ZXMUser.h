//
//  ZXMUser.h
//  ZhangXinMao-iOS
//
//  Created by Guo Zhi Cong on 08/03/2018.
//  Copyright © 2018 ZhangXinMao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZXMUser : NSObject

@property (nonatomic, assign) NSInteger userId;
@property (nonatomic, copy) NSString *gender;
@property (nonatomic, copy) NSString *userName;
@property (nonatomic, copy) NSString *firstName;
@property (nonatomic, copy) NSString *avatar;
@property (nonatomic, copy) NSString *dateOfBirth;
@property (nonatomic, copy) NSString *fullName;
@property (nonatomic, copy) NSString *userType;
@property (nonatomic, copy) NSString *lastName;
@property (nonatomic, assign)BOOL isCertified;
@property (nonatomic, copy) NSString *idNumber;
@property (nonatomic, copy) NSString *idNumberPSD;
@property (nonatomic, copy) NSString *actualName;
@property (nonatomic, copy) NSString *palmCatCreditCardManagementId;
@property (nonatomic, assign)NSInteger registPercentage;
@property (nonatomic, copy) NSString *userLevel;

- (NSString*)getIdNumberPSD;

@end
