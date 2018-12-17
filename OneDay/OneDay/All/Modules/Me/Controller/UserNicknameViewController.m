//
//  UserNicknameViewController.m
//  OneDay
//
//  Created by admin on 2018/11/21.
//  Copyright © 2018 admin. All rights reserved.
//

#import "UserNicknameViewController.h"

@interface UserNicknameViewController ()<UITextFieldDelegate>

@property (nonatomic, strong) UITextField *textField;

@end

@implementation UserNicknameViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"设置昵称";

    self.textField.backgroundColor = [UIColor whiteColor];
}

- (void)changeNickname:(UITextField *)textField {
    NSInteger kMaxLength = 10;
    NSString *toBeString = textField.text;
    NSString *lang = [[UIApplication sharedApplication] textInputMode].primaryLanguage;//键盘输入模式

    if ([lang isEqualToString:@"zh-Hans"]) {//中文输入
        UITextRange *selectedRange = [textField markedTextRange]; //获取高亮部分
        UITextPosition *position = [textField positionFromPosition:selectedRange.start offset:0];
        if (!position) {//没有高亮选择的字，则对已输入的文字进行字数统计和限制
            if (toBeString.length > kMaxLength) {
                textField.text = [toBeString substringToIndex:kMaxLength];
            }
        } else {//有高亮选择的字符串，则暂不对文字进行统计和限制

        }
    } else {//中文输入法以外的直接对其统计限制即可，不考虑其他语种情况
        if (toBeString.length > kMaxLength) {
            textField.text = [toBeString substringToIndex:kMaxLength];
        }
    }
}

- (UITextField *)textField {
    if (!_textField) {
        _textField = [[UITextField alloc] init];
        _textField.delegate = self;
        _textField.placeholder = @"输入昵称";
        _textField.font = [UIFont systemFontOfSize:DefaultTextSize];
        _textField.tintColor = [UIColor blackColor];//光标颜色

        //左边距
        _textField.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 0)];
        _textField.leftViewMode = UITextFieldViewModeAlways;

        [_textField addTarget:self action:@selector(changeNickname:) forControlEvents:UIControlEventEditingChanged];
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
