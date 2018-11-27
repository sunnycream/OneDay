//
//  UserQRCodeViewController.m
//  OneDay
//
//  Created by admin on 2018/11/21.
//  Copyright © 2018 admin. All rights reserved.
//

#import "UserQRCodeViewController.h"

@interface UserQRCodeViewController ()

@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation UserQRCodeViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"我的二维码";

    self.imageView.backgroundColor = [UIColor yellowColor];

    UIBarButtonItem *rightBarItem = [UIBarButtonItem itemWithImage:[UIImage imageNamed:@"login_wechat"] target:self action:@selector(rightButtonAction)];
    self.navigationItem.rightBarButtonItem = rightBarItem;
}

- (void)rightButtonAction {

}

- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc] init];
        [self.view addSubview:_imageView];

        [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(200, 200));
            make.center.equalTo(self.view);
        }];
    }
    return _imageView;
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
