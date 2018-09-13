//
//  RegisterViewController.m
//  JiuZhouDianTi-iOS
//
//  Created by 宇航 on 2018/8/2.
//  Copyright © 2018年 HWD. All rights reserved.
//

#import "RegisterViewController.h"
#import "HWDConstant.h"


#import "RegisterTopView.h"
#import "HWRegisterContentView.h"

@interface RegisterViewController ()
@property(nonatomic,weak)HWRegisterContentView*contentView;
@property(nonatomic,weak)RegisterTopView*headerView;
@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.leftBarButtonItem =[UIBarButtonItem itemWithImageName:@"nav_back_btn" target:self action:@selector(back)];
    [self setUpUI];
    
}

- (void)setUpUI{
    RegisterTopView*headerView = [[RegisterTopView alloc] initWithFrame:CGRectMake(0, 64, KScreenWidth, 180)];
    _headerView=headerView;
    [self.view addSubview:headerView];
    
    HWRegisterContentView*contentView = [[HWRegisterContentView alloc] initWithFrame:CGRectMake(0, headerView.bottom, KScreenWidth, KScreenHeight-64-headerView.height)];
    contentView.backgroundColor=[UIColor groupTableViewBackgroundColor];
    [self.view addSubview:contentView];
    contentView.scrollView.scrollEnabled=false;
    _contentView=contentView;
    
    [contentView.vertifyView.nextButton addTarget:self action:@selector(nextButtonDidClick) forControlEvents:UIControlEventTouchUpInside];
    [contentView.psdView.nextButton addTarget:self action:@selector(psdNextButtonDidClick) forControlEvents:UIControlEventTouchUpInside];
    [contentView.realNameView.nextButton addTarget:self action:@selector(realNameButtonDidClick) forControlEvents:UIControlEventTouchUpInside];
    [contentView.explainView.nextButton addTarget:self action:@selector(explainButtonDidClick) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)nextButtonDidClick{
    [_contentView.scrollView setContentOffset:CGPointMake(KScreenWidth,0) animated:YES];
    [_headerView.firstButton setImage:[UIImage imageNamed:@"register_icon02"] forState:UIControlStateNormal];
    [_headerView.secondButton setImage:[UIImage imageNamed:@"register_icon02"] forState:UIControlStateNormal];
    [_headerView.thirdButton setImage:[UIImage imageNamed:@"register_icon01"] forState:UIControlStateNormal];
    [_headerView.fourButton setImage:[UIImage imageNamed:@"register_icon01"] forState:UIControlStateNormal];
    
}

- (void)psdNextButtonDidClick{
    [_contentView.scrollView setContentOffset:CGPointMake(2*KScreenWidth,0) animated:YES];
    [_headerView.firstButton setImage:[UIImage imageNamed:@"register_icon02"] forState:UIControlStateNormal];
    [_headerView.secondButton setImage:[UIImage imageNamed:@"register_icon02"] forState:UIControlStateNormal];
    [_headerView.thirdButton setImage:[UIImage imageNamed:@"register_icon02"] forState:UIControlStateNormal];
    [_headerView.fourButton setImage:[UIImage imageNamed:@"register_icon01"] forState:UIControlStateNormal];
}

- (void)realNameButtonDidClick{
    [_contentView.scrollView setContentOffset:CGPointMake(3*KScreenWidth,0) animated:YES];
    [_headerView.firstButton setImage:[UIImage imageNamed:@"register_icon02"] forState:UIControlStateNormal];
    [_headerView.secondButton setImage:[UIImage imageNamed:@"register_icon02"] forState:UIControlStateNormal];
    [_headerView.thirdButton setImage:[UIImage imageNamed:@"register_icon02"] forState:UIControlStateNormal];
    [_headerView.fourButton setImage:[UIImage imageNamed:@"register_icon02"] forState:UIControlStateNormal];
}

- (void)explainButtonDidClick{
    
}


- (void)back{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
