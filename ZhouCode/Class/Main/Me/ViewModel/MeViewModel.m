//
//  MeViewModel.m
//  ZhouCode
//
//  Created by zhouzilong on 2017/9/12.
//  Copyright © 2017年 zzl. All rights reserved.
//

#import "MeViewModel.h"
#import "MeShowViewModel.h"

@implementation MeViewModel

- (void)loadData:(Data)data {
    MeModel *model = [[MeModel alloc] init];
    model.name = @"周一什么深思熟虑深蓝色了说了爱上了索拉鲁斯闪乱神乐思考思考开始看";
    model.sex = @"1";
    model.age = 18;
    self.model = model;
    [self upData];
    data(@"");
}

- (void)upData {
    [self removeAllData];
    self.name = _model.name;
    self.sex = [_model.sex isEqualToString:@"1"] ? @"男" : @"女";
    self.age = [NSString stringWithFormat:@"%li岁",_model.age];
    NSArray *titleArray = @[@"姓名", @"性别", @"年龄"];
    NSArray *dataArray = @[self.name, self.sex, self.age];
    for (int i = 0; i < titleArray.count; i++) {
        ShowModel *model = [[ShowModel alloc] init];
        model.left = titleArray[i];
        model.text = dataArray[i];
        MeShowViewModel *showViewModel = [[MeShowViewModel alloc] initWithModel:model];
        [self.dataArray addObject:showViewModel];
    }
    
    self.titleArray = [[NSMutableArray alloc] initWithArray:titleArray];
}

@end
