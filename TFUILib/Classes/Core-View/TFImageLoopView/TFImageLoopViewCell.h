//
//  TFImageLoopViewCell.h
//  TFImageLoopView
//
//  Created by aier on 15-3-22.
//  Copyright (c) 2015年 GSD. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TFCollectionViewCell.h"

@interface TFImageLoopViewCell : TFCollectionViewCell

/**
 *  图片
 */
@property (weak, nonatomic) UIImageView *imageView;

/**
 *  标题
 */
@property (copy, nonatomic) NSString *title;

/**
 *  标题颜色
 */
@property (nonatomic, strong) UIColor *titleLabelTextColor;

/**
 *  标题字体
 */
@property (nonatomic, strong) UIFont *titleLabelTextFont;

/**
 *  标题背景颜色
 */
@property (nonatomic, strong) UIColor *titleLabelBackgroundColor;

/**
 *  标题高度
 */
@property (nonatomic, assign) CGFloat titleLabelHeight;

@property (nonatomic, assign) BOOL hasConfigured;

@end
