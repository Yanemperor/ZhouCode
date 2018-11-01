//
//  MeShowView.m
//  ZhouCode
//
//  Created by 周子龙 on 2018/6/28.
//  Copyright © 2018年 zzl. All rights reserved.
//

#import "MeShowView.h"

@interface MeShowView ()

@property (nonatomic, strong) UIButton *button;

@end

@implementation MeShowView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initUI];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self initUI];
    }
    return self;
}

- (void)initUI {
    [self addSubview:self.button];
    [self.button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self).offset(10);
    }];
}

- (UIButton *)button {
    if (!_button) {
        _button = [[UIButton alloc] init];
        _button.backgroundColor = [UIColor orangeColor];
        [[_button rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
            [self.btnClickSubject sendNext:nil];
        }];
    }
    return _button;
}

- (RACSubject *)btnClickSubject {
    if (!_btnClickSubject) {
        _btnClickSubject = [RACSubject subject];
    }
    return _btnClickSubject;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
