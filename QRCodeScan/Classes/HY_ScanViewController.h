//
//  HY_ScanViewController.h
//  QRCodeScan_Example
//
//  Created by 猫态科技 on 2021/3/9.
//  Copyright © 2021 Baffin-HSL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HY_ScanView.h"

NS_ASSUME_NONNULL_BEGIN

@interface HY_ScanViewController : UIViewController

/**
 初始化二维码扫描控制器

 @param type 扫码类型
 @param finish 扫码完成回调
 @return ScanViewController对象
 */
- (instancetype)initWithQrType:(HY_ScanType)type onFinish:(void (^)(NSString *result, NSError *error))finish;

@end

NS_ASSUME_NONNULL_END
