//
//  BirthdayViewController.m
//  OneDay
//
//  Created by admin on 2019/1/3.
//  Copyright © 2019 admin. All rights reserved.
//

#import "BirthdayViewController.h"

@interface BirthdayViewController ()

@property (nonatomic, strong) UILabel *birthdayLabel;
@property (nonatomic, strong) UIDatePicker *datePicker;
@property (nonatomic, strong) UIButton *sureButton;
@property (nonatomic) NSString *birthadyString;

@end

@implementation BirthdayViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"生辰";

    [self birthdayLabel];
    [self datePicker];
    [self sureButton];
}

- (void)choiceDate:(UIDatePicker *)picker {
//    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
//    formatter.dateFormat = @"yyyy-MM-dd";
//
//    NSString *dateString = [formatter stringFromDate:picker.date];
//    NSDate *birthdayDate = [formatter dateFromString:dateString];

    NSDate *currentDate = [NSDate date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSUInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    NSDateComponents *dateComponents = [calendar components:unitFlags fromDate:picker.date toDate:currentDate options:0];
    if ([dateComponents year] > 0) {
        self.birthadyString = [NSString stringWithFormat:@"%ld岁 %ld月% ld天", [dateComponents year], [dateComponents month], [dateComponents day]];
    } else if ([dateComponents month] > 0) {
        self.birthadyString = [NSString stringWithFormat:@"%ld月 %ld日", [dateComponents month], [dateComponents day]];
    } else if ([dateComponents day] > 0) {
        self.birthadyString = [NSString stringWithFormat:@"%ld日", [dateComponents day]];
    } else {
        NSLog(@"0");
    }
}

- (void)sureAction {
    self.birthdayLabel.text = [NSString stringWithFormat:@"%@", self.birthadyString];
}

- (UILabel *)birthdayLabel {
    if (!_birthdayLabel) {
        _birthdayLabel = [[UILabel alloc] init];
        _birthdayLabel.numberOfLines = 0;
        _birthdayLabel.font = [UIFont boldSystemFontOfSize:kBoldTextSize];
        _birthdayLabel.textColor = kBarSelectedColor;
        _birthdayLabel.textAlignment = NSTextAlignmentCenter;
        [self.view addSubview:_birthdayLabel];

        [_birthdayLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.view).offset(200);
            make.left.equalTo(self.view).offset(40);
            make.right.equalTo(self.view).offset(-40);
        }];
    }
    return _birthdayLabel;
}

- (UIDatePicker *)datePicker {
    if (!_datePicker) {
         _datePicker = [[UIDatePicker alloc] init];
        _datePicker.locale = [NSLocale localeWithLocaleIdentifier:@"zh"];
        _datePicker.datePickerMode = UIDatePickerModeDate;
//        _datePicker.date = [NSDate date];//获得系统当前时间
        _datePicker.maximumDate = [NSDate date];

        [_datePicker addTarget:self action:@selector(choiceDate:) forControlEvents:UIControlEventValueChanged];
        [self.view addSubview:_datePicker];

        [_datePicker mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(200);
            make.top.equalTo(self.birthdayLabel.mas_bottom).offset(100);
            make.left.equalTo(self.view).offset(40);
            make.right.equalTo(self.view).offset(-40);
        }];
    }
    return _datePicker;
}

- (UIButton *)sureButton {
    if (!_sureButton) {
        _sureButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_sureButton setBackgroundColor:kBarSelectedColor];
        [_sureButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_sureButton setTitle:@"确定" forState:UIControlStateNormal];
        [_sureButton addTarget:self action:@selector(sureAction) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_sureButton];

        _sureButton.layer.cornerRadius = 20;
        _sureButton.clipsToBounds = YES;

        [_sureButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(100, 40));
            make.top.equalTo(self.datePicker.mas_bottom).offset(100);
            make.centerX.equalTo(self.view);
        }];
    }
    return _sureButton;
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
