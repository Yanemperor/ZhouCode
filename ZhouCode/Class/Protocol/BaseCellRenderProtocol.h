//
//  BaseCellRenderProtocol.h
//  ZhouCode
//
//  Created by zhouzilong on 2017/9/13.
//  Copyright © 2017年 zzl. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol BaseCellRenderProtocol <NSObject>

@required
// Cell对应的重用标识
- (NSString *)cellIdentifier;

@end
