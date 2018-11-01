//
//  DBOperation.h
//  ZhouCode
//
//  Created by zhouzilong on 2017/7/3.
//  Copyright © 2017年 zzl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DBOperation : NSObject

+ (BOOL)createTableWithName:(NSString *)tableName classWith:(Class)className;

@end
