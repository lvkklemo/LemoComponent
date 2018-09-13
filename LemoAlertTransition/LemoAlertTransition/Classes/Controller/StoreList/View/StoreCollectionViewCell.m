//
//  StoreCollectionViewCell.m
//  JiuZhouDianTi-iOS
//
//  Created by 宇航 on 2018/7/27.
//  Copyright © 2018年 HWD. All rights reserved.
//

#import "StoreCollectionViewCell.h"
#import "HWDConstant.h"

@interface StoreCollectionViewCell()
@end

@implementation StoreCollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self == [super initWithFrame:frame]) {
        
        self.contentView.backgroundColor = [UIColor whiteColor];
        CGFloat spaWidth = frame.size.width;
        CGFloat spaHeight = 40;
        
        _imgView = [[UIImageView alloc] initWithFrame:CGRectMake((spaWidth-spaHeight)/2, 0, spaHeight, spaHeight)];
        _imgView.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:_imgView];
        //_imgView.image=[UIImage imageNamed:@"testImage"];
        
        _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, spaHeight+8, spaWidth, 20)];
        _nameLabel.textAlignment = NSTextAlignmentCenter;
        _nameLabel.textColor = [UIColor blackColor];
        _nameLabel.font=[UIFont systemFontOfSize:14];
        [self.contentView addSubview:_nameLabel];
    }
    
    return self;
}
@end
