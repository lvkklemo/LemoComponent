//
//  StoreGridHeaderView.m
//  JiuZhouDianTi-iOS
//
//  Created by 宇航 on 2018/7/27.
//  Copyright © 2018年 HWD. All rights reserved.
//

#import "StoreGridHeaderView.h"
#import "HWDConstant.h"


@interface StoreGridHeaderView()<SDCycleScrollViewDelegate>
@property (nonatomic, weak) UISearchBar *searchBar;
@property (nonatomic, weak) SDCycleScrollView *cycleScrollView;
@end

@implementation StoreGridHeaderView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupView];
    }
    return self;
}

- (void)setupView{
    
    //222222
    NSArray *imageNames = @[@"http://picsum.photos/375.0/299",
                            @"http://picsum.photos/375.0/300",
                            @"http://picsum.photos/375.0/301",
                            @"http://picsum.photos/375.0/302",
                            @"http://picsum.photos/375.0/303",
                            @"http://picsum.photos/375.0/304",
                            @"http://picsum.photos/375.0/305"];
    
    SDCycleScrollView *cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, KScreenWidth, 200)  imageURLStringsGroup:imageNames];
    _cycleScrollView = cycleScrollView;
    //添加标题数组
    cycleScrollView.autoScrollTimeInterval = 5;
    cycleScrollView.delegate = self;
    cycleScrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
    cycleScrollView.currentPageDotColor = [UIColor whiteColor];
    [self addSubview:cycleScrollView];
//    cycleScrollView.layer.cornerRadius=
    
    UIView * titleView = [[UIView alloc] initWithFrame:CGRectMake(0, cycleScrollView.bottom, KScreenWidth, 40)];
    titleView.backgroundColor=[UIColor whiteColor];
    [self addSubview:titleView];
    [titleView borderForColor:[UIColor grayColor] borderWidth:1 borderType:UIBorderSideTypeBottom];
    
    UIButton*titleBtn = [[UIButton alloc] initWithFrame:CGRectMake(16, 8, 100, 24)];
    titleBtn.titleLabel.font=[UIFont systemFontOfSize:16];
    titleBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [titleView addSubview:titleBtn];
    titleBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    [titleBtn setTitle:@"当日工作" forState:UIControlStateNormal];
    [titleBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [titleBtn borderForColor:NavThemeColor borderWidth:5 borderType:UIBorderSideTypeLeft];
    
    //1保养完成80
    UIButton*buttton01=[[UIButton alloc] initWithFrame:CGRectMake(0, titleView.bottom+10, KScreenWidth/5, 80)];
    [self addSubview:buttton01];
    
    //2待保养
    UIButton*buttton02=[[UIButton alloc] initWithFrame:CGRectMake(buttton01.right, buttton01.y, buttton01.width, buttton01.height)];
    [self addSubview:buttton02];
 
    //3保养中
    UIButton*buttton03=[[UIButton alloc] initWithFrame:CGRectMake(buttton02.right, buttton01.y, buttton01.width, buttton01.height)];
    [self addSubview:buttton03];
    
    //4超期
    UIButton*buttton04=[[UIButton alloc] initWithFrame:CGRectMake(buttton03.right, buttton01.y, buttton01.width, buttton01.height)];
    [self addSubview:buttton04];
    
    //5急修
    UIButton*buttton05=[[UIButton alloc] initWithFrame:CGRectMake(buttton04.right, buttton01.y, buttton01.width, buttton01.height)];
    [self addSubview:buttton05];
    
    UIView*lineView = [[UIView alloc] initWithFrame:CGRectMake(0, buttton01.bottom+10, KScreenWidth, 12)];
    [self addSubview:lineView];
    lineView.backgroundColor=[UIColor groupTableViewBackgroundColor];
    
    NSLog(@"%f",lineView.bottom);
    //图片1
    UIImageView*iconView01=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"img-6"]];
    [buttton01 addSubview:iconView01];
    iconView01.size=CGSizeMake(35, 35);
    iconView01.origin=CGPointMake(buttton01.width/2-iconView01.width/2, 8);
    UILabel*label01=[[UILabel alloc] initWithFrame:CGRectMake(0, iconView01.bottom+4, buttton01.width, 30)];
    [buttton01 addSubview:label01];
    label01.text = @"保养完成";
    label01.textColor=[UIColor blackColor];
    label01.textAlignment=NSTextAlignmentCenter;
    label01.font=[UIFont systemFontOfSize:15];
    
    //图片2
    UIImageView*iconView02=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"img-5"]];
    [buttton02 addSubview:iconView02];
    iconView02.size=CGSizeMake(35, 35);
    iconView02.origin=CGPointMake(buttton02.width/2-iconView02.width/2, 8);
    UILabel*label02=[[UILabel alloc] initWithFrame:CGRectMake(0, iconView02.bottom+4, buttton02.width, 30)];
    [buttton02 addSubview:label02];
    label02.text = @"待保养";
    label02.textColor=[UIColor blackColor];
    label02.textAlignment=NSTextAlignmentCenter;
    label02.font=[UIFont systemFontOfSize:15];
    
    //图片3
    UIImageView*iconView03=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"img-6"]];
    [buttton03 addSubview:iconView03];
    iconView03.size=CGSizeMake(35, 35);
    iconView03.origin=CGPointMake(buttton03.width/2-iconView03.width/2, 8);
    UILabel*label03=[[UILabel alloc] initWithFrame:CGRectMake(0, iconView03.bottom+4, buttton03.width, 30)];
    [buttton03 addSubview:label03];
    label03.text = @"保养中";
    label03.textColor=[UIColor blackColor];
    label03.textAlignment=NSTextAlignmentCenter;
    label03.font=[UIFont systemFontOfSize:15];
    
    //图片4
    UIImageView*iconView04=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"img-3"]];
    [buttton04 addSubview:iconView04];
    iconView04.size=CGSizeMake(35, 35);
    iconView04.origin=CGPointMake(buttton04.width/2-iconView04.width/2, 8);
    UILabel*label04=[[UILabel alloc] initWithFrame:CGRectMake(0, iconView04.bottom+4, buttton04.width, 30)];
    [buttton04 addSubview:label04];
    label04.text = @"超期";
    label04.textColor=[UIColor blackColor];
    label04.textAlignment=NSTextAlignmentCenter;
    label04.font=[UIFont systemFontOfSize:15];
    
    //图片5
    UIImageView*iconView05=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"img-2"]];
    [buttton05 addSubview:iconView05];
    iconView05.size=CGSizeMake(35, 35);
    iconView05.origin=CGPointMake(buttton05.width/2-iconView05.width/2, 8);
    UILabel*label05=[[UILabel alloc] initWithFrame:CGRectMake(0, iconView05.bottom+4, buttton05.width, 30)];
    [buttton05 addSubview:label05];
    label05.text = @"急修";
    label05.textColor=[UIColor blackColor];
    label05.textAlignment=NSTextAlignmentCenter;
    label05.font=[UIFont systemFontOfSize:15];
}



@end
