//
//  StoreListController.m
//  MeiJiaAPP-iOS
//
//  Created by 宇航 on 2018/6/5.
//  Copyright © 2018年 HWD. All rights reserved.
//

#import "StoreListController.h"
#import "SroreGridView.h"
#import "HWDConstant.h"

@interface StoreListController ()

@end

@implementation StoreListController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    SroreGridView * gridView = [[SroreGridView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    gridView.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:gridView];
    
    
}

//- (void)viewWillAppear:(BOOL)animated{
//    [super viewWillAppear:animated];
//    [self.navigationController setNavigationBarHidden:YES];
//}
//
//- (void)viewWillDisappear:(BOOL)animated{
//    [super viewWillDisappear:animated];
//    [self.navigationController setNavigationBarHidden:NO];
//}

@end
