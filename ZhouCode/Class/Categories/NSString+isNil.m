//
//  NSString+nil.m
//  ZhouCode
//
//  Created by zhouzilong on 2017/9/13.
//  Copyright © 2017年 zzl. All rights reserved.
//

#import "NSString+isNil.h"
#import <objc/runtime.h>

static NSString *tempIsNilKey = @"tempIsNilKey";

@implementation NSString (isNil)

//- (void)setIsNil:(NSString *)isNil {
//    objc_setAssociatedObject(self, &tempIsNilKey, isNil, OBJC_ASSOCIATION_RETAIN);
//}
//
//- (NSString *)isNil {
//    return objc_getAssociatedObject(self, &tempIsNilKey);
//}


@end
