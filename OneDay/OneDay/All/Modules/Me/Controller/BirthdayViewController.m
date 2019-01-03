//
//  BirthdayViewController.m
//  OneDay
//
//  Created by admin on 2019/1/3.
//  Copyright © 2019 admin. All rights reserved.
//

#import "BirthdayViewController.h"

@interface BirthdayViewController ()

@property (nonatomic, strong) UIDatePicker *datePicker;

@end

@implementation BirthdayViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self datePicker];
}

- (void)choiceDate:(UIDatePicker *)picker {
    NSLog(@"-------- %@", [picker date]);

}

- (UIDatePicker *)datePicker {
    if (!_datePicker) {
        _datePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(40, 200, kScreenWidth - 80, 200)];
        _datePicker.locale = [NSLocale localeWithLocaleIdentifier:@"zh"];
        _datePicker.datePickerMode = UIDatePickerModeDate;
//        _datePicker.date = [NSDate date];
//        _datePicker.maximumDate = [NSDate date];
        [_datePicker addTarget:self action:@selector(choiceDate:) forControlEvents:UIControlEventValueChanged];
        [self.view addSubview:_datePicker];
    }
    return _datePicker;
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
