//
//  ChangeNetworkViewController.m
//  ZhouCode
//
//  Created by 周子龙 on 2018/11/27.
//  Copyright © 2018 zzl. All rights reserved.
//

#import "ChangeNetworkViewController.h"
#import "ApiConfigsUtil.h"
@interface ChangeNetworkViewController ()

@property (nonatomic, strong) UILabel *textLabel;

@end

@implementation ChangeNetworkViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initUI];
}


#pragma mark - 初始化

- (void)initUI {
    [[ApiConfigsUtil shareApiConfigsUtil] registerApiNetChangeView:self];
    [self.view addSubview:self.textLabel];
    [self.textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
    }];
    
    
    
}

#pragma mark - View(页面处理)


#pragma mark - XXXDelegate



#pragma mark - 对外接口


#pragma mark - private methods(内部接口)


#pragma mark -  loading


#pragma mark - 懒加载
- (UILabel *)textLabel {
    if (!_textLabel) {
        _textLabel = [[UILabel alloc] init];
        _textLabel.backgroundColor = [UIColor whiteColor];
        _textLabel.textColor = [UIColor blackColor];
        _textLabel.textAlignment = NSTextAlignmentCenter;
        _textLabel.font = [UIFont systemFontOfSize:14.0];
        _textLabel.numberOfLines = 0;
    }
    return _textLabel;
}



@end
