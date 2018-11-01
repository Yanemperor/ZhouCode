//
//  BaseHUDViewController.m
//  EETOP_IN
//
//  Created by yingjian on 2017/4/1.
//  Copyright © 2017年 TCGroup. All rights reserved.
//

#import "BaseHUDViewController.h"

@interface BaseHUDViewController ()
{
    MBProgressHUD *HUD;
    BOOL loading;
}

@end

@implementation BaseHUDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.delayTime = 1.5;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    loading = YES;
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    loading = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - HUD

#pragma mark - 一直显示的HUD

- (void)showHUD:(NSString *)text
{
    if (!text) {
        text = @"加载中...";
    }
    [self showHUDInView:text view:self.view];
}

- (void)showHUDInWindow:(NSString *)text
{
    UIWindow *tempKeyboardWindow = [UIApplication sharedApplication].keyWindow;
    [self showHUDInView:text view:tempKeyboardWindow];
}

- (void)showHUDInView:(NSString *)text view:(UIView *)view
{
    if (HUD) {
        [self hideHUD];
    }
    
    HUD = [[MBProgressHUD alloc] initWithView:view];
    //    HUD.mode = MBProgressHUDModeCustomView;
    HUD.label.font = KMainTextFont;
    HUD.minShowTime = 0.5;
//    HUD.taskInProgress = YES;
    
    NSTimeInterval graceTime = 0;
    HUD.graceTime = graceTime;
    [view addSubview:HUD];
    if (text){
        HUD.label.text = text;
        HUD.label.font = KMainTextFont;
        HUD.label.backgroundColor = kClearColor;
        HUD.label.textColor = COLOR_HUD_Text;
    }
    HUD.removeFromSuperViewOnHide = YES;
    HUD.bezelView.layer.cornerRadius = 2.0f;
    HUD.bezelView.layer.opacity = 1;
    HUD.bezelView.backgroundColor = COLOR_HUD_Background;
    HUD.margin = 10.0f;
    
    [HUD showAnimated:YES];
}

#pragma mark - 显示固定时间的HUD

- (void)showTipsHUD:(NSString *)text
{
    if (!text || [text length] == 0) {
        return;
    }
    [self showHUDWithImage:nil withText:text];
}

- (void)showCompletedHUD:(NSString *)text
{
    if (!text || [text length] == 0) {
        return;
    }
    [self showHUDWithImage:nil withText:text];
}

- (void)showHUDWithImage:(NSString *)imgName withText:(NSString *)text
{
    UIWindow *tempKeyboardWindow = [UIApplication sharedApplication].keyWindow;
    UIView *view = self.view ? : tempKeyboardWindow;
    
    loading = NO;
    if (HUD) {
        [self hideHUD];
    }
    
    HUD = [[MBProgressHUD alloc] initWithView:view];
    HUD.mode = MBProgressHUDModeCustomView;
    if (imgName) {
        HUD.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imgName]];
    }
    [view addSubview:HUD];
    
    UITapGestureRecognizer *recognizer =
    [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideHUD)];
    [HUD addGestureRecognizer:recognizer];
    
    if (text) {
        HUD.detailsLabel.text = text;
        HUD.detailsLabel.font = KMainTextFont;
        HUD.detailsLabel.textColor = COLOR_HUD_Text;
        HUD.detailsLabel.backgroundColor = kClearColor;
    }
    HUD.bezelView.layer.cornerRadius = 2.0f;
    HUD.bezelView.layer.opacity = 1;
    HUD.bezelView.backgroundColor = COLOR_HUD_Background;
    HUD.margin = 10.0f;
    
    HUD.removeFromSuperViewOnHide = YES;
    [HUD showAnimated:YES];
    
    [HUD hideAnimated:YES afterDelay:self.delayTime];
}

- (void)hideHUD
{
    loading = NO;
    [HUD hideAnimated:YES];
    [HUD.customView removeFromSuperview];
    HUD = nil;
}

- (BOOL)isHUDShowing
{
    return HUD && ![HUD isHidden];
}

@end
