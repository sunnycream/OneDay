//
//  BasePopupViewController.m
//  OneDay
//
//  Created by admin on 2019/6/11.
//  Copyright © 2019 admin. All rights reserved.
//

#import "BasePopupViewController.h"

@interface BasePopupViewController ()

@end

@implementation BasePopupViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIView *backgroundView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    backgroundView.backgroundColor = [UIColor clearColor];
    [self.view insertSubview:backgroundView atIndex:0];

    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction)];
//    backgroundView.userInteractionEnabled = YES;
    [backgroundView addGestureRecognizer:tap];
}

- (void)tapAction {
    if (self.block) {
        self.block(nil);
    }
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
