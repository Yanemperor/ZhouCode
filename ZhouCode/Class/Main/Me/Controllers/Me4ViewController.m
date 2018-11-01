//
//  Me4ViewController.m
//  ZhouCode
//
//  Created by zhouzilong on 2017/9/25.
//  Copyright © 2017年 zzl. All rights reserved.
//

#import "Me4ViewController.h"

@interface Me4ViewController ()

@property (nonatomic, strong) UILabel *unlock;

@end

@implementation Me4ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"";
    
    [self initUI];
}


#pragma mark - 初始化

- (void)initUI {
    self.view.backgroundColor = [UIColor grayColor];
    // 渐变layer
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    [self.view.layer addSublayer:gradientLayer];
    gradientLayer.frame = CGRectMake(0, 200, self.view.width, 64);
    gradientLayer.colors = @[(__bridge id)[UIColor blackColor].CGColor,
                             (__bridge id)[UIColor whiteColor].CGColor,
                             (__bridge id)[UIColor blackColor].CGColor];
    gradientLayer.locations = @[@0.25,@0.5,@0.75];
    gradientLayer.startPoint = CGPointMake(0, 0.5);
    gradientLayer.endPoint = CGPointMake(1, 0.5);
    // 添加部分
    CABasicAnimation *baseAnimation = [CABasicAnimation animationWithKeyPath:@"locations"];
    baseAnimation.fromValue = @[@0,@0,@0.25];
    baseAnimation.toValue = @[@0.75,@1,@1];
    baseAnimation.duration = 2.5;
    baseAnimation.repeatCount = HUGE;
    [gradientLayer addAnimation:baseAnimation forKey:nil];
    // 第二部分添加
    UILabel *unlock = [[UILabel alloc] initWithFrame:gradientLayer.bounds];
    // 必需要强引用保存unlock，此句也可以用[self.view addSubview:unlock]来替代;
    self.unlock = unlock;
    unlock.alpha = 0.5;
    unlock.text = @"滑动来解锁 >>";
    unlock.textAlignment = NSTextAlignmentCenter;
    unlock.font = [UIFont boldSystemFontOfSize:30];
    gradientLayer.mask = unlock.layer;
}

#pragma mark - View(页面处理)


#pragma mark - XXXDelegate


#pragma mark - 对外接口


#pragma mark - private methods(内部接口)


#pragma mark -  loading


#pragma mark - 懒加载



@end
