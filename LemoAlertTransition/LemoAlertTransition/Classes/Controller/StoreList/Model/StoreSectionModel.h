//
//  StoreSectionModel.h
//  JiuZhouDianTi-iOS
//
//  Created by 宇航 on 2018/7/27.
//  Copyright © 2018年 HWD. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StoreSectionModel : NSObject
@property(nonatomic,copy) NSString * sectionTitle;
@property(nonatomic,copy) NSString * color;
@property(nonatomic,strong) NSMutableArray * dataArray;
@end
