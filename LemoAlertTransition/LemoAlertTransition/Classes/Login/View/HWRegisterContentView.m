//
//  HWRegisterContentView.m
//  JiuZhouDianTi-iOS
//
//  Created by 宇航 on 2018/8/2.
//  Copyright © 2018年 HWD. All rights reserved.
//

#import "HWRegisterContentView.h"
#import "HWDConstant.h"
#import "LoginTextField.h"
#import "TimingButton.h"

@interface HWRegisterContentView()<UIScrollViewDelegate,UITextFieldDelegate>
@property(nonatomic,weak) TimingButton *verifyBtn;
@end

@implementation HWRegisterContentView

- (instancetype)initWithFrame:(CGRect)frame{
    self =[super initWithFrame:frame];
    if (self) {
        [self setUPUI];
    }
    return self;
}

- (void)setUPUI{
    UIScrollView * scrollView =[[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.width, self.height)];
    [self addSubview:scrollView];
    scrollView.pagingEnabled=YES;
    scrollView.contentSize=CGSizeMake(KScreenWidth*4, self.height);
    scrollView.delegate=self;
    _scrollView=scrollView;
    
    VertifyView * vertifyView = [[VertifyView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, scrollView.height)];
    _vertifyView=vertifyView;
    [scrollView addSubview:vertifyView];
    
    SetPsdView * psdyView = [[SetPsdView alloc] initWithFrame:CGRectMake(KScreenWidth, 0, KScreenWidth, scrollView.height)];
    _psdView=psdyView;
    [scrollView addSubview:psdyView];
    
    RealNameView * realmNameView = [[RealNameView alloc] initWithFrame:CGRectMake(2*KScreenWidth, 0, KScreenWidth, scrollView.height)];
    _realNameView = realmNameView;
    [scrollView addSubview:realmNameView];
    
    AccountExplainView * explainView = [[AccountExplainView alloc] initWithFrame:CGRectMake(3*KScreenWidth, 0, KScreenWidth, scrollView.height)];
    _explainView = explainView;
    [scrollView addSubview:explainView];

}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
}

@end
