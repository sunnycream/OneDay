//
//  MeViewController.m
//  OneDay
//
//  Created by admin on 2018/8/1.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "MeViewController.h"

@interface MeViewController ()

@property (nonatomic, strong) NSMutableArray *imageArray;
@property (nonatomic, strong) UIView *headerView;

@end

@implementation MeViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSArray *text = @[@"统计", @"账号", @"设置"];
    NSArray *image = @[@"tab_bar_oneday_normal", @"tab_bar_album_normal", @"tab_bar_me_normal"];
    [self.dataArray addObjectsFromArray:text];
    [self.imageArray addObjectsFromArray:image];
    
    //为啥不走masonry布局
//    [self.headerView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.tableView.mas_top);
//        make.left.equalTo(self.tableView.mas_left);
//        make.right.equalTo(self.tableView.mas_right);
//        make.height.mas_offset(100);
//    }];
    
    [self.tableView setTableHeaderView:self.headerView];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellID = @"cellID";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellID];
    }
    cell.textLabel.text = [self.dataArray objectAtIndex:indexPath.row];
    cell.imageView.image = [UIImage imageNamed:[self.imageArray objectAtIndex:indexPath.row]];
    
    return cell;
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
        _headerView.backgroundColor = [UIColor greenColor];
        [self.tableView addSubview:_headerView];
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
