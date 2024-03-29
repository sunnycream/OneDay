//
//  MeViewController.m
//  OneDay
//
//  Created by admin on 2018/8/1.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "MeViewController.h"
#import "MeCell.h"
#import "UserInfoViewController.h"
#import "StatisticsViewController.h"
#import "AccountViewController.h"
#import "SettingViewController.h"

@interface MeViewController ()

@property (nonatomic, strong) UIView *headerView;

@end

static NSString *cellID = @"cellID";
@implementation MeViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.tableView registerClass:[MeCell class] forCellReuseIdentifier:cellID];
    [self.tableView setTableHeaderView:self.headerView];
//    self.tableView.tableHeaderView = self.headerView;//作用同上
    
    NSDictionary *dic1 = @{@"text": @"统计", @"icon": @"me_statistical"};
    NSDictionary *dic2 = @{@"text": @"账号", @"icon": @"me_account"};
    NSDictionary *dic3 = @{@"text": @"设置", @"icon": @"me_setting"};
    [self.dataArray addObject:dic1];
    [self.dataArray addObject:dic2];
    [self.dataArray addObject:dic3];
    
    [self setupUserInfo];
}

#pragma mark - UITableViewDelegate, UITableViewDataSource
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MeCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];

    cell.icon.image = [UIImage imageNamed:self.dataArray[indexPath.row][@"icon"]];
    cell.title.text = self.dataArray[indexPath.row][@"text"];

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    switch (indexPath.row) {
        case 0:{//统计
            StatisticsViewController *statisticsVC = [[StatisticsViewController alloc] init];
            [self.navigationController pushViewController:statisticsVC animated:YES];
        }break;
        case 1:{//账户
            AccountViewController *accountVC = [[AccountViewController alloc] init];
            [self.navigationController pushViewController:accountVC animated:YES];
        }break;
        case 2:{//设置
            SettingViewController *settingVC = [[SettingViewController alloc] init];
            [self.navigationController pushViewController:settingVC animated:YES];
        }break;
        default:
            break;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *view = [[UIView alloc] init];
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 10.0f;
}

#pragma mark - 其他
- (void)enterUserInfo {
    UserInfoViewController *userInfoVC = [[UserInfoViewController alloc] init];
    [self.navigationController pushViewController:userInfoVC animated:YES];
}

- (void)setupUserInfo {
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(enterUserInfo)];
    self.headerView.userInteractionEnabled = YES;
    [self.headerView addGestureRecognizer:tap];

    //头像
    UIImageView *avatar = [[UIImageView alloc] init];
    avatar.image = [UIImage imageNamed:@"avatar"];
    avatar.layer.cornerRadius = 5.f;
    avatar.layer.masksToBounds = YES;
    [self.headerView addSubview:avatar];

    //昵称
    UILabel *nickname = [[UILabel alloc] init];
    nickname.text = @"山水";
    nickname.font = [UIFont boldSystemFontOfSize:kBoldTextSize];
    [self.headerView addSubview:nickname];
    
    //简介
    UILabel *intro = [[UILabel alloc] init];
    intro.text = @"黑色的风格";
    intro.font = [UIFont systemFontOfSize:kDefaultTextSize];
    [self.headerView addSubview:intro];
    
    //二维码
    UIImageView *QRcode = [[UIImageView alloc] init];
    QRcode.image = [UIImage imageNamed:@"qr_code"];
    [self.headerView addSubview:QRcode];

    [avatar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.headerView).offset(20);
        make.centerY.equalTo(self.headerView);
        make.size.mas_offset(CGSizeMake(60, 60));
    }];
    
    [nickname mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(avatar).offset(5);
        make.left.equalTo(avatar.mas_right).offset(10);
        make.right.mas_lessThanOrEqualTo(QRcode.mas_left).offset(-10);
    }];
    
    [intro mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(nickname.mas_left);
        make.bottom.equalTo(avatar.mas_bottom).offset(-5);
        make.right.mas_lessThanOrEqualTo(QRcode.mas_left).offset(-10);
    }];
    
    [QRcode mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.headerView).offset(-20);
        make.centerY.equalTo(self.headerView);
        make.size.mas_offset(CGSizeMake(25, 25));
    }];
}

#pragma mark - lazy load
- (UIView *)headerView {
    if (!_headerView) {
        _headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 100)];
        _headerView.backgroundColor = [UIColor whiteColor];
    }
    return _headerView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

//pod 'Masonry', '~> 1.0.2'
