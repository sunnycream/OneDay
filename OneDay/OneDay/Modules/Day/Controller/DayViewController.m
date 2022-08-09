//
//  DayViewController.m
//  OneDay
//
//  Created by admin on 2018/8/1.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "DayViewController.h"
#import <WebKit/WebKit.h>
#import "DayCell.h"

static NSString *cellID = @"MyCell";
@interface DayViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataArray;

@end

@implementation DayViewController

- (void)viewWillAppear:(BOOL)animated {

    //下拉刷新1
//    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(headerRefresh)];
//    [self.tableView.mj_header beginRefreshing];

    //下拉刷新2
//    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
//        [self headerRefresh];
//    }];
//    [self.tableView.mj_header beginRefreshing];

    //下拉刷新 - gif
//    MJRefreshGifHeader *header = [MJRefreshGifHeader headerWithRefreshingTarget:self refreshingAction:@selector(headerRefresh)];
//    NSMutableArray *imageArray = [NSMutableArray array];
//    for (int i = 1; i <= 3; i++) {
//        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"bp%d",i]];
//        [imageArray addObject:image];
//        [header setImages:imageArray forState:MJRefreshStateRefreshing];
//    }
//    self.tableView.mj_header = header;
//    [self.tableView.mj_header beginRefreshing];
}

- (void)viewDidLoad {
    [super viewDidLoad];

//    [self setupWebView];

    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"编辑" style:UIBarButtonItemStyleDone target:self action:@selector(editAction)];

    [self.tableView registerClass:[DayCell class] forCellReuseIdentifier:cellID];

    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [self footerRefresh];
    }];

//    self.tableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 0.1)];
//    self.tableView.tableHeaderView.backgroundColor = [UIColor yellowColor];

    for (int i = 0; i < 10; i++) {
        NSString *string = [NSString stringWithFormat:@"%d",i];
        NSArray *array = [NSArray arrayWithObject:string];
        [self.dataArray addObjectsFromArray:array];
    }
}

- (void)setupWebView {
    WKWebViewConfiguration *configuration = [[WKWebViewConfiguration alloc] init];
    WKWebView *webView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight) configuration:configuration];
    [self.view addSubview:webView];

    NSString *string1 = @"https://tieba.baidu.com/f?kw=海贼王&fr=index";

    //对URL中的汉字进行处理
    NSString *string2 = [string1 stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet  URLQueryAllowedCharacterSet]];

    NSURL *url = [NSURL URLWithString:string2];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [webView loadRequest:request];
}

- (void)headerRefresh {
    NSLog(@"下拉刷新数据");
    [self performSelector:@selector(endHeaderRefreshing) withObject:nil afterDelay:3];
}

- (void)footerRefresh {
    NSLog(@"上拉加载数据");
    [self performSelector:@selector(endFooterRefreshing) withObject:nil afterDelay:3];
}

- (void)endHeaderRefreshing {
    [self.tableView.mj_header endRefreshing];
}

- (void)endFooterRefreshing {
    //[self.tableView.mj_footer endRefreshing];
    [self.tableView.mj_footer endRefreshingWithNoMoreData];
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DayCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
//    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.selectedBackgroundView = [[UIView alloc] init];

//    cell.avatar.image = [UIImage imageNamed:@"avatar"];
    cell.nickname.text = @"电风扇";
    cell.content.text = self.dataArray[indexPath.row];

    return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    id object = [self.dataArray objectAtIndex:indexPath.row];
    [self.dataArray removeObject:object];
    [self.tableView deleteRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath, nil] withRowAnimation:UITableViewRowAnimationAutomatic];
    [self.tableView reloadData];

    //    [self.dataArray insertObject:@"空调" atIndex:indexPath.row];
    //    //[self.tableView insertRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath, nil] withRowAnimation:UITableViewRowAnimationAutomatic];
    //    [self.tableView reloadData];
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath {
    id object = [self.dataArray objectAtIndex:sourceIndexPath.row];
    [self.dataArray removeObjectAtIndex:sourceIndexPath.row];
    [self.dataArray insertObject:object atIndex:destinationIndexPath.row];
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 65;
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    //    return UITableViewCellEditingStyleInsert;

    return UITableViewCellEditingStyleDelete | UITableViewCellEditingStyleInsert;
}

- (void)editAction {
    self.tableView.editing = !self.tableView.editing;
    if (self.tableView.editing) {
        [self.navigationItem.rightBarButtonItem setTitle:@"OK"];

        for (int i = 0; i < self.dataArray.count; i++) {
            NSIndexPath *indexPath = [NSIndexPath indexPathForRow:i inSection:0];
            [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
        }
    } else {
        [self.navigationItem.rightBarButtonItem setTitle:@"编辑"];

        for (int i = 0; i < self.dataArray.count; i++) {
            NSIndexPath *indexPath = [NSIndexPath indexPathForRow:i inSection:0];
            [self.tableView selectRowAtIndexPath:indexPath animated:YES scrollPosition:UITableViewScrollPositionTop];
        }
    }
}

#pragma mark - 懒加载
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight) style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [[UIView alloc] init];
        _tableView.separatorColor = [UIColor blackColor];
        _tableView.separatorInset = UIEdgeInsetsZero;
        _tableView.showsVerticalScrollIndicator = YES;
        _tableView.contentSize = CGSizeMake(kScreenWidth, 3000);
        [self.view addSubview:_tableView];
    }
    return _tableView;
}

- (NSMutableArray *)dataArray {
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
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
