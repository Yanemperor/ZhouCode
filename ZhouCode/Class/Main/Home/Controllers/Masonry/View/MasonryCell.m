//
//  MasonryCell.m
//  ZhouCode
//
//  Created by 周子龙 on 2018/11/9.
//  Copyright © 2018 zzl. All rights reserved.
//

#import "MasonryCell.h"

@interface MasonryCell ()

@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation MasonryCell

- (void)setText:(NSString *)text {
    self.titleLabel.text = text;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.titleLabel];
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.equalTo(self.contentView).offset(15);
            make.right.bottom.equalTo(self.contentView).offset(-15);
        }];
    }
    return self;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.backgroundColor = [UIColor orangeColor];
        _titleLabel.textAlignment = NSTextAlignmentLeft;
        _titleLabel.numberOfLines = 0;
    }
    return _titleLabel;
}

@end
