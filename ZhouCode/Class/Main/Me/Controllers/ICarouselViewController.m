//
//  ICarouselViewController.m
//  ZhouCode
//
//  Created by 周子龙 on 2018/10/25.
//  Copyright © 2018 zzl. All rights reserved.
//

#import "ICarouselViewController.h"
#import "iCarousel.h"
@interface ICarouselViewController () <iCarouselDelegate,iCarouselDataSource>

@property (nonatomic, strong) iCarousel *carousel;
@property (nonatomic, strong) NSMutableArray *items;


@end

@implementation ICarouselViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initUI];
}


#pragma mark - 初始化

- (void)initUI {
    self.items = [NSMutableArray array];
    for (int i = 0; i < 100; i++)
    {
        [_items addObject:@(i)];
    }
    _carousel = [[iCarousel alloc] init];
    _carousel.type = iCarouselTypeCylinder;
    _carousel.delegate = self;
    _carousel.dataSource = self;
    [self.view addSubview:_carousel];
    [_carousel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.height.mas_offset(kScreenWidth);
    }];
}

#pragma mark - View(页面处理)


#pragma mark - XXXDelegate
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

- (NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel
{
    //return the total number of items in the carousel
    return [_items count];
}

- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view
{
    UILabel *label = nil;
    
    //create new view if no view is available for recycling
    if (view == nil)
    {
        //don't do anything specific to the index within
        //this `if (view == nil) {...}` statement because the view will be
        //recycled and used with other index values later
        view = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 200.0f, 200.0f)];
        ((UIImageView *)view).image = [UIImage imageNamed:@"page.png"];
        view.contentMode = UIViewContentModeCenter;
        view.backgroundColor = [UIColor lightGrayColor];
        label = [[UILabel alloc] initWithFrame:view.bounds];
        label.backgroundColor = [UIColor clearColor];
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [label.font fontWithSize:50];
        label.tag = 1;
        [view addSubview:label];
    }
    else
    {
        //get a reference to the label in the recycled view
        label = (UILabel *)[view viewWithTag:1];
    }
    
    //set item label
    //remember to always set any properties of your carousel item
    //views outside of the `if (view == nil) {...}` check otherwise
    //you'll get weird issues with carousel item content appearing
    //in the wrong place in the carousel
    label.text = [_items[index] stringValue];
    
    return view;
}

- (CGFloat)carousel:(iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value
{
    if (option == iCarouselOptionSpacing)
    {
        return value * 1.1;
    }
    return value;
}

- (NSInteger)numberOfPlaceholdersInCarousel:(iCarousel *)carousel {
    return [_items count];

}

- (UIView *)carousel:(iCarousel *)carousel placeholderViewAtIndex:(NSInteger)index reusingView:(nullable UIView *)view {
    UIView *bgview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    bgview.backgroundColor = [UIColor orangeColor];
    return bgview;
}



#pragma mark - 对外接口


#pragma mark - private methods(内部接口)


#pragma mark -  loading


#pragma mark - 懒加载




@end
