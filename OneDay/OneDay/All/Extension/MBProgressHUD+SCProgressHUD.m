//
//  MBProgressHUD+SCProgressHUD.m
//  OneDay
//
//  Created by admin on 2019/1/8.
//  Copyright © 2019 admin. All rights reserved.
//

#import "MBProgressHUD+SCProgressHUD.h"

@implementation MBProgressHUD (SCProgressHUD)

+ (void)showTextOnly:(NSString *)text  {
    [self showTextOnly:text toView:nil];
}

+ (void)showTextOnly:(NSString *)text toView:(UIView *)view {
    if (view == nil) {
        view = [[UIApplication sharedApplication].windows lastObject];
    }

    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.label.text = text;
    hud.mode = MBProgressHUDModeText;
    hud.backgroundView.style = MBProgressHUDBackgroundStyleSolidColor;
    hud.backgroundView.color = [UIColor colorWithWhite:0.0f alpha:0.2f];
    [hud hideAnimated:YES afterDelay:3.0f];
}

@end
