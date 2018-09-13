//
//  SroreGridView.m
//  JiuZhouDianTi-iOS
//
//  Created by 宇航 on 2018/7/27.
//  Copyright © 2018年 HWD. All rights reserved.
//

#import "SroreGridView.h"
#import "HWDConstant.h"
#import "StoreCollectionViewCell.h"
#import "StoreCollectionViewLayout.h"
#import "SectionHeaderReusableView.h"
#import "UIView+BorderLine.h"
#import "StoreSectionModel.h"
#import "StoreItemModel.h"
#import "StoreGridHeaderView.h"

@interface SroreGridView()<UICollectionViewDelegate,UICollectionViewDataSource>{
    UICollectionView *myCollectionView;
}
@property(nonatomic,strong) NSMutableArray * sections;
@property(nonatomic,weak)StoreGridHeaderView *homeHeaderView;
@end

@implementation SroreGridView

static NSString *ItemIdentifier = @"ItemIdentifier";
static NSString *leaveDetailsHeadID = @"leaveDetailsHeadID";
static NSString *leaveDetailsFooterID = @"leaveDetailsFooterID";
static NSString *storeHeaderViewID = @"storeHeaderID";
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
//        listArray = [NSArray arrayWithObjects:@"必备工具",@"辅助工具", nil];
//        dataArray = [NSArray arrayWithObjects:@"11",@"12",@"13",@"14",@"15" ,nil];
        self.sections = [NSMutableArray array];
        StoreSectionModel*section01 = [StoreSectionModel new];
        section01.sectionTitle=@"必备工具";
        section01.dataArray=[NSMutableArray array];
        StoreItemModel*s1i1Model = [StoreItemModel new];
        s1i1Model.itemTitle=@"保养计划";
        s1i1Model.imageUrl=@"testImage";
        [section01.dataArray addObject:s1i1Model];
        StoreItemModel*s1i2Model = [StoreItemModel new];
        s1i2Model.itemTitle=@"年检计划";
        s1i2Model.imageUrl=@"testImage";
        [section01.dataArray addObject:s1i2Model];
        StoreItemModel*s1i3Model = [StoreItemModel new];
        s1i3Model.itemTitle=@"急修管理";
        s1i3Model.imageUrl=@"testImage";
        [section01.dataArray addObject:s1i3Model];
        StoreItemModel*s1i4Model = [StoreItemModel new];
        s1i4Model.itemTitle=@"项目信息";
        s1i4Model.imageUrl=@"testImage";
        [section01.dataArray addObject:s1i4Model];
        StoreItemModel*s1i5Model = [StoreItemModel new];
        s1i5Model.itemTitle=@"反馈广场";
        s1i5Model.imageUrl=@"testImage";
        [section01.dataArray addObject:s1i5Model];
        StoreItemModel*s1i6Model = [StoreItemModel new];
        s1i6Model.itemTitle=@"工作记录";
        s1i6Model.imageUrl=@"testImage";
        [section01.dataArray addObject:s1i6Model];
        StoreItemModel*s1i7Model = [StoreItemModel new];
        s1i7Model.itemTitle=@"评价";
        s1i7Model.imageUrl=@"testImage";
        [section01.dataArray addObject:s1i7Model];
        StoreItemModel*s1i8Model = [StoreItemModel new];
        s1i8Model.itemTitle=@"扫一扫";
        s1i8Model.imageUrl=@"testImage";
        [section01.dataArray addObject:s1i8Model];
        [self.sections addObject:section01];
        
        StoreSectionModel*section02 = [StoreSectionModel new];
        section02.sectionTitle=@"常用工具";
        section02.dataArray=[NSMutableArray array];
        StoreItemModel*s2i1Model = [StoreItemModel new];
        
        s2i1Model.itemTitle=@"新手帮助";
        s2i1Model.imageUrl=@"testImage";
        [section02.dataArray addObject:s2i1Model];
        StoreItemModel*s2i2Model = [StoreItemModel new];
        s2i2Model.itemTitle=@"公司公告";
        s2i2Model.imageUrl=@"testImage";
        [section02.dataArray addObject:s2i2Model];
        [self.sections addObject:section02];
        //[self.sections addObject:section01];
        
        [self createCollectionView];
    }
    return self;
}

//创建collectionView
-(void)createCollectionView{
    
    CGRect size = CGRectMake(0, 0, KScreenWidth, KScreenHeight - 49);
    StoreCollectionViewLayout *mcvl=[[StoreCollectionViewLayout alloc] init];
    myCollectionView = [[UICollectionView alloc] initWithFrame:size collectionViewLayout:mcvl];
    //一定要注册cell，注册的是自定义的
    [myCollectionView registerClass:[StoreCollectionViewCell class] forCellWithReuseIdentifier:ItemIdentifier];
    
    myCollectionView.showsHorizontalScrollIndicator=NO;
    myCollectionView.showsVerticalScrollIndicator=NO;
    myCollectionView.backgroundColor=[UIColor whiteColor];
    myCollectionView.delegate = self;
    myCollectionView.dataSource = self;
    
    // 最重要的一句代码!!!
    myCollectionView.contentInset = UIEdgeInsetsMake(352, 0, 0, 0);
    //myCollectionView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    //一定要注册headview
    [myCollectionView registerClass:[SectionHeaderReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:leaveDetailsHeadID];
    //一定要注册footerview
    [myCollectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:leaveDetailsFooterID];
    [self addSubview:myCollectionView];
    
    [self setHeaderView];
}

- (void)setHeaderView {
    
    // 注意这里设置headerView的头视图的y坐标一定是从"负值"开始,因为headerView是添加在collectionView上的.
    StoreGridHeaderView *headerView = [[StoreGridHeaderView alloc]initWithFrame:CGRectMake(0, -352, KScreenWidth, 352)];
    headerView.backgroundColor = [UIColor whiteColor];
    [myCollectionView addSubview:headerView];
}
//有多少个sections
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{

    return self.sections.count;
}
//每个section 中有多少个items
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    StoreSectionModel*sectionM=self.sections[section];
    return sectionM.dataArray.count;
    
}
//section X item X位置处应该显示什么内容
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    //自定义cell
    StoreCollectionViewCell *cell=nil;
    
    if (cell==nil) {
        cell = [collectionView dequeueReusableCellWithReuseIdentifier:ItemIdentifier forIndexPath:indexPath];
        
    }
    cell.contentView.backgroundColor = [UIColor whiteColor];
    StoreSectionModel*sectionM=self.sections[indexPath.section];
    StoreItemModel*itemM=sectionM.dataArray[indexPath.row];
    cell.nameLabel.text = itemM.itemTitle;
    cell.imgView.image = [UIImage imageNamed:itemM.imageUrl];
    return cell;
}
//cell的header与footer的显示内容
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    
    if (kind == UICollectionElementKindSectionHeader)
    {
        SectionHeaderReusableView *reusableHeaderView = nil;
        if (reusableHeaderView==nil) {
            reusableHeaderView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader  withReuseIdentifier:leaveDetailsHeadID forIndexPath:indexPath];
            reusableHeaderView.backgroundColor = [UIColor whiteColor];
        }
        StoreSectionModel*section=self.sections[indexPath.section];
        NSString* text = section.sectionTitle;
        [reusableHeaderView.titleBtn  setTitle:text forState:UIControlStateNormal];
        [reusableHeaderView.titleBtn borderForColor:NavThemeColor borderWidth:5 borderType:UIBorderSideTypeLeft];
        return reusableHeaderView;
        
    }else if (kind == UICollectionElementKindSectionFooter){
        
        UICollectionReusableView *reusableFooterView = nil;
        if (reusableFooterView == nil) {
            reusableFooterView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter  withReuseIdentifier:leaveDetailsFooterID forIndexPath:indexPath];
            reusableFooterView.backgroundColor = [UIColor groupTableViewBackgroundColor];
        }
        
        return reusableFooterView;
    }
    return nil;
    
}
//点击cell
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"indexPath.r==%ld",(long)indexPath.row);
    
}

@end
