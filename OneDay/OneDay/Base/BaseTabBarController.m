//
//  BaseTabBarController.m
//  OneDay
//
//  Created by admin on 2018/8/1.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "BaseTabBarController.h"
#import "BaseNavigationController.h"
#import "DayViewController.h"
#import "NightViewController.h"
#import "MeViewController.h"

@interface BaseTabBarController ()

@end

@implementation BaseTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addChildControllers];
    
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:kBarNormalColor, NSFontAttributeName:[UIFont fontWithName:@"Marker Felt" size:kTabBarTextSize]} forState:UIControlStateNormal];
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:kBarSelectedColor, NSFontAttributeName:[UIFont fontWithName:@"Marker Felt" size:kTabBarTextSize]} forState:UIControlStateSelected];
}

- (void)addChildControllers {
    [self setChildControllers:[[DayViewController alloc] init] title:@"Day"
                  normalImage:[[UIImage imageNamed:@"tab_bar_day_normal"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]
                selectedImage:[[UIImage imageNamed:@"tab_bar_day_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];

    [self setChildControllers:[[NightViewController alloc] init] title:@"Night"
                  normalImage:[[UIImage imageNamed:@"tab_bar_night_normal"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]
                selectedImage:[[UIImage imageNamed:@"tab_bar_night_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];

    [self setChildControllers:[[MeViewController alloc] init] title:@"Me"
                  normalImage:[[UIImage imageNamed:@"tab_bar_me_normal"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]
                selectedImage:[[UIImage imageNamed:@"tab_bar_me_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
}

- (void)setChildControllers:(UIViewController *)viewController title:(NSString *)title normalImage:(UIImage *)normalImage selectedImage:(UIImage *)selectedImage {
    BaseNavigationController *nav = [[BaseNavigationController alloc] initWithRootViewController:viewController];

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
