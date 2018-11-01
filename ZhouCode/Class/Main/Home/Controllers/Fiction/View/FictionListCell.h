//
//  FictionListCell.h
//  ZhouCode
//
//  Created by 周子龙 on 2018/10/30.
//  Copyright © 2018 zzl. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FictionQueryModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface FictionListCell : UITableViewCell

@property (nonatomic, strong) FictionQueryModel *queryModel;

@end

NS_ASSUME_NONNULL_END
