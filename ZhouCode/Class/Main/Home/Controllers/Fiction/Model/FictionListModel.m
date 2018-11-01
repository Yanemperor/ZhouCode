//
//  FictionListModel.m
//  ZhouCode
//
//  Created by 周子龙 on 2018/10/30.
//  Copyright © 2018 zzl. All rights reserved.
//

#import "FictionListModel.h"
#import "FictionQueryModel.h"
#import "YTKNetwork.h"
@implementation FictionListModel

+ (void)getFictionList:(NSArray *)list withBlock:(void (^)(NSArray *queryData, NSError *error))block {
    NSString *value = @"";
    for (int i = 0; i < list.count; i++) {
        FictionQueryModel *item = list[i];
        if (i == 0) {
            value = item.id;
        }else{
            value = [NSString stringWithFormat:@"%@,%@",value,item.id];
        }
    }
    [NetRequestManager requestWithType:POST withUrlString:@"https://api.zhuishushenqi.com/book/updated" withParaments:@{@"id":value} withSuccessBlock:^(NSArray *successArray) {
        NSArray *dataArray = successArray;
        NSMutableArray *mutableDataArray = [[NSMutableArray alloc] init];
        for (FictionQueryModel *item in list) {
            for (NSDictionary *dic in dataArray) {
                FictionListModel *model = [FictionListModel yy_modelWithDictionary:dic];
                if ([model._id isEqualToString:item.id]) {
                    item.listModel = model;
                }
            }
        }
        if (block) {
            block(list,nil);
        }
    } withFailureBlock:^(NSError *error) {
        NSLog(@"%@",error);
        if (block) {
            block([NSArray array],error);
        }
    }];
}


@end
