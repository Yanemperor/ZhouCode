//
//  CatalogueModel.h
//  ZhouCode
//
//  Created by 周子龙 on 2018/10/30.
//  Copyright © 2018 zzl. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CatalogueModel : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *link;
@property (nonatomic, copy) NSString *id;
@property (nonatomic, copy) NSString *time;
@property (nonatomic, copy) NSString *chapterCover;
@property (nonatomic, copy) NSString *totalpage;
@property (nonatomic, copy) NSString *partsize;
@property (nonatomic, copy) NSString *order;
@property (nonatomic, copy) NSString *currency;
@property (nonatomic, copy) NSString *unreadble;
@property (nonatomic, copy) NSString *isVip;

//+ (void)getCatalogue

@end

NS_ASSUME_NONNULL_END
