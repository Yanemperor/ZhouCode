//
//  FictionViewController.m
//  ZhouCode
//
//  Created by 周子龙 on 2018/10/29.
//  Copyright © 2018 zzl. All rights reserved.
//

#import "FictionViewController.h"
#import "AddFictionViewController.h"
#import "ReadViewController.h"
#import "FictionQueryModel.h"
#import "FictionListModel.h"
#import "FictionListCell.h"

@interface FictionViewController ()

@property (nonatomic, strong) NSArray *dataArray;

@end

@implementation FictionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initUI];
}


#pragma mark - 初始化

- (void)initUI {
    self.title = @"小说";
    UIButton *rightBarButton = [self navigationBarButton:@"add" eventAction:@selector(addClick)];
    [self setupCustomRightButtonItem:rightBarButton];
    CellIdentifier = @"FictionListCell";
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 60;
    [self.tableView registerClass:[FictionListCell class] forCellReuseIdentifier:CellIdentifier];
    [FictionQueryModel createTable];
    [self reload];
}

#pragma mark - View(页面处理)


#pragma mark - XXXDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    FictionListCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        cell = [[FictionListCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    cell.queryModel = self.dataArray[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    FictionQueryModel *model = self.dataArray[indexPath.row];
    ReadViewController *readVC = [[ReadViewController alloc] init];
    readVC.model = model;
    readVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:readVC animated:YES];
}
#pragma mark - 对外接口


#pragma mark - private methods(内部接口)
- (void)addClick {
    AddFictionViewController *addFictionVC = [[AddFictionViewController alloc] init];
    [addFictionVC setBackBlock:^(id data) {
        [self reload];
    }];
    addFictionVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:addFictionVC animated:YES];
}

#pragma mark -  loading
- (void)reload {
    [FictionQueryModel getAllDataWithBlock:^(NSArray * _Nonnull allData) {
        [FictionListModel getFictionList:allData withBlock:^(NSArray * _Nonnull queryData, NSError * _Nonnull error) {
            self.dataArray = queryData;
            [self.tableView reloadData];
        }];
    }];
    
}


#pragma mark - 懒加载




@end
