//
//  LoginTextField.h
//  Kauri
//
//  Created by 宋立军 on 2016/12/20.
//  Copyright © 2016年 Nathan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginTextField : UITextField

+ (instancetype)creatLoginTextFieldWithFrame:(CGRect)frame Placeholder:(NSString *)placeholder LeftImageName:(NSString *)leftImageName SelectedLeftImageName:(NSString *)selectedLeftImageName;

@property (nonatomic ,assign)BOOL leftImageViewHighLighted;

@property (nonatomic ,assign)BOOL lineViewHighLighted;

@end
