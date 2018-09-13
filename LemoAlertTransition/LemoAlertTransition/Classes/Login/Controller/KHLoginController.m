//
//  LoginController.m
//  KauriHealth
//
//  Created by KauriHealth on 7/27/15.
//  Copyright (c) 2015 KauriHealth. All rights reserved.
//

#import "KHLoginController.h"
#import "HWDConstant.h"
#import "UIColor+Hex.h"
#import "LoginTextField.h"
#import "LoginAPI.h"
#import "RegisterViewController.h"

//颜色
//#define RGBCOLORALP(r,g,b,alp) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(alp)]

@interface KHLoginController ()<UITextFieldDelegate,UIScrollViewDelegate>
{
    UIScrollView *_scrollView;
    BOOL _keyboardShown;
    LoginTextField *_usernameTextField;
    LoginTextField *_passwordTextField;
    CGFloat _previousKeyboardHeight;
    MBProgressHUD *_hud;
    
}
@property(nonatomic,strong)  MBProgressHUD *hud;
@property(nonatomic,strong)  UIImageView * imageIcon;
@end

@implementation KHLoginController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
}

- (void)setupUI{
    
    _previousKeyboardHeight = CGFLOAT_MIN;
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, KScreenHeight)];
    scrollView.backgroundColor=[UIColor whiteColor];
    
    UIImageView * bgView = [[UIImageView alloc] initWithFrame:scrollView.bounds];
    bgView.image = [UIImage imageNamed:@"login_sign_bg"];
    bgView.contentMode = 0;
    [scrollView addSubview:bgView];

    UIView *topView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, 291)];
    UILabel*descLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 40, KScreenWidth, 30)];
    [topView addSubview:descLabel];
    descLabel.text=@"欢迎您,请登录";
    descLabel.textAlignment = NSTextAlignmentCenter;
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    [topView addSubview:imageView];
    imageView.center = CGPointMake(topView.center.x, topView.center.y + 10);
    self.imageIcon = imageView;
    imageView.image = [UIImage imageNamed:@"testImage"];
    
    [scrollView addSubview:topView];
    _scrollView = scrollView;
    
    //用户名标题
    CGFloat marginX = 82;
    CGFloat userNameTitleLabelX = marginX;
    CGFloat userNameTitleLabelY = CGRectGetMaxY(topView.frame);
    UILabel *userNameTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(userNameTitleLabelX, userNameTitleLabelY, KScreenWidth-marginX*2, 13)];
    userNameTitleLabel.font = [UIFont fontWithName:KHFontDefault size:13];
    userNameTitleLabel.text = @"请输入用户名";
    userNameTitleLabel.textColor = [UIColor colorWithHexString:@"#1d1d26" alpha:0.5];
    
    _usernameTextField = [LoginTextField creatLoginTextFieldWithFrame:CGRectMake(userNameTitleLabelX, userNameTitleLabelY, KScreenWidth-marginX*1.5, 40) Placeholder:@"手机号" LeftImageName:@"phone_Icon" SelectedLeftImageName:@"phoneIconOn"];
    _usernameTextField.delegate = self;
    [_scrollView addSubview:_usernameTextField];
    _usernameTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    _passwordTextField = [LoginTextField creatLoginTextFieldWithFrame:CGRectMake(userNameTitleLabelX, CGRectGetMaxY(_usernameTextField.frame) + 15, KScreenWidth-marginX*2 - 10, 40) Placeholder:@"密码" LeftImageName:@"passwordIcon" SelectedLeftImageName:@"passwordIconOn"];
    _passwordTextField.delegate = self;
    [_scrollView addSubview:_passwordTextField];

    _passwordTextField.secureTextEntry = YES;
    
    //登录按钮
    UIButton *loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
    CGFloat loginButtonX = 39.5;
    CGFloat loginButtonY = _passwordTextField.maxY+80;
    CGFloat loginButtonH = 40;
    loginButton.frame = CGRectMake(loginButtonX, loginButtonY, KScreenWidth-loginButtonX*2, loginButtonH);
    [loginButton setTitle:@"登 录" forState:UIControlStateNormal];
    [loginButton setTitle:@"登 录" forState:UIControlStateHighlighted];
    loginButton.titleLabel.font = [UIFont fontWithName:KHFontDefault size:17];
//    loginButton.backgroundColor = NavThemeColor;
    loginButton.layer.borderColor=[UIColor whiteColor].CGColor;
    loginButton.layer.borderWidth=1;
    loginButton.layer.cornerRadius=20;
    loginButton.layer.masksToBounds=YES;
    [loginButton addTarget:self action:@selector(loginButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:loginButton];
    
    //忘记密码
    UIButton* forgetCodeButton = [[UIButton alloc]init];
    [forgetCodeButton setTitle:@"忘记密码?" forState:UIControlStateNormal];
    //右对齐
    [forgetCodeButton setContentHorizontalAlignment:UIControlContentHorizontalAlignmentRight];
    forgetCodeButton.titleLabel.font=[UIFont systemFontOfSize:13];
    [forgetCodeButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    forgetCodeButton.frame = CGRectMake(40, _passwordTextField.bottom+20, 60, 30);
    [forgetCodeButton addTarget:self action:@selector(didClickForgetCodeButton) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:forgetCodeButton];
    
    CGFloat contenSizeY = loginButton.maxY + 10;
    scrollView.contentSize = CGSizeMake(320, contenSizeY);
    [self.view addSubview:scrollView];
    
    UITapGestureRecognizer *tapGr = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewTapped:)];
    tapGr.cancelsTouchesInView = NO;
    [scrollView addGestureRecognizer:tapGr];
    
    //注册按钮
    UILabel *registerButton = [[UILabel alloc] init];
    registerButton.font = [UIFont fontWithName:KHFontDefault size:14];
    registerButton.textColor = [UIColor whiteColor];
    registerButton.textAlignment = NSTextAlignmentRight;
    registerButton.text = @"立即注册";
    registerButton.frame = CGRectMake(KScreenWidth-140, forgetCodeButton.y, 100, forgetCodeButton.height);
    [scrollView addSubview:registerButton];
    UITapGestureRecognizer *registerButtonSingleTapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(registerAccount)];
    [registerButton addGestureRecognizer:registerButtonSingleTapGesture];
    registerButton.userInteractionEnabled = YES;
    [scrollView addSubview:registerButton];
    
#ifdef DEBUG
    _usernameTextField.text = @"18502698357";
    _passwordTextField.text = @"qwer1234";
#endif
    
}

- (void)registerAccount
{
    RegisterViewController *registerController = [[RegisterViewController alloc] init];
    registerController.title = @"立即注册";
    registerController.view.backgroundColor=[UIColor whiteColor];
    UINavigationController*nav=[[UINavigationController alloc] initWithRootViewController:registerController];
    [self presentViewController:nav animated:YES completion:nil];
}

-(void)viewTapped:(UITapGestureRecognizer*)tapGr
{
    [_usernameTextField resignFirstResponder];
    [_passwordTextField resignFirstResponder];
}

- (void)didClickswitchBtn
{
//    KHPhoneNumberLoginVC *vc = [[KHPhoneNumberLoginVC alloc]init];
//    [self presentViewController:vc animated:NO completion:nil];
}

- (UITextField *)addTextFieldPlaceholder:(NSString *)placeholder imageName:(NSString *)imageName frame:(CGRect)frame{
    UITextField *textField = [[UITextField alloc]initWithFrame:frame];
    textField.placeholder = placeholder;
    textField.borderStyle = UITextBorderStyleNone;
    textField.font = [UIFont fontWithName:KHFontDefault size:14];
    textField.delegate = self;
    [_scrollView addSubview:textField];
    return textField;
}


- (void)keyboardWillShow:(NSNotification *)notification{
    _scrollView.contentInset = UIEdgeInsetsMake(-100, 0, 0, 0);
    _keyboardShown = YES;
}

- (void)keyboardWillDisappear:(NSNotification *)notification{
    _scrollView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
    _keyboardShown = NO;
}

- (void)loginButtonClicked:(UIButton *)button{
    
    if ([_usernameTextField isFirstResponder]) {
        [_usernameTextField resignFirstResponder];
    }
    
    if (([_passwordTextField isFirstResponder])) {
        [_passwordTextField resignFirstResponder];
    }
    WEAKSELF;
    //判断是否填写了账号和密码
    if (!_usernameTextField.text.length || !_passwordTextField.text.length) {
        [MBProgressHUD showInView:self.view withLabelText:@"请填写账号或密码"  hideAfterDelay:1.6 completion:nil];
        return;
    }
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.labelText = @"登录中";

    LoginAPI * api = [[LoginAPI alloc] initWithUserName:_usernameTextField.text password:_passwordTextField.text];
    [api apiPostWithCompletion:^(id responseObject) {
        
        [hud hideAnimated:YES];
    } failure:^(NSError *error) {
        
        [hud hideAnimated:YES];
    }];
}


- (void)didClickForgetCodeButton{
//    ForgotPasswordViewController * findCode = [[ForgotPasswordViewController alloc]init];
//    findCode.title = @"找回密码";
//    [self presentViewController:findCode animated:YES completion:nil];
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    if ([textField isKindOfClass:[LoginTextField class]]) {
        LoginTextField *loginField = (LoginTextField *)textField;
        loginField.lineViewHighLighted = YES;
        loginField.leftImageViewHighLighted = YES;
    }
    return YES;
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    
    [textField resignFirstResponder];
    if ([textField isKindOfClass:[LoginTextField class]]&&!textField.text.length) {
        LoginTextField *loginField = (LoginTextField *)textField;
        loginField.lineViewHighLighted = NO;
        loginField.leftImageViewHighLighted = NO;
    }
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return true;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [_passwordTextField resignFirstResponder];
    [_usernameTextField resignFirstResponder];
}


-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
}
@end
