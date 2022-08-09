//
//  MeCell.m
//  OneDay
//
//  Created by admin on 2019/1/7.
//  Copyright © 2019 admin. All rights reserved.
//

#import "MeCell.h"

@implementation MeCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.icon = [[UIImageView alloc] init];
        [self.contentView addSubview:self.icon];

        self.title = [[UILabel alloc] init];
        self.title.font = [UIFont systemFontOfSize:kDefaultTextSize];
        [self.contentView addSubview:self.title];

        [self setupConstraint];
    }
    return self;
}

- (void)setupConstraint {
    [self.icon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_offset(CGSizeMake(32, 32));
        make.left.equalTo(self.contentView).offset(20);
        make.centerY.equalTo(self.contentView);
    }];

    [self.title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.icon.mas_right).offset(10);
        make.centerY.equalTo(self.contentView);
    }];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
