//
//  MeCell.h
//  ZhouCode
//
//  Created by zhouzilong on 2017/9/12.
//  Copyright © 2017年 zzl. All rights reserved.
//

#import "BaseTableViewCell.h"
#import "MeShowViewModel.h"
#import "MeViewModel.h"

@interface MeCell : BaseTableViewCell

@property (nonatomic, strong) UITextField *textField;
@property (nonatomic, strong) MeShowViewModel *viewModel;
@property (nonatomic, strong) UILabel *leftLabel;

- (void)bindViewModel:(MeViewModel *)viewModel left:(NSString *)title;

@end
