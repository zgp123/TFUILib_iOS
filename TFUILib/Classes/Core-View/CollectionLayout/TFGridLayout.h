//
//  TFGridLayout.h
//  demo
//
//  Created by xiayiyong on 16/3/4.
//  Copyright © 2016年 上海赛可电子商务有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TFGridLayout : UICollectionViewFlowLayout

/**
 *  行数
 */
@property (nonatomic, assign) NSUInteger numberOfColumns;
/**
 *  列数
 */
@property (nonatomic, assign) NSUInteger numberOfRows;

@end
