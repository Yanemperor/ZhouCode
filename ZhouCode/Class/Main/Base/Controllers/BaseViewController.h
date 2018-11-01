//
//  BaseViewController.h
//  EETOP_IN
//
//  Created by yingjian on 17-04-01.
//  Copyright (c) 2017年 TC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseNavigationViewController.h"

@interface BaseViewController : UIViewController

@property (nonatomic, assign) BOOL isNoData;

@property (nonatomic, copy) void(^backBlock)(id data);

/**
 *  @brief  获取、刷新数据
 */
- (void)refreshData;

/**
 *  @brief  全局自定义返回样式
 */
- (void)setupNormalLeftBackButtonItem;

/**
 *  @brief  全局无返回按钮
 */
- (void)setupNOLeftBackButtonItem;

/**
 *  @brief  点击返回
 */
- (void)backBarButtonItemClick:(UIBarButtonItem *)barItem;

/**
 *  @brief  自定义导航左侧按钮
 */
- (void)setupCustomLeftButtonItem:(UIButton *)button;

/**
 *  @brief  自定义导航栏右侧按钮
 */
- (void)setupCustomRightButtonItem:(UIButton *)button;

/**
 *  @brief  自定义导航栏右侧按钮(文本)
 */
- (void)setupTextNavigationBarButton:(NSString *)buttonTitle eventAction:(SEL)action;

/**
 *  @brief  自定义导航栏按钮(图片)
 */
- (UIButton *)navigationBarButton:(NSString *)buttonImage eventAction:(SEL)action;

/**
 *  @brief  全局无导航右侧按钮
 */
- (void)setupNORightButtonItem;

/**
 *  @brief  点击空白处隐藏键盘
 */
- (void)setupTapHiddenKeyboardGesture;

//添加监听键盘的通知
- (void)addKeyboard;

//监听键盘收回
- (void)keyboardDidHide:(NSNotification *)aNotification;

//监听键盘弹出
- (void)keyboardWillShow:(NSNotification *)aNotification;

- (UIButton *)returnNextButton:(CGRect)frame title:(NSString *)title view:(UIView *)view;

- (void)nextButtonAction:(UIButton *)button;

// 没有数据显示
- (void)showNotInternetView;

- (void)hiddenNotInternetView;

@end
