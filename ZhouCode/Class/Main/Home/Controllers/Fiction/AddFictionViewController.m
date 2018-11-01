//
//  AddFictionViewController.m
//  ZhouCode
//
//  Created by 周子龙 on 2018/10/29.
//  Copyright © 2018 zzl. All rights reserved.
//

#import "AddFictionViewController.h"
#import "NetRequestManager.h"
#import "FictionQueryModel.h"

@interface AddFictionViewController () <UISearchBarDelegate>

@property (nonatomic, strong) UISearchBar *searchBar;
@property (nonatomic, strong) NSArray *dataArray;

@end

@implementation AddFictionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initUI];
    CellIdentifier = @"UITableViewCell";
    self.tableView.rowHeight = 50;
    self.tableView.tableHeaderView = self.searchBar;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:CellIdentifier];
}


#pragma mark - 初始化

- (void)initUI {
    self.title = @"搜索";
    
}

#pragma mark - View(页面处理)


#pragma mark - XXXDelegate
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    NSString *searchText = searchBar.text;
    [self.view endEditing:YES];
    [self reload:searchText];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    FictionQueryModel *model = self.dataArray[indexPath.row];
    cell.textLabel.text = model.text?:@"";
    cell.detailTextLabel.text = model.author?:@"";
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    FictionQueryModel *model = self.dataArray[indexPath.row];
    BOOL result = [FictionQueryModel insertData:model];
    NSLog(@"插入数据%@",result?@"成功":@"失败");
    if (self.backBlock) {
        self.backBlock(nil);
    }
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - 对外接口


#pragma mark - private methods(内部接口)


#pragma mark -  loading
- (void)reload:(NSString *)searchText {
    [FictionQueryModel globalTimelineWithQuery:searchText withBlock:^(NSArray * _Nonnull queryData, NSError * _Nonnull error) {
        if (!error) {
            self.dataArray = queryData;
            [self.tableView reloadData];
        }
    }];
}

#pragma mark - 懒加载
- (UISearchBar *)searchBar {
    if (!_searchBar) {
        _searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 60)];
        _searchBar.barStyle = UIBarStyleDefault;
        _searchBar.delegate = self;
    }
    return _searchBar;
}



@end
