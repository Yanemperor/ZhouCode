//
//  HomeViewController.m
//  ZhouCode
//
//  Created by zhouzilong on 2017/7/5.
//  Copyright © 2017年 zzl. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeCell.h"
#import <AddressBook/AddressBook.h>

#import "FictionViewController.h"

@interface HomeViewController ()

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) NSArray *titleArray;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"首页";
    
    [self initUI];
}

#pragma mark - 初始化

- (void)initUI {
    CellIdentifier = @"HomeCell";
    self.tableView.rowHeight = 50.0f;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:CellIdentifier];
    
    self.titleArray = @[@"小说"];
    
}

#pragma mark - View(页面处理)


#pragma mark - XXXDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.titleArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    cell.textLabel.text = self.titleArray[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSString *title = self.titleArray[indexPath.row];
    [self goToVC:FictionViewController.class];
}


- (void)goToVC:(Class)vcName {
    UIViewController *vc = [[vcName alloc] init];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - 对外接口


#pragma mark - private methods(内部接口)


#pragma mark -  loading


#pragma mark - 懒加载



@end
