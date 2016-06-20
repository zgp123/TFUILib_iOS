//
//  UIView+BlurEffect.h
//  TFUILib
//
//  Created by sunxiaofei on 16/6/4.
//  Copyright © 2016年 上海赛可电子商务有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (BlurEffect)

/**
 *  添加毛玻璃效果[仅支持iOS 8.0+]
 *
 *  @param style style
 */
- (void)blueEffectWithStyle:(UIBlurEffectStyle)style;

@end
