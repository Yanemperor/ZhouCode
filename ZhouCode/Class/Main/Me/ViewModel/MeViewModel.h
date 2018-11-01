//
//  MeViewModel.h
//  ZhouCode
//
//  Created by zhouzilong on 2017/9/12.
//  Copyright © 2017年 zzl. All rights reserved.
//

#import "BaseViewModel.h"
#import "MeModel.h"

@interface MeViewModel : BaseViewModel

@property (nonatomic, strong) MeModel *model;
@property (nonatomic, copy) NSString *left;
@property (nonatomic, copy) NSString *text;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *sex;
@property (nonatomic, copy) NSString *age;



- (void)loadData:(Data)data;
- (void)upData;
@end
