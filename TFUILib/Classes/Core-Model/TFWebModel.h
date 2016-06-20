//
//  TFWebViewModel.h
//  TFUILib
//
//  Created by xiayiyong on 15/10/29.
//  Copyright (c) 2015年 上海赛可电子商务有限公司. All rights reserved.
//

#import "TFModel.h"
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface TFWebModel : TFModel

/**
 *  标题
 */
@property (nonatomic,strong) NSString *title;

/**
 *  URL
 */
@property (nonatomic,strong) NSString *url;

/**
 *  是否需要关闭按钮
 */
@property (nonatomic, assign) BOOL needCloseButton;

/**
 *  是否需要多层返回
 */
@property (nonatomic, assign) BOOL canMulilayerBack;

/**
 *  固定标题
 */
@property (nonatomic, strong) NSString *fixedTitle;

/**
 *  第一次加载未加载完成显示的标题
 */
@property (nonatomic, strong) NSString *placeholderTitle;

#pragma mark - 3.0工程新增属性

/**
 *  是否需要加载进度条
 */
@property (nonatomic, assign) BOOL showProgressView;

/**
 *  是否允许长按和呼出手势
 */
@property (nonatomic, assign) BOOL allowGesture;

/**
 *  进度条颜色
 */
@property (nonatomic, strong) UIColor *progressViewColor;


@end
