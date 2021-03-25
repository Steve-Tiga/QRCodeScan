//
//  HY_ScanLayer.h
//  QRCodeScan_Example
//
//  Created by 猫态科技 on 2021/3/9.
//  Copyright © 2021 Baffin-HSL. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HY_ScanLayer : CALayer

- (instancetype)initWithBounds:(CGRect)bounds
                     focusRect:(CGRect)focusRect;

// 扫描线开始动画
-(void)startAnimate;

// 扫描线停止动画
-(void)stopAnimate;

//更新扫描区域
- (void)updateFocus:(CGRect)focusRect;

@end

NS_ASSUME_NONNULL_END
