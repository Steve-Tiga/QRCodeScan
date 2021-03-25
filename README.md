# QRCodeScan

[![CI Status](https://img.shields.io/travis/Baffin-HSL/QRCodeScan.svg?style=flat)](https://travis-ci.org/Baffin-HSL/QRCodeScan)
[![Version](https://img.shields.io/cocoapods/v/QRCodeScan.svg?style=flat)](https://cocoapods.org/pods/QRCodeScan)
[![License](https://img.shields.io/cocoapods/l/QRCodeScan.svg?style=flat)](https://cocoapods.org/pods/QRCodeScan)
[![Platform](https://img.shields.io/cocoapods/p/QRCodeScan.svg?style=flat)](https://cocoapods.org/pods/QRCodeScan)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

QRCodeScan is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'QRCodeScan'
```

## 方法使用
### 1.调用扫码

```
#import "HY_QRCodeScan.h"

/**
 *    扫码类型
 *    HY_ScanTypeQrCode,
 *    HY_ScanTypeBarCode,
 *    HY_ScanTypeAll,
 */
HY_ScanViewController *scanVc = [[HY_ScanViewController alloc] initWithQrType:HY_ScanTypeAll onFinish:^(NSString *result, NSError *error) {
    if (error) {
        NSLog(@"error: %@",error);
    } else {
        NSLog(@"扫描结果：%@",result);
        [self showInfo:result];
    }
}];
[self.navigationController pushViewController:scanVc animated:YES];
```

### 2. 调用绘制二维码、条形码

```
///生成二维码
UIImage *QRCodeImage = [HY_ScanCodeTool createQRImageWithString:self.qrText.text QRSize:CGSizeMake(128, 128) QRColor:[UIColor purpleColor] bkColor:[UIColor blackColor]];

///生成条形码
UIImage *barCodeImage = [HY_ScanCodeTool createBarCodeImageWithString:self.qrText.text barSize:CGSizeMake(200, 80)];

///识别二维码
[HY_ScanCodeTool recognizeQrCodeImage:imageView.image onFinish:^(NSString * _Nonnull result) {}];

```

## Author

Baffin-HSL, 15574662657@163.com

## License

QRCodeScan is available under the MIT license. See the LICENSE file for more info.
