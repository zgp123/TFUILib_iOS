//
//  TFScrollActionSheet.h
//  TFScrollActionSheet
//
//  Created by weizhou on 12/27/14.
//  Copyright (c) 2014 xiayiyong. All rights reserved.
//  https://github.com/dopcn/DOPScrollableActionSheet
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "TFView.h"

@class TFScrollActionSheetItem;

@interface TFScrollActionSheet : TFView

/**
 *  初始化一个可现实多行的滚动的actionsheet
 *
 *  @param cancelButtonTitle 取消按钮文字
 *  @param actions
 *
 *  @return
 */
- (instancetype)initWithCancelButtonTitle:(NSString*)cancelButtonTitle items:(NSArray *)actions;

/**
 *  显示试图
 */
- (void)show;

/**
 *  隐藏试图
 */
- (void)dismiss;

@end

#pragma mark - TFScrollActionSheetItem

@interface TFScrollActionSheetItem : NSObject

@property (nonatomic, copy) NSString *icon;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) void(^handler)(void);

/**
 *  初始化item
 *
 *  @param title   标题
 *  @param icon    图标
 *  @param handler 点击事件的处理
 *
 *  @return
 */
- (instancetype)initWithTitle:(NSString *)title
                         icon:(NSString *)icon
                      handler:(void(^)(void))handler;

@end