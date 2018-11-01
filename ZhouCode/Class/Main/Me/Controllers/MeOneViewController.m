//
//  MeOneViewController.m
//  ZhouCode
//
//  Created by zhouzilong on 2017/7/17.
//  Copyright © 2017年 zzl. All rights reserved.
//

#import "MeOneViewController.h"

@interface MeOneViewController ()

@property (nonatomic, assign) BOOL istest;

@end

@implementation MeOneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"我";
    [self initUI];
}


#pragma mark - 初始化

- (void)initUI {
    CellIdentifier = @"cell";
    self.tableView.estimatedRowHeight = 200;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectZero];
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:CellIdentifier];
    [self configureRefreshHeader:self.tableView];
    [self beginDataRefresh];
}

#pragma mark - View(页面处理)


#pragma mark - XXXDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}



#pragma mark - 对外接口


#pragma mark - private methods(内部接口)


#pragma mark -  loading
- (void)refreshData {
    [super refreshData];
    [self loadData];
}

- (void)loadData {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if (!self.istest) {
            [self showNotInternetView];
        }
        self.istest = !self.istest;
        [self endDataRefresh];
    });
}

#pragma mark - 懒加载




@end
