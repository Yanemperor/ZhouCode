//
//  BaseTableViewController.h
//  EETOP_IN
//
//  Created by yingjian on 2017/4/1.
//  Copyright © 2017年 TCGroup. All rights reserved.
//

#import "BaseHUDViewController.h"
#import "MJRefresh.h"

static NSString *CellIdentifier = @"CellIdentifier";

@interface BaseTableViewController : BaseHUDViewController<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) UIView *headerView;

@property (nonatomic, strong) UIView *footerView;

/** 当前视图数组 */
@property (nonatomic, strong) NSMutableArray *dataList;

/** 下拉刷新,默认添加判断接收数据添加上拉加载控件，可通过showFooterView控制是否显示 */
@property (nonatomic, strong) MJRefreshNormalHeader *header;

/** 上拉加载 */
@property (nonatomic, strong) MJRefreshAutoNormalFooter *footer;


/** 刷新状态 */
@property (nonatomic, assign) RefreshType  refreshStatus;

/** 限制每次获取数据条数，默认为10 */
@property (nonatomic, assign) NSInteger perPageCount;

/** 接收到数据量 */
@property (nonatomic, assign) NSInteger receiveCount;

/** 当前存在的数据量 */
@property (nonatomic, assign) NSInteger existCount;

/** 分页加载起始页 */
@property (nonatomic, assign) NSInteger startPage;

/** 是否显示底部上拉加载更多控件，Default is YES  */
@property (nonatomic, assign) BOOL showFooterView;

/**
 *  @brief  添加下拉刷新控件
 */
- (void)configureRefreshHeader:(UIScrollView *)tableView;

/**
 *  @brief  添加上拉加载更多控件
 *
 */
- (void)configureRefreshFooter:(UIScrollView *)tableView;

/**
 *  @brief  移除下拉刷新、上拉控件
 */
- (void)removeRefreshFooter;

/**
 *  @brief  开始下拉刷新
 */
- (void)beginDataRefresh;

/**
 *  @brief  数据刷新结束
 */
- (void)endDataRefresh;

/**
 *  @brief  table style
 */
- (UITableViewStyle)setupTableStyle;

@end
