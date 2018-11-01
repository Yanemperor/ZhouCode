//
//  BaseTabBarController.m
//  ZhouCode
//
//  Created by zhouzilong on 2017/6/30.
//  Copyright © 2017年 zzl. All rights reserved.
//

#import "BaseTabBarController.h"
#import "BaseNavigationViewController.h"
#import "HomeViewController.h"
#import "MeViewController.h"

@interface BaseTabBarController ()

@end

@implementation BaseTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addChildViewController];
}

- (void)addChildViewController {
    [[UITabBar appearance] setTintColor:[UIColor orangeColor]];
    HomeViewController *homeVC = [[HomeViewController alloc] init];
    MeViewController *meVC = [[MeViewController alloc] init];
    [self setupOneChildViewController:@"首页" image:@"tabbar_home" selectedImage:@"tabbar_home_selected" controller:homeVC];
    [self setupOneChildViewController:@"我" image:@"tabbar_profile" selectedImage:@"tabbar_profile_selected" controller:meVC];
}

- (void)setupOneChildViewController:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage controller:(UIViewController *)controller {
    controller.tabBarItem.title = title;
    controller.tabBarItem.image = [UIImage imageNamed:image];
    controller.tabBarItem.selectedImage = [UIImage imageNamed:selectedImage];
    BaseNavigationViewController *naviController = [[BaseNavigationViewController alloc] initWithRootViewController:controller];
    [self addChildViewController:naviController];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
