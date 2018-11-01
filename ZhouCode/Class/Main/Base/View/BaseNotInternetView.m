//
//  BaseNotInternetView.m
//  ZhouCode
//
//  Created by zhouzilong on 2017/7/13.
//  Copyright © 2017年 zzl. All rights reserved.
//

#import "BaseNotInternetView.h"

@interface BaseNotInternetView ()

@property (nonatomic, strong) UIButton *button;

@end

@implementation BaseNotInternetView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.button];
    }
    return self;
}

- (UIButton *)button {
    if (!_button) {
        _button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
        _button.center = self.center;
        _button.backgroundColor = [UIColor whiteColor];
        [_button setTitle:@"重新加载" forState:UIControlStateNormal];
        [_button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_button setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
        [_button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _button;
}

- (void)buttonClick:(UIButton *)button {
    if (self.delegate && [self.delegate respondsToSelector:@selector(reloadNetworkRequest:)]) {
        [self.delegate performSelector:@selector(reloadNetworkRequest:) withObject:button];
    }
}


@end
