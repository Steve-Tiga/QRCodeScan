//
//  HY_ScanView.h
//  QRCodeScan_Example
//
//  Created by 猫态科技 on 2021/3/9.
//  Copyright © 2021 Baffin-HSL. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef enum : NSUInteger {
    HY_ScanTypeQrCode,
    HY_ScanTypeBarCode,
    HY_ScanTypeAll,
} HY_ScanType;

@interface HY_ScanView : UIView

-(id)initWithFrame:(CGRect)frame style:(NSString *)style;

//开始扫描动画
- (void)startAnimating;
//停止扫描动画
- (void)stopAnimating;

@property (nonatomic, assign) HY_ScanType scanType;

@end

NS_ASSUME_NONNULL_END
