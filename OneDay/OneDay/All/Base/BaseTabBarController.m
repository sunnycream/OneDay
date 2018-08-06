//
//  BaseTabBarController.m
//  OneDay
//
//  Created by admin on 2018/8/1.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "BaseTabBarController.h"
#import "OneDayViewController.h"
#import "CalendarViewController.h"
#import "MeViewController.h"

@interface BaseTabBarController ()

@end

@implementation BaseTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addChildControllers];
}

- (void)addChildControllers {
    OneDayViewController *c1 = [[OneDayViewController alloc] init];
    CalendarViewController *c2 = [[CalendarViewController alloc] init];
    MeViewController *c3 = [[MeViewController alloc] init];

    [self setChildControllers:c1 title:@"一天" normalImage:[UIImage imageNamed:@"tab_bar_oneday_normal"] selectedImage:[UIImage imageNamed:@"tab_bar_oneday_selected"]];
    [self setChildControllers:c2 title:@"日历" normalImage:[UIImage imageNamed:@"tab_bar_calendar_normal"] selectedImage:[UIImage imageNamed:@"tab_bar_canlendar_selected"]];
    [self setChildControllers:c3 title:@"我" normalImage:[UIImage imageNamed:@"tab_bar_me_normal"] selectedImage:[UIImage imageNamed:@"tab_bar_me_selected"]];
}

- (void)setChildControllers:(UIViewController *)viewController title:(NSString *)title normalImage:(UIImage *)normalImage selectedImage:(UIImage *)selectedImage {
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:viewController];
    nav.tabBarItem.title = title;
    nav.tabBarItem.image = normalImage;
    nav.tabBarItem.selectedImage = selectedImage;

    viewController.navigationItem.title = title;

    [self addChildViewController:nav];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


@end
