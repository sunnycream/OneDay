//
//  NightViewController.m
//  OneDay
//
//  Created by admin on 2018/8/7.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "NightViewController.h"
#import "NightCell.h"
#import "SleepViewController.h"
#import "DietViewController.h"
#import "VideoViewController.h"
#import "BookViewController.h"

@interface NightViewController ()<UIScrollViewDelegate>

@property (nonatomic, strong) NSMutableArray *imageArray;
@property (nonatomic, strong) NSMutableArray *bannerArray;
@property (nonatomic, strong) UIScrollView *bannerView;
@property (nonatomic, strong) UIPageControl *pageControl;
@property (nonatomic, strong) NSTimer *timer;

@end

static NSString *cellID = @"cellID";
@implementation NightViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.collectionView registerClass:[NightCell class] forCellWithReuseIdentifier:cellID];

    [self.dataArray addObjectsFromArray:@[@"睡眠", @"饮食", @"影音", @"书"]];

    for (int i = 0; i < self.bannerArray.count; i++) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(kBannerWidth * i, 100, kBannerWidth, 30)];
        label.backgroundColor = [UIColor blackColor];
        label.textColor = [UIColor whiteColor];
        label.textAlignment = NSTextAlignmentCenter;
        label.text = self.bannerArray[i];
        [self.bannerView addSubview:label];
    }

    [self setupTimer];
}

- (void)setupTimer {
    [self.timer invalidate];
    self.timer = [NSTimer timerWithTimeInterval:2.0f target:self selector:@selector(startTimer) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}

//开启定时器
- (void)startTimer {
    NSInteger page = (self.pageControl.currentPage + 1) % self.bannerArray.count;
    self.pageControl.currentPage = page;
    [self changePage:self.pageControl];
}

//关闭定时器
- (void)invalidateTimer {
    [self.timer invalidate];
    self.timer = nil;
}

#pragma mark - UICollectionViewDataSource
- (UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    NightCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
    cell.icon.backgroundColor = [UIColor blackColor];
    cell.title.backgroundColor = [UIColor yellowColor];
    cell.title.text = [self.dataArray objectAtIndex:indexPath.item];

    return cell;
}

#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.item) {
        case 0:{//睡眠
            SleepViewController *sleepVC = [[SleepViewController alloc] init];
            [self.navigationController pushViewController:sleepVC animated:YES];
            break;
        }
        case 1:{//饮食
            DietViewController *dietVC = [[DietViewController alloc] init];
            [self.navigationController pushViewController:dietVC animated:YES];
            break;
        }
        case 2:{//影音
            VideoViewController *mangaVC = [[VideoViewController alloc] init];
            [self.navigationController pushViewController:mangaVC animated:YES];
            break;
        }
        case 3:{//书
            BookViewController *bookVC = [[BookViewController alloc] init];
            [self.navigationController pushViewController:bookVC animated:YES];
            break;
        }
        default:
            break;
    }
}

#pragma mark - UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat width = (kScreenWidth - 20 * 3) / 2;

    return CGSizeMake(width, width + 20);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(300, 20, 20, 20);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 20.f;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 0.f;
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    NSInteger page = scrollView.contentOffset.x / scrollView.frame.size.width;
    self.pageControl.currentPage = page;
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    [self invalidateTimer];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    [self setupTimer];
}

#pragma mark - event method
- (void)changePage:(UIPageControl *)pageControl {
    NSInteger page = pageControl.currentPage;
    [self.bannerView setContentOffset:CGPointMake(kBannerWidth * page, 0)];
}

#pragma mark - lazy load
- (NSMutableArray *)bannerArray {
    if (!_bannerArray) {
        _bannerArray = [NSMutableArray array];
        NSArray *array = @[@"睡眠", @"饮食", @"影音", @"书"];
        [_bannerArray addObjectsFromArray:array];
    }
    return _bannerArray;
}

- (UIScrollView *)bannerView {
    if (!_bannerView) {
        _bannerView = [[UIScrollView alloc] initWithFrame:CGRectMake(20, kStatsBarHeight + kNavBarHeight + 20, kBannerWidth, 200)];
        _bannerView.delegate = self;
        _bannerView.pagingEnabled = YES;//设置可以翻页
        _bannerView.backgroundColor = [UIColor grayColor];
        _bannerView.contentSize = CGSizeMake(kBannerWidth * self.bannerArray.count, 0);
        [self.view addSubview:_bannerView];
    }
    return _bannerView;
}

- (UIPageControl *)pageControl {
    if (!_pageControl) {
         _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(kScreenWidth / 2 - 30, self.bannerView.frame.origin.y + self.bannerView.frame.size.height - 30 - 20, 60, 30)];
        _pageControl.backgroundColor = [UIColor redColor];
        _pageControl.hidesForSinglePage = YES;
        _pageControl.currentPage = 0;
        _pageControl.numberOfPages = self.bannerArray.count;
        _pageControl.currentPageIndicatorTintColor = [UIColor greenColor];
        _pageControl.pageIndicatorTintColor = [UIColor blueColor];
        [_pageControl addTarget:self action:@selector(changePage:) forControlEvents:UIControlEventValueChanged];
        [self.view addSubview:_pageControl];
    }
    return _pageControl;
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
