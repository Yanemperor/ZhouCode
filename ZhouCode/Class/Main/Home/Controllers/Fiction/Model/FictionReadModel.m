//
//  FictionReadModel.m
//  ZhouCode
//
//  Created by 周子龙 on 2018/10/30.
//  Copyright © 2018 zzl. All rights reserved.
//

#import "FictionReadModel.h"

@implementation FictionReadModel

+ (void)getFictionContent:(FictionQueryModel *)queryModel withBlock:(void (^)(FictionReadModel *fictionReadModel, NSError *error))block {
    NSString *url = [NSString stringWithFormat:@"http://chapter2.zhuishushenqi.com/chapter/http://vip.zhuishushenqi.com/chapter/%@?cv=1534145770354&fieldVersion=v1",queryModel.id];
    [NetRequestManager requestWithType:GET withUrlString:url withParaments:nil withSuccessBlock:^(NSDictionary *successDic) {
        FictionReadModel *model = [FictionReadModel yy_modelWithDictionary:successDic[@"chapter"]];
        if (block) {
            block(model,nil);
        }
    } withFailureBlock:^(NSError *error) {
        if (block) {
            block(nil,error);
        }
    }];
}

@end
