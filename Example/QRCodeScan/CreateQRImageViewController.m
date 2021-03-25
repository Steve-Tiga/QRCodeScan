//
//  CreateQRImageViewController.m
//  QRCodeScan_Example
//
//  Created by 猫态科技 on 2021/3/11.
//  Copyright © 2021 Baffin-HSL. All rights reserved.
//

#import "CreateQRImageViewController.h"
#import "HY_QRCodeScan.h"

@interface CreateQRImageViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *qrCodeImage;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *qrCodeImageHeight;
@property (weak, nonatomic) IBOutlet UIImageView *barCodeImage;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *barCodeImageHeight;
@property (weak, nonatomic) IBOutlet UITextField *qrText;

@end

@implementation CreateQRImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.qrCodeImageHeight.constant = 0.00;
    self.barCodeImageHeight.constant = 0.00;
}

-(void)longTapAction:(id)sender{
    UILongPressGestureRecognizer *longTap = sender;
    if (longTap.state == UIGestureRecognizerStateEnded) {
        UIImageView *imageView = (UIImageView *)longTap.view;
        [HY_ScanCodeTool recognizeQrCodeImage:imageView.image onFinish:^(NSString * _Nonnull result) {
            [self showMessage:result];
        }];
    }
}

- (IBAction)creatImageAction:(id)sender {
    if(self.qrText.text.length == 0){
        [self showMessage:@"请输入要生成的字符串"];
    }else{
        UIImage *QRCodeImage = [HY_ScanCodeTool createQRImageWithString:self.qrText.text QRSize:CGSizeMake(128, 128) QRColor:[UIColor purpleColor] bkColor:[UIColor blackColor]];
        self.qrCodeImage.image = QRCodeImage;
        
        UIImage *barCodeImage = [HY_ScanCodeTool createBarCodeImageWithString:self.qrText.text barSize:CGSizeMake(200, 80)];
        self.barCodeImage.image = barCodeImage;
        
        [UIView animateWithDuration:0.3 animations:^{
            self.qrCodeImageHeight.constant = 120.00;
            self.barCodeImageHeight.constant = 120.00;
            [self.view layoutIfNeeded];
        } completion:^(BOOL finished) {
            self.qrCodeImage.userInteractionEnabled = YES;
            [self addTapAction:self.qrCodeImage];
        }];
    }
}

-(void)showMessage:(NSString *)message{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"结果" message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    
    [alert addAction:action];
    
    [self presentViewController:alert animated:YES completion:NULL];
}

//添加长按手势
-(void)addTapAction:(UIView *)view{
    UILongPressGestureRecognizer *longTap = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longTapAction:)];
    [view addGestureRecognizer:longTap];
}

@end
