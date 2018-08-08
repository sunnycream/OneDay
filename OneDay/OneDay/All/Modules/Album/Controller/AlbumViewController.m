//
//  AlbumViewController.m
//  OneDay
//
//  Created by admin on 2018/8/7.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "AlbumViewController.h"
#import "AlbumCell.h"

static NSString *cellID = @"cellID";
@interface AlbumViewController ()

@property (nonatomic, strong) NSMutableArray *imageArray;

@end

@implementation AlbumViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.collectionView registerClass:[AlbumCell class] forCellWithReuseIdentifier:cellID];
    
    NSArray *text = @[@"睡眠", @"饮食", @"日漫", @"书"];
    NSArray *image = @[@"tab_bar_oneday_normal", @"tab_bar_album_normal", @"tab_bar_me_normal", @"tab_bar_me_normal"];
    [self.dataArray addObjectsFromArray:text];
    [self.imageArray addObjectsFromArray:image];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    AlbumCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];

    cell.albumImage.backgroundColor = [UIColor blackColor];
    cell.albumName.backgroundColor = [UIColor yellowColor];
    
    cell.albumImage.image = [UIImage imageNamed:[self.imageArray objectAtIndex:indexPath.item]];
    cell.albumName.text = [self.dataArray objectAtIndex:indexPath.item];
    
    return cell;
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
