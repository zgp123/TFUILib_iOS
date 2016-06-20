//
//  TFHeadFloatLayout.h
//  demo
//
//  Created by xiayiyong on 16/3/4.
//  Copyright © 2016年 上海赛可电子商务有限公司. All rights reserved.
//  一个像UITableView那样可以使得headView浮动的布局
//  copy from https://github.com/BetterFatMan/CollectionView
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, TFCardAnimType)
{
    TFCardAnimTypeLinear,
    TFCardAnimTypeRotary,
    TFCardAnimTypeCarousel,
    TFCardAnimTypeCarousel1,
    TFCardAnimTypeCoverFlow,
};

@interface TFCardLayout : UICollectionViewLayout

/**
 *  根据动画类型初始化
 *
 *  @param anim 动画类型
 *
 *  @return
 */
- (instancetype)initWithAnim:(TFCardAnimType)anim;

/**
 *  动画类型
 */
@property (readonly)  TFCardAnimType carouselAnim;

/**
 *  卡片大小
 */
@property (nonatomic) CGSize itemSize;
/**
 *  可视卡片数
 */
@property (nonatomic) NSInteger visibleCount;
/**
 *  滚动方向
 */
@property (nonatomic) UICollectionViewScrollDirection scrollDirection;

@end
