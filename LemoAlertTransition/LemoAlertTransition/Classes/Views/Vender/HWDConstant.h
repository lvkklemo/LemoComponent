//
//  HWDConstant.h
//  HWDGlasses
//
//  Created by 宇航 on 17/3/14.
//  Copyright © 2017年 HWD. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "UIView+Extension.h"
#import "MBProgressHUD+HWDHUDProgress.h"
#import "YYModel.h"
#import "UIBarButtonItem+Extension.h"
#import "SDCycleScrollView.h"
#import "UIView+BorderLine.h"
#define HWDColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
//R G B A 颜色
#define HWDRGBAColor(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 \
alpha:(a)]
#define DefaultColor  HWDColor(241,241,241)
#define NavThemeColor HWDColor(221, 50, 118)

#define BEEGenraralShallowGoldText HWDColor(178, 117, 50) //配搭上面浅金色按钮的文字

#define TextDisableColor HWDColor(191, 191, 191)

#define GeneralGrayColor HWDColor(238, 238, 238)
#define GroupedTableViewBackgroundColor HWDColor(244, 244, 244)



#define WEAKSELF typeof(self) __weak weakSelf = self;
#define STRONGSELF typeof(weakSelf) __strong strongSelf = weakSelf;

//屏幕高宽
#define KScreenWidth  [UIScreen mainScreen].bounds.size.width
#define KScreenHeight [UIScreen mainScreen].bounds.size.height
#define HWD_IS_IPHONE_X ((MIN([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) == 375 && MAX([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) == 812))

#define KHFontSTHeitiSC @"STHeitiSC-Light"
//字体
#define KHFontDefault @"HiraginoSans-W3"
//#define TextStyle3Color RGB_COLOR(204, 211, 213)
//#define KHViewConTrollerBackgroundColor RGB_COLOR(239, 239, 244)
//#define KHFontHiraKakuProN_W3 @"HiraKakuProN-W3"
//#define KHFontHiraginoSans_W3 @"HiraginoSans-W3"
//#define KHFontAvenir_Book @"Avenir-Book"
//UUID
#define UUID [[UIDevice currentDevice].identifierForVendor UUIDString]
//消息
#define KHLoginHadSuccessNotify @"KHLoginHadSuccessfulN"
#define kBEEWXPaySuccessNotification @"BEEWXPaySuccessNotification"
#define kBEEWXPayFailureNotification @"kBEEWXPayFailureNotification"

#define kBEEAliPaySuccessNotification @"BEEAliPaySuccessNotification"
#define kBEEALiPayFaliureNotiftication @"BEEALiPayFailureNotification"

#define kMoreTCNotiftication @"MoreNailTCButtonClick"
#define kMoreUnionNotiftication @"MoreNailUnionButtonClick"
#define KHWXPaySuccessNotify @"khWXPaySuccessNotify"
//extern NSString *const kRecordClinicalDiagnosisTreatmentRecordsText;
//extern NSString *const kRecordSupplementaryExaminationText;
//extern NSString *const kRecordLaboratoryExaminationText;
//extern NSString *const kRecordPathologyText;

//Singleton模板
// .h文件
#define KHSingletonH(name) + (instancetype)shared##name;
// .m文件
#define KHSingletonM(name) \
static id _instance; \
\
+ (instancetype)allocWithZone:(struct _NSZone *)zone \
{ \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
_instance = [super allocWithZone:zone]; \
}); \
return _instance; \
} \
\
+ (instancetype)shared##name \
{ \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
_instance = [[self alloc] init]; \
}); \
return _instance; \
} \
\
- (id)copyWithZone:(NSZone *)zone \
{ \
return _instance; \
}
