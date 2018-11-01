//
//  UtilsMacro.h
//  代码框架
//
//  Created by zzl on 16/6/7.
//  Copyright © 2016年 zzl. All rights reserved.
//

#ifndef UtilsMacro_h
#define UtilsMacro_h

/**
 *  颜色
 */
#define RGB(r, g, b)             [UIColor colorWithRed:((r) / 255.0) green:((g) / 255.0) blue:((b) / 255.0) alpha:1.0]
#define RGBAlpha(r, g, b, a)     [UIColor colorWithRed:((r) / 255.0) green:((g) / 255.0) blue:((b) / 255.0) alpha:(a)]

/**
 *  图片
 */
#define kURL(str) [NSURL URLWithString:str]
#define IMAGE(image)  [UIImage imageNamed:image]

/**
 *  other
 */
#define DelayTime 1.0f //提示框停留时间
#define MessagerText @"这是提示框"
#define kUserDefaults [NSUserDefaults standardUserDefaults]

#define INBOLDFONT(fontsize) [UIFont fontWithName:@"HelveticaNeue-Bold" size:fontsize]
#define INFONT(fontsize) [UIFont fontWithName:@"HelveticaNeue" size:fontsize]
#define Empty_Str(param)            (nil == param || param.length < 1) 
#define DEFAULT_PLIST_FOR_KEY(key)      [[NSBundle mainBundle] objectForInfoDictionaryKey:(NSString *)(key)]
#define kScreenView [UIApplication sharedApplication].keyWindow.viewController.view
#define kScreenController [UIApplication sharedApplication].keyWindow.viewController

#define DLog(xx, ...)  NSLog(@"%s(%d): " xx, __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)

/**
 *  屏幕宽度/高度
 */
#define kIPHONE5_SIZE   (([[UIScreen mainScreen] bounds].size.height>480)?YES:NO)
#define kSCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)
#define kSCREEN_WIDTH  ([UIScreen mainScreen].bounds.size.width)
#define kEY_WINDOW  [[UIApplication sharedApplication]keyWindow]
#define kSCREEN_WIDTHSCALE SCREEN_WIDTH / 320.0

/**
 *  设备版本
 */
#define __IOS_7 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)
#define __IOS_8 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)
#define __IOS_9 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 9.0)

#endif /* UtilsMacro_h */
















