//
//  MeCell.m
//  ZhouCode
//
//  Created by zhouzilong on 2017/9/12.
//  Copyright © 2017年 zzl. All rights reserved.
//

#import "MeCell.h"

@interface MeCell ()


@end


@implementation MeCell

- (void)layoutSubviews {
    [super layoutSubviews];
//    NSLog(@"%@",self.textField.size);
}

- (void)bindViewModel:(MeViewModel *)viewModel left:(NSString *)title {
    self.leftLabel.text = title;
    if ([title isEqualToString:@"姓名"]) {
        self.textField.text = viewModel.name;
        RAC(viewModel, name) = [RACObserve(self.textField, text) takeUntil:self.rac_prepareForReuseSignal];
        //        RAC(viewModel, model.name) = [RACChannelTo(self.textField, text) takeUntil:self.rac_prepareForReuseSignal];
    }else if ([title isEqualToString:@"性别"]) {
        self.textField.text = viewModel.sex;
        RAC(viewModel, sex) = [RACObserve(self.textField, text) takeUntil:self.rac_prepareForReuseSignal];
    }else if ([title isEqualToString:@"年龄"]) {
        self.textField.text = viewModel.age;
        RAC(viewModel, age) = [RACObserve(self.textField, text) takeUntil:self.rac_prepareForReuseSignal];
    }
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.leftLabel];
        [self.contentView addSubview:self.textField];
        [self.leftLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(15);
            make.centerY.equalTo(self.contentView.mas_centerY);
        }];
        [self.textField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentView).offset(1);
            make.bottom.equalTo(self.contentView).offset(-1);
            make.right.equalTo(self.contentView).offset(-15);
            make.left.greaterThanOrEqualTo(self.leftLabel.mas_right).offset(20);
        }];
        [self.leftLabel setContentCompressionResistancePriority:751 forAxis:UILayoutConstraintAxisHorizontal];
        
        @weakify(self);
        [RACObserve(self, viewModel) subscribeNext:^(MeShowViewModel *viewModel) {
            @strongify(self);
            self.leftLabel.text = viewModel.titleContent;
            self.textField.text = viewModel.textContent;
        }];
        [self layoutIfNeeded];
    }
    return self;
}

- (UILabel *)leftLabel {
    if (!_leftLabel) {
        _leftLabel = [[UILabel alloc] init];
        _leftLabel.backgroundColor = [UIColor whiteColor];
        _leftLabel.textColor = [UIColor blackColor];
        _leftLabel.textAlignment = NSTextAlignmentLeft;
        _leftLabel.font = [UIFont systemFontOfSize:13.0];
    }
    return _leftLabel;
}

- (UITextField *)textField {
    if (!_textField) {
        _textField = [[UITextField alloc] init];
        _textField.backgroundColor = [UIColor whiteColor];
        _textField.textColor = [UIColor blackColor];
        _textField.textAlignment = NSTextAlignmentRight;
        _textField.font = [UIFont systemFontOfSize:13.0];

    }
    return _textField;
}

@end
