//
//  BaseViewModel.m
//  ZhouCode
//
//  Created by zhouzilong on 2017/7/3.
//  Copyright © 2017年 zzl. All rights reserved.
//

#import "BaseViewModel.h"

@implementation BaseViewModel

- (void)removeAllData {
    [self.dataArray removeAllObjects];
    [self.titleArray removeAllObjects];
}

- (NSMutableArray *)dataArray {
    if (!_dataArray) {
        _dataArray = [[NSMutableArray alloc] init];
    }
    return _dataArray;
}

- (NSMutableArray *)titleArray {
    if (!_titleArray) {
        _titleArray = [[NSMutableArray alloc] init];
    }
    return _titleArray;
}

@end
