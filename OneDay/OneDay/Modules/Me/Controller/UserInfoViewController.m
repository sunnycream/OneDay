//
//  UserInfoViewController.m
//  OneDay
//
//  Created by admin on 2018/8/9.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "UserInfoViewController.h"
#import "UserAvatarViewController.h"
#import "UserNicknameViewController.h"
#import "UserQRCodeViewController.h"
#import "UserSignatureViewController.h"
#import "BirthdayViewController.h"

@interface UserInfoViewController ()

@end

static NSString *cellID = @"cellID";
@implementation UserInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"个人信息";

    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellID];
    [self.dataArray addObjectsFromArray:@[@"头像", @"昵称", @"二维码", @"个性签名", @"生辰"]];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];

    cell.textLabel.text = [self.dataArray objectAtIndex:indexPath.row];
    cell.textLabel.font = [UIFont systemFontOfSize:kDefaultTextSize];

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

    switch (indexPath.row) {
        case 0:{//头像
            UserAvatarViewController *avatarVC = [[UserAvatarViewController alloc] init];
            [self.navigationController pushViewController:avatarVC animated:YES];
            break;
        }
        case 1:{//昵称
            UserNicknameViewController *nicknameVC = [[UserNicknameViewController alloc] init];
            [self.navigationController pushViewController:nicknameVC animated:YES];
            break;
        }
        case 2:{//二维码
            UserQRCodeViewController *QRCodeVC = [[UserQRCodeViewController alloc] init];
            [self.navigationController pushViewController:QRCodeVC animated:YES];
            break;
        }
        case 3:{//个性签名
            UserSignatureViewController *signatureVC = [[UserSignatureViewController alloc] init];
            [self.navigationController pushViewController:signatureVC animated:YES];
            break;
        }
        case 4:{//生辰
            BirthdayViewController *birthdayVC = [[BirthdayViewController alloc] init];
            [self.navigationController pushViewController:birthdayVC animated:YES];
            break;
        }
        default:
            break;
    }
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
