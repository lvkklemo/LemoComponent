//
//  RegisterTopView.m
//  JiuZhouDianTi-iOS
//
//  Created by 宇航 on 2018/8/2.
//  Copyright © 2018年 HWD. All rights reserved.
//

#import "RegisterTopView.h"
#import "HWDConstant.h"

@interface RegisterTopView()

@end

@implementation RegisterTopView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUPUI];
    }
    return self;
}

- (void)setUPUI{
    
    self.backgroundColor = NavThemeColor;
    UIView*lineView=[[UIView alloc] initWithFrame:CGRectMake(60, self.height/2, KScreenWidth-120, 0.5)];
    [self addSubview:lineView];
    lineView.backgroundColor=DefaultColor;
    _lineView=lineView;
    
    HWRegisterButton*firstButton = [[HWRegisterButton alloc] initWithFrame:CGRectMake(-30, -10, 60, 40)];
    [lineView addSubview:firstButton];
    _firstButton=firstButton;
    [firstButton setImage:[UIImage imageNamed:@"register_icon02"] forState:UIControlStateNormal];
    [firstButton setTitle:@"手机验证" forState:UIControlStateNormal];
    
    HWRegisterButton*secondButton = [[HWRegisterButton alloc] initWithFrame:CGRectMake(lineView.width*0.33-30, -10, firstButton.width, firstButton.height)];
    [lineView addSubview:secondButton];
    _secondButton=secondButton;
    [secondButton setImage:[UIImage imageNamed:@"register_icon01"] forState:UIControlStateNormal];
    [secondButton setTitle:@"设置密码" forState:UIControlStateNormal];

    HWRegisterButton*thirdButton = [[HWRegisterButton alloc] initWithFrame:CGRectMake(lineView.width*0.66-30, -10, firstButton.width, firstButton.height)];
    [lineView addSubview:thirdButton];
    _thirdButton=thirdButton;
    [thirdButton setImage:[UIImage imageNamed:@"register_icon01"] forState:UIControlStateNormal];
    [thirdButton setTitle:@"真实姓名" forState:UIControlStateNormal];
    
    HWRegisterButton*fourButton = [[HWRegisterButton alloc] initWithFrame:CGRectMake(lineView.width-24, firstButton.y, firstButton.width, firstButton.height)];
    [lineView addSubview:fourButton];
    _fourButton=fourButton;
    [fourButton setImage:[UIImage imageNamed:@"register_icon01"] forState:UIControlStateNormal];
    [fourButton setTitle:@"账号说明" forState:UIControlStateNormal];

    
}


-(void)initButton:(UIButton*)btn{
    btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;//使图片和文字水平居中显示
    [btn setTitleEdgeInsets:UIEdgeInsetsMake(btn.imageView.frame.size.height ,-btn.imageView.frame.size.width, 0.0,0.0)];//文字距离上边框的距离增加imageView的高度，距离左边框减少imageView的宽度，距离下边框和右边框距离不变
    [btn setImageEdgeInsets:UIEdgeInsetsMake(0.0, 0.0,0.0, -btn.titleLabel.bounds.size.width)];//图片距离右边框距离减少图片的宽度，其它不边
}

@end
