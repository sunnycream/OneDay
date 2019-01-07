//
//  AlbumCell.m
//  OneDay
//
//  Created by admin on 2018/8/7.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "AlbumCell.h"

@implementation AlbumCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.albumImage = [[UIImageView alloc] init];
        [self.contentView addSubview:self.albumImage];
        
        self.albumName = [[UILabel alloc] init];
        self.albumName.textAlignment = NSTextAlignmentCenter;
        self.albumName.font = [UIFont systemFontOfSize:kDefaultTextSize];
        [self.contentView addSubview:self.albumName];
        
        [self setupConstraint];
    }
    return self;
}

- (void)setupConstraint {
    [self.albumImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_top);
        make.left.equalTo(self.contentView.mas_left);
        make.right.equalTo(self.contentView.mas_right);
        make.height.mas_offset(self.contentView.frame.size.height * 0.8);
    }];
    
    [self.albumName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.albumImage.mas_bottom);
        make.left.equalTo(self.contentView.mas_left);
        make.right.equalTo(self.contentView.mas_right);
        make.height.mas_offset(self.contentView.frame.size.height * 0.2);
    }];
}

@end
