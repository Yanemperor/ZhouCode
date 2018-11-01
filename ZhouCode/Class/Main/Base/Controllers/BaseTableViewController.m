//
//  BaseTableViewController.m
//  EETOP_IN
//
//  Created by yingjian on 2017/4/1.
//  Copyright © 2017年 TCGroup. All rights reserved.
//

#import "BaseTableViewController.h"

@interface BaseTableViewController ()

@property (assign, nonatomic) BOOL isMore; ///< 是否还有更多数据

@end

@implementation BaseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.existCount = 0;
    self.refreshStatus = refreshType_Normal;
    self.showFooterView = YES;

    //设置默认加载条数
//    self.perPageCount = 20;
    //开始加载数据页码
    self.startPage = 1;
    
    [self.view addSubview:self.tableView];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).insets(UIEdgeInsetsZero);
    }];
    
    //判断当前数量
    @weakify(self);
    [RACObserve(self, receiveCount) subscribeNext:^(NSNumber *value) {
        @strongify(self);
        if([value integerValue] < self.perPageCount){
            //没有更多
            [self removeRefreshFooter];
        }
        else if ([value integerValue] == self.perPageCount && [value integerValue]>0){
            if (self.showFooterView) {
                [self configureRefreshFooter:self.tableView];
            }
        }
    }];
}

- (void)configureRefreshHeader:(UIScrollView *)tableView
{
    tableView.mj_header = self.header;
}

- (void)configureRefreshFooter:(UIScrollView *)tableView
{
    self.startPage ++;
    self.isMore = YES;
    
    tableView.mj_footer = self.footer;
    _footer.hidden = NO;
}

- (void)removeRefreshFooter
{
    self.isMore = NO;
    _footer.hidden = YES;
}

- (NSInteger)perPageCount
{
    return 20;
}

//刷新数据
- (void)refreshData
{
    [super refreshData];
    switch (_refreshStatus) {
        case refreshType_Normal:
            self.startPage = 1;
            break;
        case refreshType_PullDown:
            self.startPage = 1;
            self.existCount = 0;
            break;
        case refreshType_PullUp:
            break;
        default:
            break;
    }
    if (self.isNoData) {
        [self beginDataRefresh];
    }
}

- (void)beginDataRefresh
{
    if (!_header.isRefreshing) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [_header beginRefreshing];
        });
    }
}

- (void)endDataRefresh
{
    dispatch_async(dispatch_get_main_queue(), ^{
        self.refreshStatus = refreshType_Normal;
        [_footer endRefreshing];
        [_header endRefreshing];
        
        if (!self.isMore) {
            [_footer endRefreshingWithNoMoreData];
        }
    });
}

- (MJRefreshNormalHeader *)header
{
    if(!_header)
    {
        @weakify(self);
        _header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            @strongify(self);
            // 进入刷新状态后会自动调用这个block
            self.refreshStatus = refreshType_PullDown;
            if (!self.isNoData) {
                [self refreshData];
            }else{
                self.isNoData = NO;
            }
        }];
        // 设置自动切换透明度(在导航栏下面自动隐藏)
        _header.automaticallyChangeAlpha = YES;
        // 隐藏时间
        _header.lastUpdatedTimeLabel.hidden = YES;
    }
    
    return _header;
}

- (MJRefreshAutoNormalFooter *)footer
{
    if(!_footer && self.showFooterView){
        @weakify(self);
        _footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
            @strongify(self);
            // 进入刷新状态后会自动调用这个block
            self.refreshStatus = refreshType_PullUp;
            [self refreshData];
        }];
    }
    
    return _footer;
}

#pragma mark - UITableView
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return CGFLOAT_MIN;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return CGFLOAT_MIN;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = tableView.backgroundColor;
    
    return view;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = tableView.backgroundColor;
    
    return view;
}

- (void)dealloc
{
    NSLog(@"table正常释放dealloc:%@",NSStringFromClass([self class]));
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (UITableViewStyle)setupTableStyle
{
    return UITableViewStyleGrouped;
}

- (void)setupTapHiddenKeyboardGesture
{
    UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] init];
    gesture.numberOfTapsRequired = 1;
    gesture.cancelsTouchesInView = NO;
    [self.tableView addGestureRecognizer:gesture];
    @weakify(self);
    [gesture.rac_gestureSignal subscribeNext:^(id x) {
        @strongify(self);
        [self.view endEditing:YES];
    }];
}


#pragma mark - lazy

- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:[self setupTableStyle]];
        _tableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, CGFLOAT_MIN)];
        _tableView.backgroundColor = self.view.backgroundColor;
        _tableView.backgroundView = nil;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorColor = [UIColor lightGrayColor];
    }
    
    return _tableView;
}

- (NSMutableArray *)dataList
{
    if (!_dataList) {
        _dataList = [NSMutableArray array];
    }
    
    return _dataList;
}

@end
