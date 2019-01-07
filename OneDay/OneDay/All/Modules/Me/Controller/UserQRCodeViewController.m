//
//  UserQRCodeViewController.m
//  OneDay
//
//  Created by admin on 2018/11/21.
//  Copyright © 2018 admin. All rights reserved.
//

#import "UserQRCodeViewController.h"
#import <CoreImage/CoreImage.h>

@interface UserQRCodeViewController ()

@property (nonatomic, strong) UIImageView *QRCodeImage;

@end

@implementation UserQRCodeViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"我的二维码";

    UIBarButtonItem *rightBarItem = [UIBarButtonItem itemWithImage:[UIImage imageNamed:@"nav_more"] target:self action:@selector(rightButtonAction)];
    self.navigationItem.rightBarButtonItem = rightBarItem;

    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressQRCodeImage)];
    self.QRCodeImage.userInteractionEnabled = YES;
    [self.QRCodeImage addGestureRecognizer:longPress];

    [self createQRCodeImage];
}

- (void)longPressQRCodeImage {
    [self rightButtonAction];
}

- (void)rightButtonAction {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];

    UIAlertAction *change = [UIAlertAction actionWithTitle:@"Change" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //换个样式
    }];
    UIAlertAction *save = [UIAlertAction actionWithTitle:@"Save" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        UIImageWriteToSavedPhotosAlbum(self.QRCodeImage.image, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
    }];
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * action) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }];

    [alert addAction:change];
    [alert addAction:save];
    [alert addAction:cancel];

    [self presentViewController:alert animated:YES completion:nil];
}

#pragma mark - 保存图片
- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo {
    NSLog(@"保存成功");
    if (error) {
        NSLog(@"the error is: %@", error);
    }
}

#pragma mark - UIImagePickerControllerDelegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<UIImagePickerControllerInfoKey,id> *)info {
    [picker dismissViewControllerAnimated:YES completion:nil];
    UIImage *image = [info valueForKey:UIImagePickerControllerEditedImage];
    self.QRCodeImage.image = image;
}

- (void)createQRCodeImage {
    CIFilter *filter = [CIFilter filterWithName:@"CIQRCodeGenerator"];

    [filter setDefaults];

    NSString *dataString = @"https://onevcat.com/#blog";
    NSData *data = [dataString dataUsingEncoding:NSUTF8StringEncoding];

    [filter setValue:data forKey:@"inputMessage"];//value必须是NSData类型

    CIImage *outputImage = [filter outputImage];

//    CGFloat scale = CGRectGetWidth(self.QRCodeImage.frame) / CGRectGetWidth(outputImage.extent);
    CGFloat scale = 200 / CGRectGetWidth(outputImage.extent);
    CGAffineTransform transform = CGAffineTransformMakeScale(scale, scale);
    CIImage *transformImage = [outputImage imageByApplyingTransform:transform];

    CIContext *context = [CIContext contextWithOptions:nil];
    CGImageRef imageRef = [context createCGImage:transformImage fromRect:transformImage.extent];

    self.QRCodeImage.image = [UIImage imageWithCGImage:imageRef];
}

- (UIImageView *)QRCodeImage {
    if (!_QRCodeImage) {
        _QRCodeImage = [[UIImageView alloc] init];
        [self.view addSubview:_QRCodeImage];

        [_QRCodeImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(200, 200));
            make.center.equalTo(self.view);
        }];
    }
    return _QRCodeImage;
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
