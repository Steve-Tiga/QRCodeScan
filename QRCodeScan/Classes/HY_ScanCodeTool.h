//
//  HY_ScanCodeTool.h
//  QRCodeScan
//
//  Created by 猫态科技 on 2021/3/11.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN


@interface HY_ScanCodeTool : NSObject

/**
 生成二维码【白底黑色】

 @param content 二维码内容字符串【数字、字符、链接等】
 @param size 生成图片的大小
 @return UIImage图片对象
 */
+ (UIImage*)createQRImageWithString:(NSString*)content QRSize:(CGSize)size;


/**
 生成二维码【自定义颜色】

 @param content 二维码内容字符串【数字、字符、链接等】
 @param size 生成图片的大小
 @param qrColor 二维码颜色
 @param bkColor 背景色
 @return UIImage图片对象
 */
+ (UIImage* )createQRImageWithString:(NSString*)content QRSize:(CGSize)size QRColor:(UIColor*)qrColor bkColor:(UIColor*)bkColor;


/**
 生成条形码【白底黑色】

 @param content 条码内容【一般是数字】
 @param size 生成条码图片的大小
 @return UIImage图片对象
 */
+ (UIImage *)createBarCodeImageWithString:(NSString *)content barSize:(CGSize)size;


/**
 生成条形码【自定义颜色】

 @param content 条码内容【一般是数字】
 @param size 生成条码图片的大小
 @param qrColor 码颜色
 @param bkColor 背景颜色
 @return UIImage图片对象
 */
+ (UIImage* )createBarCodeImageWithString:(NSString*)content QRSize:(CGSize)size QRColor:(UIColor*)qrColor bkColor:(UIColor*)bkColor;


/**
工具： color转image
 */
+ (UIImage *)createImageWithColor:(UIColor *)color;

/**
 识别二维码

 @param image UIImage对象
 @param finish 识别结果
 */
+ (void)recognizeQrCodeImage:(UIImage *)image onFinish:(void (^)(NSString *result))finish;

@end

NS_ASSUME_NONNULL_END
