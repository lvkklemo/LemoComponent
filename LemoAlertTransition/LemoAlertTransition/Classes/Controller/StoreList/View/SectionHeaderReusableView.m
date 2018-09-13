//
//  SectionHeaderReusableView.m
//  JiuZhouDianTi-iOS
//
//  Created by 宇航 on 2018/7/27.
//  Copyright © 2018年 HWD. All rights reserved.
//

#import "SectionHeaderReusableView.h"
#import "HWDConstant.h"
@interface SectionHeaderReusableView ()

@end

@implementation SectionHeaderReusableView
- (instancetype)initWithFrame:(CGRect)frame{
    self= [super initWithFrame:frame];
    if (self) {
        [self setUPUI];
    }
    return self;
}

- (void)setUPUI{
    UIButton*titleBtn = [[UIButton alloc] initWithFrame:CGRectMake(16, 8, 100, 24)];
    _titleBtn=titleBtn;
    [titleBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    titleBtn.titleLabel.font=[UIFont systemFontOfSize:16];
    titleBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [self addSubview:titleBtn];
    titleBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    UIView*line = [[UIView alloc] initWithFrame:CGRectMake(0, 39, KScreenWidth, 1)];
    [self addSubview:line];
    line.backgroundColor=[UIColor lightGrayColor];
    
}
@end
