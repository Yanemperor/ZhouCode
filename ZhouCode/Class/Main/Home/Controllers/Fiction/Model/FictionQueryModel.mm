//
//  FictionQueryModel.m
//  ZhouCode
//
//  Created by 周子龙 on 2018/10/29.
//  Copyright © 2018 zzl. All rights reserved.
//

#import "FictionQueryModel.h"
#import <WCDB/WCDB.h>

@interface FictionQueryModel() <WCTTableCoding>

@end

@implementation FictionQueryModel

WCDB_IMPLEMENTATION(FictionQueryModel)
WCDB_SYNTHESIZE(FictionQueryModel,author)
WCDB_SYNTHESIZE(FictionQueryModel,contentType)
WCDB_SYNTHESIZE(FictionQueryModel,id)
WCDB_SYNTHESIZE(FictionQueryModel,tag)
WCDB_SYNTHESIZE(FictionQueryModel,text)

+ (void)globalTimelineWithQuery:(NSString *)query withBlock:(void (^)(NSArray *queryData, NSError *error))block {
    [NetRequestManager requestWithType:GET withUrlString:@"https://api.zhuishushenqi.com/book/auto-suggest" withParaments:@{@"query":query,@"packageName":@"com.ifmoc.ZhuiShuShenQi"} withSuccessBlock:^(NSDictionary *successDic) {
        NSArray *dataArray = successDic[@"keywords"];
        NSMutableArray *mutableDataArray = [[NSMutableArray alloc] init];
        for (NSDictionary *dic in dataArray) {
            FictionQueryModel *model = [FictionQueryModel yy_modelWithDictionary:dic];
            [mutableDataArray addObject:model];
        }
        if (block) {
            block(mutableDataArray,nil);
        }
    } withFailureBlock:^(NSError *error) {
        NSLog(@"%@",error);
        if (block) {
            block([NSArray array],error);
        }
    }];
}

+ (WCTDatabase *)getDatabase {
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *dbPath = [path stringByAppendingPathComponent:@"Fiction.db"];
    WCTDatabase *dataBase = [[WCTDatabase alloc] initWithPath:dbPath];
    return dataBase;
}

+ (void)createTable {
    WCTDatabase *dataBase = [FictionQueryModel getDatabase];
    if (![dataBase isTableExists:@"Fiction"]) {
        BOOL result = [dataBase createTableAndIndexesOfName:@"Fiction" withClass:FictionQueryModel.class];
        NSLog(@"Fiction数据库创建%@",result?@"成功":@"失败");
    }
}

+ (BOOL)insertData:(FictionQueryModel *)model {
    WCTDatabase *dataBase = [FictionQueryModel getDatabase];
    BOOL result = [dataBase insertObject:model into:@"Fiction"];
    return result;
}

+ (BOOL)getAllDataWithBlock:(void (^)(NSArray *allData))block {
    WCTDatabase *dataBase = [FictionQueryModel getDatabase];
    NSArray *allData = [dataBase getObjectsOfClass:FictionQueryModel.class fromTable:@"Fiction" orderBy:FictionQueryModel.id.order()];
    if (block) {
        block(allData);
        return YES;
    }
    return NO;
}

@end
