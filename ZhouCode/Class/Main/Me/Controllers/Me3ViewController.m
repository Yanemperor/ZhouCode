//
//  Me3ViewController.m
//  ZhouCode
//
//  Created by zhouzilong on 2017/9/12.
//  Copyright © 2017年 zzl. All rights reserved.
//

#import "Me3ViewController.h"
#import "MeViewModel.h"
#import "MeCell.h"
#import "MeShowView.h"

@interface Me3ViewController ()

@property (nonatomic, strong) MeViewModel *viewModel;
@property (nonatomic, strong) UIView *footView;
@property (nonatomic, strong) NSString *titles;
@property (nonatomic, strong) NSString *temp;
@property (nonatomic, strong) NSArray *tempArray;
@property (nonatomic, strong) MeShowView *showView;

@end

@implementation Me3ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"";
    
    [self initUI];
}


#pragma mark - 初始化

- (void)initUI {
    [self.viewModel loadData:^(id returnValue) {
        [self.tableView reloadData];
    }];
    CellIdentifier = @"MeCell";
    self.tableView.rowHeight = 50;
    self.tableView.tableFooterView = self.footView;
    [self.tableView registerClass:[MeCell class] forCellReuseIdentifier:CellIdentifier];
    
    self.titles = @"1";
    [self.dataList addObject:self.titles];
    self.tempArray = @[self.titles];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
       // 在主线程完成刷新UI的操作
        dispatch_async(dispatch_get_main_queue(), ^{
            
        });
    });
    [self.view addSubview:self.showView];
    [[self.showView.btnClickSubject takeUntil:self.rac_willDeallocSignal] subscribeNext:^(id x) {
        NSLog(@"RAC=RAC=RAC=RAC=RAC=RAC");
    }];
}

#pragma mark - View(页面处理)


#pragma mark - XXXDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.viewModel.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MeCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
//    cell.viewModel = self.viewModel.dataArray[indexPath.row];
    [cell bindViewModel:self.viewModel left:self.viewModel.titleArray[indexPath.row]];
    return cell;
}

#pragma mark - 对外接口


#pragma mark - private methods(内部接口)
- (void)footViewClick {
    NSLog(@"姓名:%@",self.viewModel.model.name);
    NSLog(@"性别:%@",self.viewModel.model.sex);
    NSLog(@"年龄:%li",self.viewModel.model.age);
    self.temp = self.tempArray[0];
    self.temp = @"2";
    NSLog(@"titles:%@",self.titles);
    NSLog(@"%@",self.tempArray[0]);
    self.showView.hidden = !self.showView.hidden;
    
    
}

#pragma mark -  loading


#pragma mark - 懒加载
- (MeViewModel *)viewModel {
    if (!_viewModel) {
        _viewModel = [[MeViewModel alloc] init];
    }
    return _viewModel;
}

- (UIView *)footView {
    if (!_footView) {
        _footView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 100)];
        _footView.backgroundColor = self.view.backgroundColor;
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(20, 40, kScreenWidth - 40, 30)];
        button.backgroundColor = [UIColor orangeColor];
        [button setTitle:@"确定" forState:UIControlStateNormal];
        button.layer.masksToBounds = YES;
        button.layer.cornerRadius = 15;
        [button addTarget:self action:@selector(footViewClick) forControlEvents:UIControlEventTouchUpInside];
        [_footView addSubview:button];
    }
    return _footView;
}

- (MeShowView *)showView {
    if (!_showView) {
        _showView = [[MeShowView alloc] initWithFrame:CGRectMake(0, 0, 100, 200)];
        _showView.backgroundColor = [UIColor grayColor];
        _showView.center = self.view.center;
        _showView.hidden = YES;
    }
    return _showView;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
