//
//  TimingButton.h
//  HWDGlasses
//
//  Created by L on 2017/4/16.
//  Copyright © 2017年 HWD. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TimingButton : UIButton

//typedef void(^StateBlcok)(TimingButton *button);
//
//- (void)clickItem:(StateBlcok)block;

- (instancetype)initWithFrame:(CGRect)frame time:(NSInteger)time;
- (void)show;

@end
