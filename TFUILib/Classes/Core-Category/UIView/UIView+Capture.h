//
//  UIView+Capture.h
//  TFUILib
//
//  Created by xiayiyong on 15/10/29.
//  Copyright (c) 2015年 上海赛可电子商务有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Capture)

/**
 *  屏幕截屏
 *
 *  @return
 */
- (UIImage *)captureScreenshot;

/**
 *  获取屏幕截图
 *
 *  @return 
 */
- (UIImage *)takeScreenshot;

@end
