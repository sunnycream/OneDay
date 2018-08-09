//
//  MeViewController.m
//  OneDay
//
//  Created by admin on 2018/8/1.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "MeViewController.h"
#import "UserInfoViewController.h"
#import "StatisticsViewController.h"
#import "AccountViewController.h"
#import "SettingViewController.h"

static NSString *cellID = @"cellID";
@interface MeViewController ()

@property (nonatomic, strong) NSMutableArray *imageArray;
@property (nonatomic, strong) UIView *headerView;

@end

@implementation MeViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellID];
    [self.tableView setTableHeaderView:self.headerView];
    [self userInfo];
    
    NSArray *text = @[@"统计", @"账号", @"设置"];
    NSArray *image = @[@"tab_bar_oneday_normal", @"tab_bar_album_normal", @"tab_bar_me_normal"];
    [self.dataArray addObjectsFromArray:text];
    [self.imageArray addObjectsFromArray:image];
}

- (void)userInfo {
    //头像
    UIImageView *avatar = [[UIImageView alloc] init];
    avatar.backgroundColor = [UIColor blackColor];
    [self.headerView addSubview:avatar];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(enterUserInfo:)];
    avatar.userInteractionEnabled = YES;
    [avatar addGestureRecognizer:tap];
    
    //昵称
    UILabel *nickname = [[UILabel alloc] init];
    nickname.text = @"nickname";
    nickname.font = [UIFont boldSystemFontOfSize:16];
    [self.headerView addSubview:nickname];
    
    //简介
    UILabel *intro = [[UILabel alloc] init];
    intro.text = @"intro...";
    intro.font = [UIFont systemFontOfSize:14];
    [self.headerView addSubview:intro];
    
    //二维码
    UIImageView *QRcode = [[UIImageView alloc] init];
    QRcode.backgroundColor = [UIColor grayColor];
    [self.headerView addSubview:QRcode];
    
    [avatar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_offset(CGSizeMake(60, 60));
        make.top.equalTo(self.headerView.mas_top).offset(20);
        make.left.equalTo(self.headerView.mas_left).offset(20);
    }];
    
    [nickname mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(avatar.mas_top).offset(5);
        make.left.equalTo(avatar.mas_right).offset(10);
        make.right.equalTo(QRcode.mas_left).offset(-10);
    }];
    
    [intro mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(nickname.mas_left);
        make.bottom.equalTo(avatar.mas_bottom).offset(-5);
        make.right.equalTo(QRcode.mas_left).offset(-10);
    }];
    
    [QRcode mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_offset(CGSizeMake(50, 50));
        make.right.equalTo(self.headerView.mas_right).offset(-20);
        make.centerY.equalTo(self.headerView);
    }];
}

- (void)enterUserInfo:(UITapGestureRecognizer *)tap {
    UserInfoViewController *userInfoVC = [[UserInfoViewController alloc] init];
    userInfoVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:userInfoVC animated:YES];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
    }
    cell.textLabel.text = [self.dataArray objectAtIndex:indexPath.row];
    cell.imageView.image = [UIImage imageNamed:[self.imageArray objectAtIndex:indexPath.row]];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    switch (indexPath.row) {
        case 0:{//统计
            StatisticsViewController *statisticsVC = [[StatisticsViewController alloc] init];
            statisticsVC.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:statisticsVC animated:YES];
            break;
        }
        case 1:{//账户
            AccountViewController *accountVC = [[AccountViewController alloc] init];
            accountVC.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:accountVC animated:YES];
            break;
        }
        case 2:{//设置
            SettingViewController *settingVC = [[SettingViewController alloc] init];
            settingVC.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:settingVC animated:YES];
            break;
        }
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *view = [[UIView alloc] init];
    
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 10.0f;
}

- (NSMutableArray *)imageArray {
    if (!_imageArray) {
        _imageArray = [NSMutableArray array];
    }
    return _imageArray;
}

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
