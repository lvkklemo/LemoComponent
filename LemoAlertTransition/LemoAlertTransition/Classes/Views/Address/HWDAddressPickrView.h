//
//  HWDAddressPickrView.h
//  MeiJiaAPP-iOS
//
//  Created by 彭倩倩 on 2018/7/2.
//  Copyright © 2018年 HWD. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^AddressBlcok)(NSString *province,NSString *city,NSString *area);

@interface HWDAddressPickrView : UIView
@property (nonatomic, copy) AddressBlcok addressBlock;


/** 弹出页面 */
- (void)showView;

@end
