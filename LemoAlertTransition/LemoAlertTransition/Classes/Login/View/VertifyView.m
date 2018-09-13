//
//  VertifyView.m
//  JiuZhouDianTi-iOS
//
//  Created by 宇航 on 2018/8/2.
//  Copyright © 2018年 HWD. All rights reserved.
//

#import "VertifyView.h"
#import "HWDConstant.h"
#import "LoginTextField.h"
#import "TimingButton.h"

@interface VertifyView()<UIScrollViewDelegate,UITextFieldDelegate>
@property(nonatomic,weak) TimingButton *verifyBtn;
@end

@implementation VertifyView

- (instancetype)initWithFrame:(CGRect)frame{
    self =[super initWithFrame:frame];
    if (self) {
        [self phoneVertifyView];
    }
    return self;
}

- (void)phoneVertifyView{
    
    UIView*vertifyView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, self.height)];
    [self addSubview:vertifyView];
    vertifyView.backgroundColor=[UIColor groupTableViewBackgroundColor];
    
    UIView* contentView = [[UIView alloc] initWithFrame:CGRectMake(0, 20, KScreenWidth, 80)];
    [vertifyView addSubview:contentView];
    contentView.backgroundColor=[UIColor whiteColor];
    
    LoginTextField*phoneNum = [LoginTextField creatLoginTextFieldWithFrame:CGRectMake(70, 0, KScreenWidth-80, 40) Placeholder:@"请输入手机号" LeftImageName:@"Mine_icon01" SelectedLeftImageName:@"Mine_icon01"];
    phoneNum.delegate = self;
    [contentView addSubview:phoneNum];
    phoneNum.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    UIView*line=[[UIView alloc] initWithFrame:CGRectMake(0, phoneNum.bottom, KScreenWidth, 1)];
    line.backgroundColor=[UIColor groupTableViewBackgroundColor];
    [contentView addSubview:line];
    
    LoginTextField*codeNum = [LoginTextField creatLoginTextFieldWithFrame:CGRectMake(70, line.bottom, KScreenWidth-80, 40) Placeholder:@"请输入验证码" LeftImageName:@"Mine_icon01" SelectedLeftImageName:@"Mine_icon01"];
    codeNum.delegate = self;
    [contentView addSubview:codeNum];
    codeNum.clearButtonMode = UITextFieldViewModeNever;
    
    TimingButton*timeBtn = [[TimingButton alloc] initWithFrame:CGRectMake(KScreenWidth-90, line.bottom+4, 80, 30) time:60];
    _verifyBtn=timeBtn;
    timeBtn.titleLabel.font=[UIFont systemFontOfSize:14];
    [timeBtn setTitleColor:NavThemeColor forState:UIControlStateNormal];
    [contentView addSubview:timeBtn];
    [timeBtn addTarget:self action:@selector(timeClick) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton*nextButton = [[UIButton alloc] initWithFrame:CGRectMake(40, contentView.bottom+40, KScreenWidth-80, 40)];
    [vertifyView addSubview:nextButton];
    [nextButton setTitle:@"下一步" forState:UIControlStateNormal];
    nextButton.backgroundColor=NavThemeColor;
    nextButton.layer.cornerRadius=nextButton.height/2;
    _nextButton = nextButton;
    
    //《》
    UILabel*dtprotocol = [[UILabel alloc] initWithFrame:CGRectMake(0, nextButton.bottom+30, KScreenWidth, 20)];
    NSString*text=@"注册代表您已阅读并同意《地铁管家协议》";
    dtprotocol.font=[UIFont systemFontOfSize:13];
    dtprotocol.textColor=[UIColor grayColor];
    dtprotocol.textAlignment = NSTextAlignmentCenter;
    [vertifyView addSubview:dtprotocol];
    NSDictionary *attribtDic = @{NSUnderlineStyleAttributeName: [NSNumber numberWithInteger:NSUnderlineStyleSingle]};
    NSMutableAttributedString *attribtStr = [[NSMutableAttributedString alloc]initWithString:text attributes:attribtDic];
    dtprotocol.attributedText = attribtStr;
    
}

- (void)timeClick{
    [_verifyBtn show];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
}

@end

