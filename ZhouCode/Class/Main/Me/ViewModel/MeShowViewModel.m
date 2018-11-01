//
//  MeShowViewModel.m
//  ZhouCode
//
//  Created by zhouzilong on 2017/9/18.
//  Copyright © 2017年 zzl. All rights reserved.
//

#import "MeShowViewModel.h"

@implementation MeShowViewModel

- (instancetype)initWithModel:(ShowModel *)model {
    self = [super init];
    if (self) {
        RAC(self, titleContent) = RACObserve(model, left);
        RAC(self, textContent) = RACObserve(model, text);
    }
    return self;
}

@end
