//
//  TimingButton.m
//  HWDGlasses
//
//  Created by L on 2017/4/16.
//  Copyright © 2017年 HWD. All rights reserved.
//

#import "TimingButton.h"
#define kRegisterDoctorGetVarificationCodeTimeInterval 60

@interface TimingButton ()

//@property (nonatomic ,strong) StateBlcok stateBlcok;
@property (nonatomic, weak) NSTimer *timer;
@property(nonatomic,assign) NSInteger counter;

@end

@implementation TimingButton

- (instancetype)initWithFrame:(CGRect)frame time:(NSInteger)time {
    self = [super initWithFrame:frame];
    if (self) {
        self.counter=time;;
        [self setTitle:[NSString stringWithFormat:@"%lds",(unsigned long)time] forState:UIControlStateNormal];
        [self setTitle:@"获取验证码" forState:UIControlStateNormal];
        [self setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    }
    return self;
}

- (void)show {
    [self.timer fire];
}

- (void)timeFire {
    if (_counter == 0) {
        [self.timer invalidate];
        self.timer=nil;
        _counter = kRegisterDoctorGetVarificationCodeTimeInterval;
        [self setupGetVerificationCodeText];
    }else{
        _counter--;
        [self setupGetVerificationCodeText];
    }
}


- (void)setupGetVerificationCodeText{
   
    [self setTitle:[NSString stringWithFormat:@"%lds",(unsigned long)_counter] forState:UIControlStateNormal];
    [self setTitle:[NSString stringWithFormat:@"%lds",(unsigned long)_counter] forState:UIControlStateSelected];
}

-(NSTimer *)timer{
    
    if ([_timer isValid]) {
        return _timer;
    }
    
    self.timer = nil;
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timeFire) userInfo:nil repeats:YES];
    self.timer = timer;
    return _timer;
}

@end
