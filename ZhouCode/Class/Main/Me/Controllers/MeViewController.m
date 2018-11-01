//
//  MeViewController.m
//  ZhouCode
//
//  Created by zhouzilong on 2017/7/5.
//  Copyright © 2017年 zzl. All rights reserved.
//

#import "MeViewController.h"
#import "MeOneViewController.h"
#import "Me2ViewController.h"
#import "Me3ViewController.h"
#import "Me4ViewController.h"
#import "ICarouselViewController.h"

@interface MeViewController ()

@property (nonatomic, assign) BOOL istest;
@property (nonatomic, strong) NSArray *titleArray;

@end

@implementation MeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"我";
    
    [self initUI];
}


#pragma mark - 初始化

- (void)initUI {
    
    self.titleArray = @[@"无数据加载默认图",@"双向绑定",@"双向绑定测试",@"渐变文字",@"iCarousel"];
    
    CellIdentifier = @"cell";
//    self.tableView.estimatedRowHeight = 200;
//    self.tableView.rowHeight = UITableViewAutomaticDimension;
//    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.rowHeight = 50;
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:CellIdentifier];
    
}

#pragma mark - View(页面处理)


#pragma mark - XXXDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.titleArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    cell.textLabel.text = self.titleArray[indexPath.section] ? : @"";
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section == 0) {
//        MeOneViewController *oneVC = [[MeOneViewController alloc] init];
//        [self.navigationController pushViewController:oneVC animated:YES];
        [self testRAC];
    }else if (indexPath.section == 1) {
        Me2ViewController *twoVC = [[Me2ViewController alloc] init];
        twoVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:twoVC animated:YES];
    }else if (indexPath.section == 2) {
        Me3ViewController *twoVC = [[Me3ViewController alloc] init];
        twoVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:twoVC animated:YES];
    }else if (indexPath.section == 3) {
        Me4ViewController *twoVC = [[Me4ViewController alloc] init];
        twoVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:twoVC animated:YES];
    }else if (indexPath.section == 4) {
        ICarouselViewController *vc = [[ICarouselViewController alloc] init];
        vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
    }
}

- (void)testRAC {
    
}

+ (UIImage *)imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 10;
}

#pragma mark - 对外接口


#pragma mark - private methods(内部接口)


#pragma mark -  loading


#pragma mark - 懒加载




@end
