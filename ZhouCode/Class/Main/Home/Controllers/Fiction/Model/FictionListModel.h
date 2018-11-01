//
//  FictionListModel.h
//  ZhouCode
//
//  Created by 周子龙 on 2018/10/30.
//  Copyright © 2018 zzl. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FictionListModel : NSObject

@property (nonatomic, copy) NSString *_id;
@property (nonatomic, copy) NSString *author;
@property (nonatomic, copy) NSString *allowMonthly;
@property (nonatomic, copy) NSString *referenceSource;
@property (nonatomic, copy) NSString *updated;
@property (nonatomic, copy) NSString *chaptersCount;
@property (nonatomic, copy) NSString *lastChapter;

+ (void)getFictionList:(NSArray *)list withBlock:(void (^)(NSArray *queryData, NSError *error))block;

@end

NS_ASSUME_NONNULL_END
