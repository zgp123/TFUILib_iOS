//
//  MasonyUtil.h
//  Treasure
//
//  Created by xiayiyong on 15/8/5.
//  Copyright (c) 2015年 上海赛可电子商务有限公司. All rights reserved.
//
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

/**
 push pop present到rootViewController;
 */
#pragma mark - push
/**
 *  页面跳转
 *
 *  @param vc
 */
void tf_pushViewController(UIViewController *vc);

#pragma mark - pop
/**
 *  页面返回
 *
 *  @param vc
 */
void tf_popToViewController(UIViewController *vc);
void tf_popToViewControllerWithClassName(NSString *className);
void tf_popViewController();
void tf_popToRootViewController();

#pragma mark - present dismiss
/**
 *  页面presente
 *
 *  @param vc
 */
void tf_presentViewController(UIViewController *vc);

#pragma mark - RootViewController
/**
 *  获取根视图
 *
 *  @return
 */
UIViewController *tf_getRootViewController();
UIView *tf_getRootView();

#pragma mark - toast
void tf_showToast(NSString *text);
void tf_showToastWithText(NSString *text);

@interface TFUIUtil : NSObject

@end
