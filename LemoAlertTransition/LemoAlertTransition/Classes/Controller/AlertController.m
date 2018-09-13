//
//  AlertController.m
//  LemoAlertTransition
//
//  Created by 宇航 on 2018/7/19.
//  Copyright © 2018年 HWD. All rights reserved.
//

#import "AlertController.h"
#import "UpdateView.h"

@interface AlertController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic , strong ) NSMutableArray*dataArray;
@property (nonatomic , weak ) UITableView   * tableView;

@end

@implementation AlertController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Alert";
    
    UITableView*tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    _tableView=tableView;
    tableView.delegate=self;
    tableView.dataSource=self;
    [self.view addSubview:tableView];
    if (@available(iOS 11.0, *)) {
        
        self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentAutomatic;
    }
    
    self.tableView.estimatedRowHeight = 0;
    self.tableView.estimatedSectionHeaderHeight = 0;
    self.tableView.estimatedSectionFooterHeight = 0;
    self.dataArray = [NSMutableArray array];
    
    NSMutableArray *baseArray = [NSMutableArray array];
    
    NSMutableArray *demoArray = [NSMutableArray array];
    
    [self.dataArray addObject:baseArray];
    
    [self.dataArray addObject:demoArray];
    
    [baseArray addObject:@{@"title" : @"显示一个默认的 alert 弹框" , @"content" : @""}];
    

    

    [demoArray addObject:@{@"title" : @"显示一个分享登录的 alert 弹框" , @"content" : @"类似某些复杂内容的弹框 可以通过封装成自定义视图来显示"}];
    
    [demoArray addObject:@{@"title" : @"显示一个提示打开推送的 alert 弹框" , @"content" : @"类似某些复杂内容的弹框 可以通过封装成自定义视图来显示"}];
    
    [demoArray addObject:@{@"title" : @"显示一个提示签到成功的 alert 弹框" , @"content" : @"类似某些复杂内容的弹框 可以通过封装成自定义视图来显示"}];
    
    [demoArray addObject:@{@"title" : @"显示一个单选选择列表的 alert 弹框" , @"content" : @"类似某些复杂内容的弹框 可以通过封装成自定义视图来显示"}];
    
    [demoArray addObject:@{@"title" : @"显示一个省市区选择列表的 alert 弹框" , @"content" : @"自定义的Action 通过设置其间距范围和边框等属性实现"}];
    
    [demoArray addObject:@{@"title" : @"显示一个评分的 alert 弹框" , @"content" : @"自定义的Action 通过设置其间距范围和边框等属性实现"}];
    
    [demoArray addObject:@{@"title" : @"显示一个新手红包的 alert 弹框" , @"content" : @"包含自定义视图 自定义title 自定义Action"}];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return self.dataArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [self.dataArray[section] count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 60.0f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (!cell) cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    
    NSDictionary *info = self.dataArray[indexPath.section][indexPath.row];
    
    cell.textLabel.text = info[@"title"];
    
    cell.detailTextLabel.text = info[@"content"];
    
    cell.textLabel.textColor = [UIColor darkGrayColor];
    
    cell.detailTextLabel.textColor = [UIColor grayColor];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 40.0f;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    switch (section) {
            
        case 0:
            
            return @"基础";
            
            break;
            
        case 1:
            
            return @"Demo";
            
            break;
            
        default:
            
            return @"";
            
            break;
    }
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.section==1&&indexPath.row==0) {
        [UpdateView showUpdateAlertWithVersion:@"2.0" Descriptions:@[@"1.适配 iPhone X",@"2.修复了iOS11的兼容性问题.",@"3.可以对视频进行编辑"]];
    }

    
    
}

@end
