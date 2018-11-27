//
//  MasonryViewController.m
//  ZhouCode
//
//  Created by 周子龙 on 2018/11/9.
//  Copyright © 2018 zzl. All rights reserved.
//

#import "MasonryViewController.h"
#import "MasonryCell.h"
@interface MasonryViewController ()

@property (nonatomic, copy) NSArray *titleArray;

@end

@implementation MasonryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initUI];
}


#pragma mark - 初始化

- (void)initUI {
    self.title = @"Masonry";
    CellIdentifier = @"MasonryCell";
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 50;
    [self.tableView registerClass:[MasonryCell class] forCellReuseIdentifier:CellIdentifier];
    self.titleArray = @[@"我是文字我是文字我是文字我是文字我是文字",@"我是文字我是文字我是文字我是文字我是文字我是文字我是文字我是文字我是文字我是文字",@"我是文字我是文字我是文字我是文字我是文字我是文字我是文字我是文字我是文字我是文字我是文字我是文字我是文字我是文字我是文字我是文字我是文字"];
}

#pragma mark - View(页面处理)


#pragma mark - XXXDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.titleArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MasonryCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    cell.text = self.titleArray[indexPath.row];
    return cell;
}


#pragma mark - 对外接口


#pragma mark - private methods(内部接口)


#pragma mark -  loading


#pragma mark - 懒加载




/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
