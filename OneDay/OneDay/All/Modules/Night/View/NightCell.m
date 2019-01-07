//
//  NightCell.m
//  OneDay
//
//  Created by admin on 2018/8/7.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "NightCell.h"

@implementation NightCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.icon = [[UIImageView alloc] init];
        [self.contentView addSubview:self.icon];
        
        self.title = [[UILabel alloc] init];
        self.title.textAlignment = NSTextAlignmentCenter;
        self.title.font = [UIFont systemFontOfSize:kDefaultTextSize];
        [self.contentView addSubview:self.title];
        
        [self setupConstraint];
    }
    return self;
}

- (void)setupConstraint {
    [self.icon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_top);
        make.left.equalTo(self.contentView.mas_left);
        make.right.equalTo(self.contentView.mas_right);
        make.height.mas_offset(self.contentView.frame.size.height * 0.8);
    }];
    
    [self.title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.icon.mas_bottom);
        make.left.equalTo(self.contentView.mas_left);
        make.right.equalTo(self.contentView.mas_right);
        make.height.mas_offset(self.contentView.frame.size.height * 0.2);
    }];
}

@end
