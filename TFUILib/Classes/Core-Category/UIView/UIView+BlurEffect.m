//
//  UIView+BlurEffect.m
//  TFUILib
//
//  Created by sunxiaofei on 16/6/4.
//  Copyright © 2016年 上海赛可电子商务有限公司. All rights reserved.
//

#import "UIView+BlurEffect.h"

@implementation UIView (BlurEffect)

- (void)blueEffectWithStyle:(UIBlurEffectStyle)style
{
    if ([[[UIDevice currentDevice] systemVersion] floatValue] < 8.0f)
    {
        NSAssert(YES, @"Only support iOS 8.0+");
        return;
    }
    
    UIVisualEffectView *effectview = [[UIVisualEffectView alloc] initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleLight]];
    effectview.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    [self addSubview:effectview];
}

@end
