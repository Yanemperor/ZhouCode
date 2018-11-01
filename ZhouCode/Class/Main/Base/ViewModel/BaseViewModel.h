//
//  BaseViewModel.h
//  ZhouCode
//
//  Created by zhouzilong on 2017/7/3.
//  Copyright © 2017年 zzl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NetRequestManager.h"

typedef void (^Data) (id returnValue);
typedef void (^Error) (id returnValue);

@interface BaseViewModel : NSObject

@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, strong) NSMutableArray *titleArray;

- (void)removeAllData;

@end
