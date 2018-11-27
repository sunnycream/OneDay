//
//  UserNicknameViewController.m
//  OneDay
//
//  Created by admin on 2018/11/21.
//  Copyright © 2018 admin. All rights reserved.
//

#import "UserNicknameViewController.h"

@interface UserNicknameViewController ()

@property (nonatomic, strong) UITextField *textField;

@end

@implementation UserNicknameViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"设置昵称";

    self.textField.backgroundColor = [UIColor yellowColor];
}

- (UITextField *)textField {
    if (!_textField) {
        _textField = [[UITextField alloc] init];
        _textField.placeholder = @"输入昵称";
        _textField.font = [UIFont systemFontOfSize:DefaultTextSize];
        _textField.textColor = [UIColor blackColor];
        [self.view addSubview:_textField];

        [_textField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(40);
            make.top.equalTo(self.view.mas_top).offset(100);
            make.left.equalTo(self.view.mas_left).offset(10);
            make.right.equalTo(self.view.mas_right).offset(-10);
        }];
    }

    return _textField;
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
