//
//  UIImageView+Placeholder.h
//  Treasure
//
//  Created by xiayiyong on 15/11/24.
//  Copyright (c) 2015年 上海赛可电子商务有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (Placeholder)

/**
 *  设置图片
 *
 *  @param name        图片名称
 *  @param placeholder 原始图片
 */
- (void)setImageWithName:(NSString *)name placeholderImage:(NSString *)placeholder;

@end
