//
//  DayCell.m
//  OneDay
//
//  Created by admin on 2019/7/16.
//  Copyright © 2019 admin. All rights reserved.
//

#import "DayCell.h"

@implementation DayCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.avatar];
        [self.contentView addSubview:self.nickname];
        [self.contentView addSubview:self.content];

        [self setupLayout];
    }
    return self;
}

- (void)setupLayout {
    [self.avatar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(10);
        make.left.equalTo(self.contentView).offset(10);
        make.size.mas_offset(CGSizeMake(40, 40));
    }];

    [self.nickname mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.avatar.mas_top);
        make.left.equalTo(self.avatar.mas_right).offset(10);
        make.right.equalTo(self.contentView).offset(-10);
    }];

    [self.content mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.nickname.mas_bottom).offset(5);
        make.left.equalTo(self.avatar.mas_right).offset(10);
        make.right.equalTo(self.contentView).offset(-10);
    }];
}

- (UIImageView *)avatar {
    if (_avatar == nil) {
        _avatar = [[UIImageView alloc] init];
        _avatar.backgroundColor = [UIColor yellowColor];
        _avatar.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _avatar;
}

- (UILabel *)nickname {
    if (_nickname == nil) {
        _nickname = [[UILabel alloc] init];
        _nickname.font = [UIFont systemFontOfSize:kDefaultTextSize];
        _nickname.textColor = [UIColor brownColor];
    }
    return _nickname;
}

- (UILabel *)content {
    if (_content == nil) {
        _content = [[UILabel alloc] init];
        _content.font = [UIFont systemFontOfSize:kDefaultTextSize];
        _content.textAlignment = NSTextAlignmentJustified;
        _content.numberOfLines = 0;
    }
    return _content;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
