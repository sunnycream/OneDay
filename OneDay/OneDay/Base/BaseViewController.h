//
//  BaseViewController.h
//  OneDay
//
//  Created by admin on 2018/8/1.
//  Copyright © 2018年 admin. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^CommonBlock)(NSDictionary *dict);
@interface BaseViewController : UIViewController

@property (nonatomic, copy) CommonBlock block;

- (void)showTextOnly:(NSString *)text;

@end
