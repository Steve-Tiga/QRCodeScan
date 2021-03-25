//
//  HY_ScanView.m
//  QRCodeScan_Example
//
//  Created by 猫态科技 on 2021/3/9.
//  Copyright © 2021 Baffin-HSL. All rights reserved.
//

#import "HY_ScanView.h"
#import "HY_ScanLayer.h"

#define LeftDistance 60

@interface HY_ScanView()

@property (nonatomic, assign) NSInteger heightScale;
@property (nonatomic, strong) HY_ScanLayer *scanRectLayer;

@end

@implementation HY_ScanView{
    BOOL needStop;
}

-(id)initWithFrame:(CGRect)frame style:(NSString *)style {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
        _scanType = HY_ScanTypeQrCode;
        self.heightScale = 1;
        [self createLayer];
    }
    return self;
}

- (void)createLayer {
    CGFloat Left = LeftDistance / _heightScale;
    CGSize sizeRetangle = CGSizeMake(self.frame.size.width - Left * 2, (self.frame.size.width - Left * 2) / _heightScale);
    CGFloat YMinRetangle = self.frame.size.height / 2.0 - sizeRetangle.height/2.0;
    
    _scanRectLayer = [[HY_ScanLayer alloc] initWithBounds:self.bounds focusRect:CGRectMake(Left, YMinRetangle, sizeRetangle.width, sizeRetangle.height)];
    [self.layer addSublayer:_scanRectLayer];
}

- (void)setScanType:(HY_ScanType)scanType {
    _scanType = scanType;
    self.heightScale = scanType == HY_ScanTypeBarCode ? 3 : 1;
    CGFloat Left = LeftDistance / self.heightScale;
    CGSize sizeRetangle = CGSizeMake(self.frame.size.width - Left * 2, (self.frame.size.width - Left * 2) / self.heightScale);
    CGFloat YMinRetangle = self.frame.size.height / 2.0 - sizeRetangle.height/2.0;
    [_scanRectLayer updateFocus:CGRectMake(Left,
                                           YMinRetangle,
                                           sizeRetangle.width,
                                           sizeRetangle.height)];
}

- (void)startAnimating {
    [_scanRectLayer startAnimate];
}

- (void)stopAnimating {
    [_scanRectLayer stopAnimate];
}



@end
