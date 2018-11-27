//
//  UserSignatureViewController.m
//  OneDay
//
//  Created by admin on 2018/11/21.
//  Copyright © 2018 admin. All rights reserved.
//

#import "UserSignatureViewController.h"

@interface UserSignatureViewController ()

@property (nonatomic, strong) UITextView *textView;
@property (nonatomic, strong) UILabel *placeholder;
@end

@implementation UserSignatureViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"设置个性签名";

    self.textView.backgroundColor = [UIColor yellowColor];
    self.placeholder.backgroundColor = [UIColor greenColor];
}

- (UITextView *)textView {
    if (!_textView) {
        _textView = [[UITextView alloc] init];
        _textView.font = [UIFont systemFontOfSize:DefaultTextSize];
        [self.view addSubview:_textView];

        [_textView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(40);
            make.top.equalTo(self.view.mas_top).offset(100);
            make.left.equalTo(self.view.mas_left).offset(10);
            make.right.equalTo(self.view.mas_right).offset(-10);
        }];
    }
    return _textView;
}

- (UILabel *)placeholder {
    if (!_placeholder) {
        _placeholder = [[UILabel alloc] init];
        _placeholder.text = @"输入个性签名";
        _placeholder.textColor = [UIColor lightTextColor];
        _placeholder.font = [UIFont systemFontOfSize:DefaultTextSize];
        [self.textView addSubview:_placeholder];

        [_placeholder mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(30);
            make.top.equalTo(self.textView.mas_top).offset(5);
            make.left.equalTo(self.textView.mas_left).offset(5);
        }];
    }
    return _placeholder;
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
