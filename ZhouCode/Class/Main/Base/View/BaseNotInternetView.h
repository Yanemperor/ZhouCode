//
//  BaseNotInternetView.h
//  ZhouCode
//
//  Created by zhouzilong on 2017/7/13.
//  Copyright © 2017年 zzl. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol BaseNotInternetViewDelegate <NSObject>

- (void)reloadNetworkRequest:(id)sender;

@end

@interface BaseNotInternetView : UIView

@property (nonatomic, weak) id<BaseNotInternetViewDelegate> delegate;

@end
