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
    
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor grayColor], NSFontAttributeName:[UIFont fontWithName:@"Marion-Italic" size:12.0]} forState:UIControlStateNormal];
    
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor blackColor], NSFontAttributeName:[UIFont fontWithName:@"Marion-Italic" size:12.0]} forState:UIControlStateSelected];
}

- (void)addChildControllers {
    [self setChildControllers:[[OneDayViewController alloc] init] title:@"一天" normalImage:[[UIImage imageNamed:@"tab_bar_oneday_normal"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"tab_bar_oneday_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [self setChildControllers:[[CalendarViewController alloc] init] title:@"日历" normalImage:[[UIImage imageNamed:@"tab_bar_calendar_normal"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"tab_bar_canlendar_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [self setChildControllers:[[MeViewController alloc] init] title:@"我" normalImage:[[UIImage imageNamed:@"tab_bar_me_normal"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"tab_bar_me_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
}

- (void)setChildControllers:(UIViewController *)viewController title:(NSString *)title normalImage:(UIImage *)normalImage selectedImage:(UIImage *)selectedImage {
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:viewController];
    nav.tabBarItem.title = title;
    nav.tabBarItem.image = normalImage;
    nav.tabBarItem.selectedImage = selectedImage;

    viewController.title = title;

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
