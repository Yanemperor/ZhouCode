//
//  HomeCell.m
//  ZhouCode
//
//  Created by zhouzilong on 2017/7/5.
//  Copyright © 2017年 zzl. All rights reserved.
//

#import "HomeCell.h"

@interface HomeCell ()

@property (nonatomic, strong) UIView *backView;
@property (nonatomic, strong) UIView *redView;
@property (nonatomic, strong) UIView *greenView;

@end

@implementation HomeCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.backView];
        [self.backView addSubview:self.redView];
        [self.backView addSubview:self.greenView];
        [self.redView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_offset(CGSizeMake(50, 50));
            make.top.left.equalTo(self.backView).offset(30);
        }];
        [self.greenView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_offset(CGSizeMake(30, 30));
            make.top.equalTo(self.redView.mas_bottom).offset(20);
            make.left.equalTo(self.backView).offset(40);
            make.bottom.equalTo(self.backView).offset(-20);
        }];
        [self.backView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_offset(UIEdgeInsetsMake(20, 20, 20, 20));
        }];
    }
    return self;
}

- (UIView *)backView {
    if (!_backView) {
        _backView = [[UIView alloc] init];
        _backView.backgroundColor = RGB(234, 234, 239);
    }
    return _backView;
}

- (UIView *)redView {
    if (!_redView) {
        _redView = [[UIView alloc] init];
        _redView.backgroundColor = RGB(253, 242, 224);
    }
    return _redView;
}

- (UIView *)greenView {
    if (!_greenView) {
        _greenView = [[UIView alloc] init];
        _greenView.backgroundColor = RGB(227, 237, 205);
    }
    return _greenView;
}








- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
