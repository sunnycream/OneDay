//
//  BaseNavigationController.m
//  OneDay
//
//  Created by admin on 2019/1/7.
//  Copyright © 2019 admin. All rights reserved.
//

#import "BaseNavigationController.h"

@interface BaseNavigationController ()

@end

@implementation BaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

}

+ (void)initialize {
    //导航栏背景色
    [[UINavigationBar appearance] setBarTintColor:kBarSelectedColor];

    //导航栏标题颜色及大小
    [[UINavigationBar appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:kBarNormalColor, NSForegroundColorAttributeName, [UIFont boldSystemFontOfSize:kNavgationBarTextSize], NSFontAttributeName,nil]];

    //返回按钮
    [[UINavigationBar appearance] setTintColor:kBarNormalColor];
    [[UINavigationBar appearance] setBackIndicatorImage:[UIImage imageNamed:@"nav_back"]];
    [[UINavigationBar appearance] setBackIndicatorTransitionMaskImage:[UIImage imageNamed:@"nav_back"]];
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.childViewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
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
