//
//  RegisterTopView.h
//  JiuZhouDianTi-iOS
//
//  Created by 宇航 on 2018/8/2.
//  Copyright © 2018年 HWD. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HWRegisterButton.h"

@interface RegisterTopView : UIView
@property(nonatomic,weak) HWRegisterButton * firstButton;
@property(nonatomic,weak) HWRegisterButton * secondButton;
@property(nonatomic,weak) HWRegisterButton * thirdButton;
@property(nonatomic,weak) HWRegisterButton * fourButton;

@property(nonatomic,weak) UIView * leftLine;
@property(nonatomic,weak) UIView * rightLine;
@property(nonatomic,weak) UIView * lineView;
@end
