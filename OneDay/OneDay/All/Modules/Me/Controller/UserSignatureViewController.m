//
//  UserSignatureViewController.m
//  OneDay
//
//  Created by admin on 2018/11/21.
//  Copyright © 2018 admin. All rights reserved.
//

#define kMaxLength 30

#import "UserSignatureViewController.h"

@interface UserSignatureViewController ()<UITextViewDelegate>

@property (nonatomic, strong) UITextView *textView;
@property (nonatomic, strong) UILabel *placeholder;
@property (nonatomic, strong) UILabel *textCount;

@end

@implementation UserSignatureViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"设置个性签名";

    self.textView.backgroundColor = [UIColor whiteColor];
    self.placeholder.textColor = [Util colorWithHexString:@"#D3D3D3"];
    self.textCount.textColor = [UIColor whiteColor];
    self.textCount.text = [NSString stringWithFormat:@"%lu/%d", (unsigned long)self.textView.text.length, kMaxLength];
}

- (void)textViewDidChange:(UITextView *)textView {
    if (textView.text.length == 0) {
        self.placeholder.hidden = NO;
    } else {
        self.placeholder.hidden = YES;
    }

    self.textCount.text = [NSString stringWithFormat:@"%lu/%d", (unsigned long)textView.text.length, kMaxLength];

    NSString *toBeString = textView.text;
    NSString *lang = [[UIApplication sharedApplication] textInputMode].primaryLanguage;//键盘输入模式

    if ([lang isEqualToString:@"zh-Hans"]) {//中文输入
        UITextRange *selectedRange = [textView markedTextRange]; //获取高亮部分
        UITextPosition *position = [textView positionFromPosition:selectedRange.start offset:0];
        if (!position) {//没有高亮选择的字，则对已输入的文字进行字数统计和限制
            if (toBeString.length > kMaxLength) {
                textView.text = [toBeString substringToIndex:kMaxLength];
                self.textCount.text = [NSString stringWithFormat:@"%lu/%d", (unsigned long)textView.text.length, kMaxLength];
            }
        } else {//有高亮选择的字符串，则暂不对文字进行统计和限制

        }
    } else {//中文输入法以外的直接对其统计限制即可，不考虑其他语种情况
        if (toBeString.length > kMaxLength) {
            textView.text = [toBeString substringToIndex:kMaxLength];
            self.textCount.text = [NSString stringWithFormat:@"%lu/%d", (unsigned long)textView.text.length, kMaxLength];
        }
    }
}

- (UITextView *)textView {
    if (!_textView) {
        _textView = [[UITextView alloc] init];
        _textView.delegate = self;
        _textView.font = [UIFont systemFontOfSize:kDefaultTextSize];
        _textView.tintColor = [Util colorWithHexString:@"#6495ED"];
        _textView.textContainerInset = UIEdgeInsetsMake(11, 0, 0, 0);
        [self.view addSubview:_textView];

        [_textView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(80);
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
        _placeholder.font = [UIFont systemFontOfSize:kDefaultTextSize];
        [self.textView addSubview:_placeholder];

        [_placeholder mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(30);
            make.top.equalTo(self.textView.mas_top).offset(5);
            make.left.equalTo(self.textView.mas_left).offset(5);
        }];
    }
    return _placeholder;
}

- (UILabel *)textCount {
    if (!_textCount) {
        _textCount = [[UILabel alloc] init];
//        _textCount.backgroundColor = [Util colorWithHexString:@"#6495ED"];
        _textCount.backgroundColor = kBarSelectedColor;
        _textCount.font = [UIFont systemFontOfSize:kDefaultTextSize];
        [self.textView addSubview:_textCount];

#warning constraints
        [_textCount mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(30);
//            make.bottom.equalTo(self.textView.mas_bottom).offset(-5);
//            make.right.equalTo(self.textView.mas_right).offset(-5);

            make.top.equalTo(self.textView.mas_top).offset(50);
            make.left.equalTo(self.textView.mas_left).offset(kScreenWidth - 60);
        }];
    }
    return _textCount;
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
