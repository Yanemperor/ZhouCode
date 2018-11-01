//
//  BaseTableViewCell.h
//  ZhouCode
//
//  Created by zhouzilong on 2017/9/13.
//  Copyright © 2017年 zzl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseTableViewCell : UITableViewCell

@property (nonatomic, strong) ShowModel *model;
@property (nonatomic, strong) NSIndexPath *indexPath;

@end
