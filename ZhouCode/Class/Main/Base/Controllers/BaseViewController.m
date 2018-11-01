//
//  BaseViewController.m
//  EETOP_IN
//
//  Created by yingjian on 17-04-01.
//  Copyright (c) 2017年 TC. All rights reserved.
//

#import "BaseViewController.h"
#import "UINavigationController+FDFullscreenPopGesture.h"
#import "BaseNotInternetView.h"
#import "BaseViewController.h"
#import "BaseNotInternetView.h"
#import "YYText.h"

@interface BaseViewController () <BaseNotInternetViewDelegate>

@end

@implementation BaseViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //设置主背景色
    self.view.backgroundColor = kBackgroundColor;
    self.fd_prefersNavigationBarHidden = NO;
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:self action:nil];

    //去掉导航栏边线
    self.navigationController.navigationBar.shadowImage = [UIImage imageWithColor:kAuxiliaryGrayColor];
    
    //设置导航栏字体
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName: kMainTextColor,NSFontAttributeName: KNavigationTitleFont}];
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:kWhiteBackgroundColor] forBarMetrics:UIBarMetricsDefault];

    [self setupNormalNavigationBar];

    // 添加点击空白处隐藏手势
//    [self setupTapHiddenKeyboardGesture];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
//    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:animated];

    ((BaseNavigationViewController *)self.navigationController).canDragBack = YES;
}

- (void)dealloc
{
    DLog(@"dealloc:%@",NSStringFromClass([self class]));
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
    NSLog(@"%@--%@-didReceiveMemoryWarning", self.title,self.navigationItem.title);
    [[SDImageCache sharedImageCache] setValue:nil forKey:@"memCache"];
    //清除所有的内存中图片缓存，不影响正在显示的图片
    [[SDImageCache sharedImageCache] clearMemory];
    //停止正在进行的图片下载操作
    [[SDWebImageManager sharedManager] cancelAll];
}

- (void)refreshData
{
    
}

- (void)setupNormalNavigationBar
{
    if (self.navigationController.viewControllers.count <= 1) {
        self.navigationItem.leftBarButtonItem = nil;
    }else{
        [self setupNormalLeftBackButtonItem];
    }
}

- (void)setupNormalLeftBackButtonItem
{
    UIBarButtonItem *leftBarButtonItem = [self customBackBarButtonItem:@"navigationbar_back" HighlightedImageName:@"navigationbar_back"];
    [self.navigationItem setLeftBarButtonItems:[NSArray arrayWithObjects:[self fixedSpaceButtonItem], leftBarButtonItem, nil]];
}

- (void)setupNOLeftBackButtonItem
{
    [self setupCustomLeftButtonItem:[UIButton new]];
}

- (void)setupNORightButtonItem
{
    [self setupCustomRightButtonItem:[UIButton new]];
}

- (void)setupCustomLeftButtonItem:(UIButton *)button
{
    UIBarButtonItem *buttonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    [self.navigationItem setLeftBarButtonItems:[NSArray arrayWithObjects:[self fixedSpaceButtonItem], buttonItem, nil]];
}

- (void)setupCustomRightButtonItem:(UIButton *)button
{
    UIBarButtonItem *buttonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    [self.navigationItem setRightBarButtonItems:[NSArray arrayWithObjects:[self fixedSpaceButtonItem], buttonItem, nil]];
}

- (UIBarButtonItem *)fixedSpaceButtonItem
{
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]
                                       initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                       target:nil action:nil];
    negativeSpacer.width = -5;

    return negativeSpacer;
}

- (UIBarButtonItem *)customBackBarButtonItem:(NSString *)imageName HighlightedImageName:(NSString *)highlightedImageName
{
    UIImage *image = [UIImage imageNamed:imageName];
    UIImage *highlightedImage = [UIImage imageNamed:highlightedImageName];
    
    NSString *backTitle = @"返回";
    if ([self.navigationController.viewControllers count] == 2) {
        backTitle = [self.navigationController.viewControllers firstObject].navigationItem.title;
    }
    
    UIFont *font = KNavigationButtonFont;
    
    CGSize titleSize = CGSizeMake(CGFLOAT_MAX, 20);
    YYTextLayout *layout = [YYTextLayout layoutWithContainerSize:titleSize text:[[NSAttributedString alloc] initWithString:backTitle]];
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.frame = CGRectMake(0, 0, image.size.width + layout.textBoundingSize.width + 10, image.size.height);
    [backBtn setImage:image forState:UIControlStateNormal];
    [backBtn setImage:highlightedImage forState:UIControlStateHighlighted];
    [backBtn setTitle:backTitle forState:UIControlStateNormal];
    [backBtn setTitle:backTitle forState:UIControlStateHighlighted];
    [backBtn setTitleColor:kMainTextColor forState:UIControlStateNormal];
    [backBtn setTitleColor:kMainTextColor forState:UIControlStateHighlighted];
    [backBtn.titleLabel setFont:font];
    backBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 5, 0, 0);
    backBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 5);
    [backBtn addTarget:self action:@selector(backBarButtonItemClick:) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *backBarItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];

    return backBarItem;
}

- (void)backBarButtonItemClick:(UIBarButtonItem *)barItem
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)setupTextNavigationBarButton:(NSString *)buttonTitle eventAction:(SEL)action
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 50, 25);
    button.layer.cornerRadius = 2.5;
    button.layer.masksToBounds = YES;
    button.layer.borderWidth = 0.5;
    button.layer.borderColor = kAuxiliaryGrayColor.CGColor;
    [button.titleLabel setFont:kLittleButtonTextFont];
    [button setTitleColor:kAuxiliaryTextColor forState:UIControlStateNormal];
    [button setTitleColor:kMainTextColor forState:UIControlStateHighlighted];
    
    [button setTitle:buttonTitle forState:UIControlStateNormal];
    [button addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];

    [self setupCustomRightButtonItem:button];
}

- (UIButton *)navigationBarButton:(NSString *)buttonImage eventAction:(SEL)action
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *imageNormal = [UIImage imageNamed:buttonImage];
    [button setImage:imageNormal forState:UIControlStateNormal];

    [button addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    button.frame = CGRectMake(0, 0, imageNormal.size.width + 20, 40);
    
    return button;
}

- (void)addKeyboard {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidHide:) name:UIKeyboardDidHideNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
}

- (void)keyboardDidHide:(NSNotification *)aNotification {
    
}

- (void)keyboardWillShow:(NSNotification *)aNotification {
    
}

- (UIButton *)returnNextButton:(CGRect)frame title:(NSString *)title view:(UIView *)view {
    UIButton *button = [[UIButton alloc] initWithFrame:frame];
    button.backgroundColor = kViewWhiteColor;
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button.titleLabel.font = KMainTextFont;
    button.layer.masksToBounds = YES;
    button.layer.cornerRadius = 5.0;
    [button addTarget:self action:@selector(nextButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:button];
    return button;
}

- (void)nextButtonAction:(UIButton *)button {
    
}

- (void)setupTapHiddenKeyboardGesture
{
    UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] init];
    gesture.numberOfTapsRequired = 1;
    [self.view addGestureRecognizer:gesture];
    @weakify(self);
    [gesture.rac_gestureSignal subscribeNext:^(id x) {
        @strongify(self);
        [self.view endEditing:YES];
    }];
}

#pragma mark - 没有数据的时候显示
 // 没有数据的时候显示
- (void)showNotInternetView {
    NSInteger tag = 0;
    for (UIView *view in self.view.subviews) {
        if ([view isKindOfClass:[BaseNotInternetView class]]) {
            tag++;
        }
    }
    if (tag > 0) {
        return;
    }
    CGFloat YY = 64;
    if ([self isKindOfClass:[BaseNotInternetView class]]) {
        YY = 0;
    }
    BaseNotInternetView *view = [[BaseNotInternetView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight - YY)];
    view.delegate = self;
    [self.view insertSubview:view belowSubview:[UIApplication sharedApplication].keyWindow];
}

- (void)hiddenNotInternetView {
    for (UIView *view in self.view.subviews) {
        if ([view isKindOfClass:[BaseNotInternetView class]]) {
            [view removeFromSuperview];
        }
    }
}

- (void)reloadNetworkRequest:(id)sender {
    [self hiddenNotInternetView];
    self.isNoData = YES;
    [self refreshData];
}


@end
