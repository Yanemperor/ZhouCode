//
//  ReadViewController.m
//  ZhouCode
//
//  Created by 周子龙 on 2018/10/30.
//  Copyright © 2018 zzl. All rights reserved.
//

#import "ReadViewController.h"
#import "CatalogueViewController.h"
#import "MMDrawerController.h"
#import "FictionReadModel.h"
#import "YYText.h"

@interface ReadViewController ()

@property (nonatomic, strong) YYLabel *readTextLabel;

@end

@implementation ReadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initUI];
}


#pragma mark - 初始化

- (void)initUI {
    [self.view addSubview:self.readTextLabel];
    [self.readTextLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_offset(20);
    }];
    
    [FictionReadModel getFictionContent:self.model withBlock:^(FictionReadModel * _Nonnull fictionReadModel, NSError * _Nonnull error) {
        
    }];
    CatalogueViewController *catalogueVC = [[CatalogueViewController alloc] init];
    MMDrawerController *drawerController = [[MMDrawerController alloc] initWithCenterViewController:self leftDrawerViewController:catalogueVC];
}

#pragma mark - View(页面处理)


#pragma mark - XXXDelegate



#pragma mark - 对外接口


#pragma mark - private methods(内部接口)


#pragma mark -  loading


#pragma mark - 懒加载

- (YYLabel *)readTextLabel {
    if (!_readTextLabel) {
        _readTextLabel = [[YYLabel alloc] init];
        _readTextLabel.font = [UIFont systemFontOfSize:13];
        _readTextLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _readTextLabel;
}


@end
