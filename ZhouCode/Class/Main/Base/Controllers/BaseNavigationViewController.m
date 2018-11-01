//
//  BaseNavigationViewController.m
//  EETOP_IN
//
//  Created by yingjian on 2017/4/1.
//  Copyright © 2017年 TCGroup. All rights reserved.
//

#import "BaseNavigationViewController.h"

@interface BaseNavigationViewController ()<UIGestureRecognizerDelegate>

@end

@implementation BaseNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    if([self respondsToSelector:@selector(interactivePopGestureRecognizer)]){
        [self.interactivePopGestureRecognizer setDelegate:self];
    }
    
    self.navigationBar.translucent = NO;

    // 默认可返回
    self.canDragBack = YES;
}

- (UIViewController *)childViewControllerForStatusBarStyle
{
    return self.topViewController;
}

- (BOOL)prefersStatusBarHidden
{
    return NO;
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}

#pragma mark - UIGestureRecognizerDelegate
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    if (self.navigationController.viewControllers.count == 1 || !self.canDragBack)
    {
        return NO;
    }
    else{
        return YES;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
