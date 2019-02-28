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

@interface NightViewController ()

@property (nonatomic, strong) NSMutableArray *imageArray;

@end

static NSString *cellID = @"cellID";
@implementation NightViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.collectionView registerClass:[NightCell class] forCellWithReuseIdentifier:cellID];

    [self.dataArray addObjectsFromArray:@[@"睡眠", @"饮食", @"影音", @"书"]];
}

- (UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    NightCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];

    cell.icon.backgroundColor = [UIColor blackColor];
    cell.title.backgroundColor = [UIColor yellowColor];
    
    cell.title.text = [self.dataArray objectAtIndex:indexPath.item];
    
    return cell;
}

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
