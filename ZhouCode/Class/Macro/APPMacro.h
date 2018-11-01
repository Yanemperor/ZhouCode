//
//  APPMacro.h
//  EETOP_IN
//
//  Created by zzl on 16/8/24.
//  Copyright © 2016年 TCGroup. All rights reserved.
//

#ifndef APPMacro_h
#define APPMacro_h

#endif /* APPMacro_h */

// 配置接口坏境
#define 正式环境
#define 模测环境
#define 测试环境

#ifdef 测试环境

#define BaseURL @""





#elif  defined 模测环境

#define BaseURL @"模测环境URL"




#else

#define BaseURL @"正式环境URL"

#endif



