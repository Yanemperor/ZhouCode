//
//  Me2ViewController.m
//  ZhouCode
//
//  Created by zhouzilong on 2017/9/11.
//  Copyright © 2017年 zzl. All rights reserved.
//

#import "Me2ViewController.h"

@interface Me2ViewController ()

@property (nonatomic, strong) UITextField *textView1;
@property (nonatomic, strong) UITextField *textView2;
@property (nonatomic, strong) UILabel *label1;

@end

@implementation Me2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"2";
    
    [self initUI];
}


#pragma mark - 初始化

- (void)initUI {
    [self.view addSubview:self.textView1];
    [self.view addSubview:self.textView2];
    [self.view addSubview:self.label1];
    [self.textView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(20);
        make.right.equalTo(self.textView2.mas_left).offset(-30);
        make.centerY.equalTo(self.textView2.mas_centerY);
        make.top.equalTo(self.view).offset(100);
        make.height.mas_offset(30);
    }];
    [self.textView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.view).offset(-20);
        make.width.equalTo(self.textView1.mas_width);
        make.height.mas_offset(30);
    }];
    [self.label1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(self.textView1);
        make.left.equalTo(self.textView1.mas_left);
        make.bottom.equalTo(self.textView1.mas_top).offset(-20);
    }];
    
    
    
    
    
    
    
//    [[self.textView1.rac_newTextChannel map:^id(NSString *value) {
//        if (value.length > 0) {
//            NSString *last = [value substringFromIndex:value.length - 1];
//            return last;
//        }else{
//            return value;
//        }
//    }]
//    subscribeNext:^(id x) {
//        NSLog(@"%@",x);
//    }];
    
//    [[self.textView1.rac_newTextChannel filter:^BOOL(NSString *value) {
//        return value.length > 3;
//    }]
//    subscribeNext:^(id x) {
//        NSLog(@"%@",x);
//    }];
    
//    RAC(self, textView1.text) = RACObserve(self, textView2.text);
//    RAC(self, label1.text) = RACObserve(self, textView1.text);
//    RAC(self, label1.text) = self.textView1.rac_newTextChannel;
//    self.label1.rac_willDeallocSignal
    
//    RACChannelTo(self, textView1.text) = RACChannelTo(self, textView2.text);
    
    [self.textView1.rac_newTextChannel subscribe:self.textView2.rac_newTextChannel];
    [self.textView2.rac_newTextChannel subscribe:self.textView1.rac_newTextChannel];
    [[NSUserDefaults standardUserDefaults] rac_channelTerminalForKey:@"key"];
}

#pragma mark - View(页面处理)


#pragma mark - XXXDelegate


#pragma mark - 对外接口


#pragma mark - private methods(内部接口)


#pragma mark -  loading

#pragma mark - 懒加载

- (UITextField *)textView1 {
    if (!_textView1) {
        _textView1 = [[UITextField alloc] init];
        _textView1.layer.masksToBounds = YES;
        _textView1.layer.cornerRadius = 3;
        _textView1.layer.borderColor = [UIColor lightGrayColor].CGColor;
        _textView1.layer.borderWidth = .5;
    }
    return _textView1;
}

- (UITextField *)textView2 {
    if (!_textView2) {
        _textView2 = [[UITextField alloc] init];
        _textView2.layer.masksToBounds = YES;
        _textView2.layer.cornerRadius = 3;
        _textView2.layer.borderColor = [UIColor lightGrayColor].CGColor;
        _textView2.layer.borderWidth = .5;
    }
    return _textView2;
}

- (UILabel *)label1 {
    if (!_label1) {
        _label1 = [[UILabel alloc] init];
        _label1.backgroundColor = [UIColor whiteColor];
        _label1.textColor = [UIColor blackColor];
        _label1.textAlignment = NSTextAlignmentLeft;
        _label1.font = [UIFont systemFontOfSize:13.0];
    }
    return _label1;
}







@end
