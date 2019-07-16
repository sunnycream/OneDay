//
//  DayCell.h
//  OneDay
//
//  Created by admin on 2019/7/16.
//  Copyright © 2019 admin. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DayCell : UITableViewCell

/** 头像 */
@property (nonatomic, strong) UIImageView *avatar;
/** 昵称 */
@property (nonatomic, strong) UILabel *nickname;
/** 列表文字 */
@property (nonatomic, strong) UILabel *content;

@end

NS_ASSUME_NONNULL_END
