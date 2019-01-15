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
    UIView *view = [[UIApplication sharedApplication].windows lastObject];
//    UIView *view2 = [[[UIApplication sharedApplication] windows] lastObject];
//    UIView *view3 = [[UIApplication sharedApplication].delegate window];
//    UIView *view4 = [[UIApplication sharedApplication] keyWindow];

    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.label.text = text;
    hud.contentColor = [UIColor whiteColor];//文本颜色
    hud.mode = MBProgressHUDModeText;
    hud.backgroundView.style = MBProgressHUDBackgroundStyleSolidColor;
    hud.backgroundView.color = [UIColor colorWithWhite:0.0f alpha:0.2f];
    //背景色
    hud.bezelView.style = MBProgressHUDBackgroundStyleBlur;
    hud.bezelView.color = kBarSelectedColor;
    [hud hideAnimated:YES afterDelay:1.0f];
}

@end
