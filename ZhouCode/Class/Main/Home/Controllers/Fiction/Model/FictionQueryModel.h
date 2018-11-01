//
//  FictionQueryModel.h
//  ZhouCode
//
//  Created by 周子龙 on 2018/10/29.
//  Copyright © 2018 zzl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FictionListModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface FictionQueryModel : NSObject

@property (nonatomic, copy) NSString *author;
@property (nonatomic, copy) NSString *contentType;
@property (nonatomic, copy) NSString *id;
@property (nonatomic, copy) NSString *tag;
@property (nonatomic, copy) NSString *text;
@property (nonatomic, strong) FictionListModel *listModel;


+ (void)globalTimelineWithQuery:(NSString *)query withBlock:(void (^)(NSArray *queryData, NSError *error))block;

+ (void)createTable;

+ (BOOL)insertData:(FictionQueryModel *)model;

+ (BOOL)getAllDataWithBlock:(void (^)(NSArray *allData))block;

@end

NS_ASSUME_NONNULL_END
