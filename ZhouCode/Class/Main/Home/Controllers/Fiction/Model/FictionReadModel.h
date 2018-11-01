//
//  FictionReadModel.h
//  ZhouCode
//
//  Created by 周子龙 on 2018/10/30.
//  Copyright © 2018 zzl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FictionQueryModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface FictionReadModel : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *body;
@property (nonatomic, copy) NSString *isVip;
@property (nonatomic, copy) NSString *order;    // 主键
@property (nonatomic, copy) NSString *currency;
@property (nonatomic, copy) NSString *id;
@property (nonatomic, copy) NSString *created;
@property (nonatomic, copy) NSString *updated;
@property (nonatomic, copy) NSString *cpContent;

+ (void)getFictionContent:(FictionQueryModel *)queryModel withBlock:(void (^)(FictionReadModel *fictionReadModel, NSError *error))block;

@end

NS_ASSUME_NONNULL_END
