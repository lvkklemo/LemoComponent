//
//  StoreCollectionViewLayout.m
//  JiuZhouDianTi-iOS
//
//  Created by 宇航 on 2018/7/27.
//  Copyright © 2018年 HWD. All rights reserved.
//

#import "StoreCollectionViewLayout.h"

@implementation StoreCollectionViewLayout

-(id)init{
    if (!(self = [super init])) return nil;
    
    CGSize size = [[UIScreen mainScreen] bounds].size;
    
    
    //    CGFloat cellSpace = 5.0;
    //    CGFloat cellWidth = (size.width - cellSpace * (4 + 1)) / 4;//总宽－5个间隔（4个cell）
    CGFloat cellSpace = 0.0;
    CGFloat cellWidth = size.width / 4.0;
    
    self.itemSize = CGSizeMake(cellWidth, 80);//Item size(每个item的大小)
    self.sectionInset = UIEdgeInsetsMake(cellSpace, cellSpace, cellSpace, cellSpace);//某个section中cell的边界范围。
    self.headerReferenceSize = CGSizeMake(size.width, 50);//每个section的Header宽高
    self.footerReferenceSize = CGSizeMake(size.width, 12);//每个section的Footer宽高
    
    self.minimumInteritemSpacing = cellSpace;//Inter cell spacing（每行内部cell item的间距）
    self.minimumLineSpacing = cellSpace;//Line spacing（每行的间距）
    
    return self;
}

@end

