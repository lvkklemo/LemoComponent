//
//  LoginTextField.m
//  Kauri
//
//  Created by 宋立军 on 2016/12/20.
//  Copyright © 2016年 Nathan. All rights reserved.
//

#import "LoginTextField.h"
#import "HWDConstant.h"

@interface LoginTextField ()

@property (nonatomic ,strong)UIView *lineView;

@property (nonatomic ,strong)UIImageView *leftImageView;

@end

@implementation LoginTextField

+ (instancetype)creatLoginTextFieldWithFrame:(CGRect)frame Placeholder:(NSString *)placeholder LeftImageName:(NSString *)leftImageName SelectedLeftImageName:(NSString *)selectedLeftImageName
{
    LoginTextField *textField = [[LoginTextField alloc]initWithFrame:frame];
    textField.placeholder = placeholder;
    textField.borderStyle = UITextBorderStyleNone;
    textField.font = [UIFont fontWithName:KHFontDefault size:14];
    textField.autocorrectionType = UITextAutocorrectionTypeNo;

    UIImage *image = [UIImage imageNamed:leftImageName];
    UIImageView *imageView = [[UIImageView alloc]initWithImage:image highlightedImage:[UIImage imageNamed:selectedLeftImageName]];
    imageView.frame = CGRectMake(0, 0, image.size.width, image.size.height);
    imageView.center = CGPointMake( -35, CGRectGetHeight(frame) *0.5);
    textField.leftImageView = imageView;
    [textField addSubview:textField.leftImageView];
    
    UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake( 0, 0, 0.5, 21)];
    lineView.center = CGPointMake( -16, CGRectGetHeight(frame) *0.5);
    lineView.backgroundColor = HWDColor(231, 236, 238);
    [textField addSubview:lineView];

    UIView *lineV = [[UIView alloc]initWithFrame:CGRectMake( -42, CGRectGetHeight(frame), KScreenWidth - 80, 0.5)];
    textField.lineView = lineV;
    [textField addSubview:textField.lineView];

    textField.lineViewHighLighted = NO;
    return textField;
}

- (void)setLineViewHighLighted:(BOOL)lineViewHighLighted
{
    if (lineViewHighLighted) {
        self.lineView.backgroundColor = HWDColor(231 ,236 ,238);
    }else{
        self.lineView.backgroundColor = HWDColor(231 ,236 ,238);
    }
}

- (void)setLeftImageViewHighLighted:(BOOL)leftImageViewHighLighted
{
    self.leftImageView.highlighted = leftImageViewHighLighted;
}


@end
