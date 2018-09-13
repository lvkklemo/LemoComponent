//
//  MyController.m
//  LemoAlertTransition
//
//  Created by 宇航 on 2018/7/19.
//  Copyright © 2018年 HWD. All rights reserved.
//

#import "MyController.h"
#import "MyModel.h"
#import "HWDAddressPickrView.h"
#import "RegisterViewController.h"
#import "StoreListController.h"

@interface MyController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, weak) UITableView *mineTableView;
@property (nonatomic, weak)UIButton*loginButton;
@property(nonatomic,strong) NSMutableArray * dataArray;

@end

@implementation MyController

- (NSMutableArray*)dataArray{
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title=@"组件化";
    [self getData];
    [self setupTableView];

}
- (void)setStatusBarBackgroundColor:(UIColor *)color {
    
    UIView *statusBar = [[[UIApplication sharedApplication] valueForKey:@"statusBarWindow"] valueForKey:@"statusBar"];
    if ([statusBar respondsToSelector:@selector(setBackgroundColor:)]) {
        statusBar.backgroundColor = color;
    }
}
- (void)setupTableView{
    UITableView *mineTableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    mineTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    mineTableView.delegate = self;
    mineTableView.dataSource = self;
    [self.view addSubview:mineTableView];
    _mineTableView = mineTableView;
    
}

#pragma mark 退出系统
- (void)logoutButtonClick{
    self.tabBarController.selectedIndex = 0;
    [self.navigationController popViewControllerAnimated:NO];
}

- (void)loginBtnAction{
}

- (void)getData{
    
    MyModel * model1 = [[MyModel alloc]init];
    model1.iconName = @"icon_13";
    model1.itemName = @"地址选择";
    [self.dataArray addObject:model1];
    
    MyModel * model2 = [[MyModel alloc]init];
    model2.iconName = @"icon_14";
    model2.itemName = @"注册";
    [self.dataArray addObject:model2];
    
    MyModel * model3 = [[MyModel alloc]init];
    model3.iconName = @"icon_15";
    model3.itemName = @"UICollection自定义";
    [self.dataArray addObject:model3];
    
    MyModel * model4 = [[MyModel alloc]init];
    model4.iconName = @"icon_16";
    model4.itemName = @"服务条款";
    [self.dataArray addObject:model4];
    
    MyModel * model5 = [[MyModel alloc]init];
    model5.iconName = @"icon_17";
    model5.itemName = @"客服热线";
    [self.dataArray addObject:model5];
    
    MyModel * model6 = [[MyModel alloc]init];
    model6.iconName = @"icon_18";
    model6.itemName = @"我的机器";
    [self.dataArray addObject:model6];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * reuseID = @"cell_reuse";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseID];
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    MyModel * myModel = _dataArray[indexPath.row];
    cell.textLabel.text = myModel.itemName;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    switch (indexPath.row) {
            
            break;
        case 0:
        {
            __weak typeof(self) weakSelf = self;
            HWDAddressPickrView *addressPickView = [[HWDAddressPickrView alloc] init];
            addressPickView.addressBlock = ^(NSString *province, NSString *city, NSString *area) {
                //NSString *title = [NSString stringWithFormat:@"%@ %@ %@",province,city,area];
            };
            [addressPickView showView];
            
        }
            break;
            
        case 1:
        {
    
            RegisterViewController*vc=[RegisterViewController new];
            vc.title=@"注册";
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
            
        case 2:
        {
            //
            StoreListController*vc=[StoreListController new];
            vc.title=@"自定义collectionView";
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 4:
        {
            
        }
            break;
            
        case 5:
        {
           
        }
            break;
            
        default:
            break;
    }
}

@end





