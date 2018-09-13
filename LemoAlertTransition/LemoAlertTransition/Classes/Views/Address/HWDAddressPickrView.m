//
//  HWDAddressPickrView.m
//  MeiJiaAPP-iOS
//
//  Created by 彭倩倩 on 2018/7/2.
//  Copyright © 2018年 HWD. All rights reserved.
//

#import "HWDAddressPickrView.h"
#import "HWDConstant.h"
#import "UIView+Extension.h"

@interface HWDAddressPickrView ()<UIPickerViewDataSource, UIPickerViewDelegate>
/** 确认 取消按钮所在的视图 */
@property (nonatomic, strong) UIView *barView;
/** 内容视图 */
@property (nonatomic, strong) UIView *contentView;
/** 内容高度 */
@property (nonatomic, assign) CGFloat contentHeight;
/** barViewHeight */
@property (nonatomic, assign) CGFloat barViewHeight;
/** btnWidth */
@property (nonatomic, assign) CGFloat btnWidth;

/** 确认按钮 */
@property (nonatomic, strong) UIButton *comfirmBtn;
/** 取消按钮 */
@property (nonatomic, strong) UIButton *cancelBtn;
/** pickerView */
@property (nonatomic, strong) UIPickerView *pickerView;

@property (nonatomic, strong) NSDictionary *pickerDic;
/** 以后扩展功能会用到(记住选中的地址...待完善) */
@property (nonatomic, strong) NSArray *selectedArray;
/** 省份数组 */
@property (nonatomic, strong) NSArray *provinceArray;
/** 城市数组 */
@property (nonatomic, strong) NSArray *cityArray;
/** 地区数组 */
@property (nonatomic, strong) NSArray *townArray;
/** 省 */
@property (nonatomic,copy) NSString *province;
/** 市 */
@property (nonatomic,copy) NSString *city;
/** 区 */
@property (nonatomic,copy) NSString *area;
@end

@implementation HWDAddressPickrView

- (NSDictionary *)pickerDic {
    if (_pickerDic == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"HWDAddress" ofType:@"plist"];
        self.pickerDic = [[NSDictionary alloc] initWithContentsOfFile:path];
    }
    return _pickerDic;
}
- (NSArray *)provinceArray {
    if (!_provinceArray) {
        self.provinceArray = [self.pickerDic valueForKey:@"p"];
    }
    
    return _provinceArray;
}
-(NSArray *)selectedArray {
    if (!_selectedArray) {
        self.selectedArray = self.pickerDic[@"c"][self.provinceArray.firstObject];
    }
    return _selectedArray;
}
- (NSArray *)cityArray {
    if (!_cityArray) {
        self.cityArray = self.selectedArray;
    }
    return _cityArray;
}
- (NSArray *)townArray {
    if (!_townArray) {
        self.townArray = self.pickerDic[@"a"][@"北京市-北京市"];
    }
    return _townArray;
}
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.frame = CGRectMake(0, 0, KScreenWidth, KScreenHeight);
        [self setupViews];
    }
    return self;
}

- (void)setupViews {
    
    self.contentHeight = 272;
    self.barViewHeight = 40;
    self.btnWidth = 50;
    
    _contentView = [[UIView alloc] initWithFrame:CGRectMake(0, KScreenHeight, KScreenWidth, self.contentHeight)];
    _contentView.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.contentView];
    
     _barView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, self.barViewHeight)];
    _barView.backgroundColor = HWDColor(248, 248, 248);
    [self.contentView addSubview:self.barView];
    
    _comfirmBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _comfirmBtn.frame = CGRectMake(KScreenWidth - self.btnWidth, 0, self.btnWidth, self.barViewHeight);
    [_comfirmBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_comfirmBtn setTitle:@"确定" forState:UIControlStateNormal];
    [_comfirmBtn addTarget:self action:@selector(comfirmBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.barView addSubview:self.comfirmBtn];
    
    _cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _cancelBtn.frame = CGRectMake(0, 0, self.btnWidth, self.barViewHeight);
    [_cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
    [_cancelBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_cancelBtn addTarget:self action:@selector(cancelBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.barView addSubview:self.cancelBtn];

    _pickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, self.barViewHeight, self.contentView.frame.size.width, self.contentView.frame.size.height - self.barViewHeight)];
    _pickerView.delegate = self;
    _pickerView.dataSource = self;
    _pickerView.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:_pickerView];
    
}


#pragma mark - UIPickerViewDataSource
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 3;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if (component == 0) {
        return self.provinceArray.count;
    } else if (component == 1) {
        return self.cityArray.count;
    } else {
        return self.townArray.count;
    }
}
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    if (component == 0) {
        return [self.provinceArray objectAtIndex:row];
    } else if (component == 1) {
        return [self.cityArray objectAtIndex:row];
    } else {
        return [self.townArray objectAtIndex:row];
    }
}
- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component {
    return self.frame.size.width/3;
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    if (component == 0) {
        self.selectedArray = self.pickerDic[@"c"][self.provinceArray[row]];
        self.province = self.provinceArray[row];
        if (self.selectedArray.count > 0) {
            self.cityArray = self.selectedArray;
        } else {
            self.cityArray = @[];
        }
        if (self.cityArray.count > 0) {
            self.townArray = self.pickerDic[@"a"][[NSString stringWithFormat:@"%@-%@",self.province,self.cityArray.firstObject]];
        } else {
            self.townArray = @[];
        }
        [pickerView reloadComponent:1];
        [pickerView selectRow:0 inComponent:1 animated:YES];
        [pickerView reloadComponent:2];
        [pickerView selectRow:0 inComponent:2 animated:YES];
    }
    if (component == 1) {
        self.townArray = self.pickerDic[@"a"][[NSString stringWithFormat:@"%@-%@",self.province,self.cityArray[row]]];
        self.city = self.cityArray[row];
        [pickerView reloadComponent:2];
        [pickerView selectRow:0 inComponent:2 animated:YES];
    }
    if (component == 2) {
        self.area = self.townArray[row];
    }
    
}
- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view {
    UILabel* pickerLabel = (UILabel*)view;
    if (!pickerLabel){
        pickerLabel = [[UILabel alloc] init];
        pickerLabel.adjustsFontSizeToFitWidth = YES;
        pickerLabel.textAlignment = NSTextAlignmentCenter;
        [pickerLabel setBackgroundColor:[UIColor clearColor]];
        [pickerLabel setFont:[UIFont boldSystemFontOfSize:14]];
    }
    pickerLabel.text = [self pickerView:pickerView titleForRow:row forComponent:component];
    return pickerLabel;
}
// MARK: -- 按钮点击事件
- (void)comfirmBtnClick {
    NSInteger selectProvince = [self.pickerView selectedRowInComponent:0];
    NSInteger selectCity     = [self.pickerView selectedRowInComponent:1];
    NSInteger selectArea     = [self.pickerView selectedRowInComponent:2];
    self.province = self.provinceArray[selectProvince];
    self.city = self.cityArray[selectCity];
    self.area = self.townArray[selectArea];
    if (self.addressBlock) {
        self.addressBlock(self.province,self.city,self.area);
    }
    [self hideView];
    
}
- (void)cancelBtnClick {
    [self hideView];
}

// MARK: --
//显示
- (void)showView {
    [[UIApplication sharedApplication].keyWindow addSubview:self];
    
    self.backgroundColor = [UIColor clearColor];
    
    [UIView animateWithDuration:0.3 animations:^{
        self.backgroundColor = [[UIColor blackColor]colorWithAlphaComponent:0.3];;
        self.contentView.y = KScreenHeight-_contentView.height;
    }];
    
}
//隐藏
- (void)hideView {
    
    [UIView animateWithDuration:0.3 animations:^{
        self.backgroundColor = [UIColor clearColor];
        self.contentView.maxY = KScreenHeight;
        
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self hideView];
}

@end
