//
//
//
//  github:https://github.com/MxABC/LBXScan
//  Created by lbxia on 15/3/4.
//  Copyright (c) 2015年 lbxia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
#import "LBXScanResult.h"

/**
 @brief  封装系统自带原生扫码功能
         识别图片二维码以及生成二维码功能
        识别码类型,AVMetadataObjectTypeQRCode：二维码   AVMetadataObjectTypeEAN13Code/AVMetadataObjectTypeEAN8Code：条形码
 */
@interface LBXScanWrapper : NSObject


/**
 @brief  初始化相机
 @param preView          视屏预览View
 @param arrayBarCodeType 扫码类型,传值nil,默认很多种类型...
 @param cropRect         识别区域
 @param blockScanResult  返回扫码结果
 @return LBXScanVendor
 */
- (instancetype)initWithPreView:(UIView*)preView objectType:(NSArray*)arrayBarCodeType cropRect:(CGRect)cropRect
              success:(void(^)(NSArray<LBXScanResult*> *array))blockScanResult;

/*!
 *  开始扫码,扫码成功返回数据后，内部调用stopScan，重新扫描需要重新调用startScan
 */
- (void)startScan;

/*!
 *  停止扫码
 */
- (void)stopScan;

/*!
 *  开启关闭闪光灯
 *
 *  @param bOpen YES:开启，NO：关闭
 */
- (void)openFlash:(BOOL)bOpen;

/*!
 *  开启或关闭闪光灯
 *  之前是开启，则这次是关闭
 *  之前是关闭，则这次是开启
 */
- (void)openOrCloseFlash;

/*!
 *  修改扫码类型
 *
 *  @param objType 扫码类型: AVMetadataObjectTypeQRCode：二维码   AVMetadataObjectTypeEAN13Code：条形码
 */
- (void)changeScanObjType:(NSArray*)barCodeType;

/*
 *  生成二维码
 *
 *  @param str  二维码字符串
 *  @param size 二维码图片大小
 *
 *  @return 返回生成的图像
 */
+ (UIImage*)createQRCodeWithString:(NSString*)str size:(CGSize)size;

/*
 *  生成条形码
 *
 *  @param str  条形码字符串
 *  @param size 条形码图片大小
 *
 *  @return 返回生成的图像
 */
+ (UIImage*)createBarCodeWithString:(NSString*)str size:(CGSize)size;

- (UIImage *)generateQRCode:(NSString *)code width:(CGFloat)width height:(CGFloat)height;

// 每隔4个字符空两格
- (NSString *)formatCode:(NSString *)code;

/**
 @brief  给二维码图像上色
 @param image 二维码图像
 @param red   红色
 @param green 绿色
 @param blue  蓝色
 @return 上色后的图像
 */
+ (UIImage*)imageBlackToTransparent:(UIImage*)image withRed:(CGFloat)red andGreen:(CGFloat)green andBlue:(CGFloat)blue;

/**
 @brief  图像中间加logo图片
 @param srcImg    原图像
 @param LogoImage logo图像
 @param logoSize  logo图像尺寸
 @return 加Logo的图像
 */
+ (UIImage*)addImageLogo:(UIImage*)srcImg centerLogoImage:(UIImage*)logoImage logoSize:(CGSize)logoSize;

- (UIImage *)generateBarCode:(NSString *)code width:(CGFloat)width height:(CGFloat)height;

#pragma mark - 生成二维码，背景色及二维码颜色设置
/**
 @brief  生成颜色二维码,引用http://www.jianshu.com/p/e8f7a257b612
 @param text    二维码字符串
 @param size    大小
 @param qrColor 二维码颜色
 @param bkColor 背景色
 @return 二维码图像
 */
+ (UIImage*)createQRCodeWithString:(NSString*)text size:(CGSize)size qrColor:(UIColor*)qrColor bgColor:(UIColor*)bgolor;

/*!
 *  识别各种码图片
 *
 *  @param image 图像
 *  @param block 返回识别结果
 */
+ (void)recognizeImage:(UIImage*)image success:(void(^)(NSArray<LBXScanResult*> *array))block;

#pragma mark- 震动、声音效果
/**
 @brief  识别成功震动提醒
 */
+ (void)systemVibrate;

/**
 @brief  扫码成功声音提醒
 */
+ (void)systemSound;

#pragma mark -相机、相册权限

/**
 @brief  获取相机权限
 */
+ (BOOL)isGetCameraPermission;

/**
 @brief  获取相册权限
 */
+ (BOOL)isGetPhotoPermission;

@end




