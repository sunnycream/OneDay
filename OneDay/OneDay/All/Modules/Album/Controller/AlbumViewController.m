//
//  AlbumViewController.m
//  OneDay
//
//  Created by admin on 2018/8/7.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "AlbumViewController.h"
#import "AlbumCell.h"
#import "SleepViewController.h"
#import "DietViewController.h"
#import "MangaViewController.h"
#import "BookViewController.h"

@interface AlbumViewController ()

@property (nonatomic, strong) NSMutableArray *imageArray;

@end

@implementation AlbumViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //先调用下collectionView
    self.collectionView.backgroundColor = kThemeBackgroundColor;

    [self.dataArray addObjectsFromArray:@[@"睡眠", @"饮食", @"日漫", @"书"]];
}

- (UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    static NSString *cellID = @"cellID";

    [collectionView registerClass:[AlbumCell class] forCellWithReuseIdentifier:cellID];
    AlbumCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];

    cell.albumImage.backgroundColor = [UIColor blackColor];
    cell.albumName.backgroundColor = [UIColor yellowColor];
    
    cell.albumName.text = [self.dataArray objectAtIndex:indexPath.item];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.item) {
        case 0:{//睡眠
            SleepViewController *sleepVC = [[SleepViewController alloc] init];
            sleepVC.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:sleepVC animated:YES];
            break;
        }
        case 1:{//饮食
            DietViewController *dietVC = [[DietViewController alloc] init];
            dietVC.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:dietVC animated:YES];
            break;
        }
        case 2:{//日漫
            MangaViewController *mangaVC = [[MangaViewController alloc] init];
            mangaVC.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:mangaVC animated:YES];
            break;
        }
        case 3:{//书
            BookViewController *bookVC = [[BookViewController alloc] init];
            bookVC.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:bookVC animated:YES];
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
