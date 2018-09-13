//
//  HWRegisterContentView.h
//  JiuZhouDianTi-iOS
//
//  Created by 宇航 on 2018/8/2.
//  Copyright © 2018年 HWD. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VertifyView.h"
#import "SetPsdView.h"
#import "RealNameView.h"
#import "AccountExplainView.h"

@interface HWRegisterContentView : UIView

@property(nonatomic,weak) UIScrollView * scrollView;
@property(nonatomic,weak)VertifyView * vertifyView;
@property(nonatomic,weak)SetPsdView * psdView;
@property(nonatomic,weak)RealNameView * realNameView;
@property(nonatomic,weak)AccountExplainView * explainView;

@end
