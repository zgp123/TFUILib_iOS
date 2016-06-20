//
//  UIViewController+TFToast.m
//  TFUILib
//
//  Created by xiayiyong on 16/3/21.
//  Copyright © 2016年 上海赛可电子商务有限公司. All rights reserved.
//

#import "UIViewController+TFToast.h"
#import "UIViewController+Ext.h"
#import "TFToast.h"

@implementation UIViewController (TFToast)

#pragma mark toast

- (void)showToast:(NSString*)text
{
    [TFToast showWithText:text duration:2.5 atView:[[UIApplication sharedApplication] keyWindow] type:kToastTypeTop offsetY:64];
}

- (void)showToastWithText:(NSString*)text
{
    [TFToast showWithText:text duration:2.5 atView:[[UIApplication sharedApplication] keyWindow] type:kToastTypeTop offsetY:64];
}

@end
