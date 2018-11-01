//
//  FictionListCell.m
//  ZhouCode
//
//  Created by 周子龙 on 2018/10/30.
//  Copyright © 2018 zzl. All rights reserved.
//

#import "FictionListCell.h"

@interface FictionListCell ()

@property (nonatomic, strong) UILabel *bookNameLabel;
@property (nonatomic, strong) UILabel *lastChapterLabel;

@end

@implementation FictionListCell

- (void)setQueryModel:(FictionQueryModel *)queryModel {
    self.bookNameLabel.text = queryModel.text;
    self.lastChapterLabel.text = queryModel.listModel.lastChapter;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.bookNameLabel];
        [self.contentView addSubview:self.lastChapterLabel];
        [self.bookNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(30);
            make.top.equalTo(self.contentView).offset(15);
        }];
        [self.lastChapterLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(30);
            make.top.equalTo(self.bookNameLabel.mas_bottom).offset(10);
            make.bottom.equalTo(self.contentView).mas_offset(-15);
        }];
    }
    return self;
}

- (UILabel *)bookNameLabel {
    if (!_bookNameLabel) {
        _bookNameLabel = [[UILabel alloc] init];
        _bookNameLabel.backgroundColor = [UIColor whiteColor];
        _bookNameLabel.textColor = [UIColor blackColor];
        _bookNameLabel.font = [UIFont boldSystemFontOfSize:15.0];
        _bookNameLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _bookNameLabel;
}

- (UILabel *)lastChapterLabel {
    if (!_lastChapterLabel) {
        _lastChapterLabel = [[UILabel alloc] init];
        _lastChapterLabel.backgroundColor = [UIColor whiteColor];
        _lastChapterLabel.textColor = [UIColor lightGrayColor];
        _lastChapterLabel.font = [UIFont boldSystemFontOfSize:13.0];
        _lastChapterLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _lastChapterLabel;
}

@end
