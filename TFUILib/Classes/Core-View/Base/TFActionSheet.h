//
//  TFActionSheet.h
//  TFUILib
//
//  Created by xiayiyong on 16/2/3.
//  Copyright © 2016年 上海赛可电子商务有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TFView.h"

@class TFActionSheet;

typedef void(^ActionSheetBlock)(NSInteger buttonIndex);

@interface TFActionSheet : TFView

/**
 *  标题
 */
@property (nonatomic, copy) NSString *title;
/**
 *  点击回调
 */
@property (nonatomic, copy) ActionSheetBlock clickedBlock;

/**
 *  Default is [UIFont systemFontOfSize:18]
 */
@property (nonatomic, strong) UIFont *textFont;

/**
 *  Default is Black
 */
@property (nonatomic, strong) UIColor *textColor;

/**
 *  Default is 0.3 seconds
 */
@property (nonatomic, assign) CGFloat animationDuration;

/**
 *  Opacity of background, default is 0.3f
 */
@property (nonatomic, assign) CGFloat backgroundOpacity;

#pragma mark- show method

/**
 *  显示UIActionSheet
 *
 *  @param title                  视图标题
 *  @param cancelButtonTitle      取消按钮标题
 *  @param destructiveButtonTitle 特殊标记按钮标题  红色
 *  @param otherButtonTitles      其他按钮标题
 *  @param block                  按钮点击事件block
 */
+ (void) showWithTitle:(NSString *)title
     cancelButtonTitle:(NSString *)cancelButtonTitle
destructiveButtonTitle:(NSString *)destructiveButtonTitle
     otherButtonTitles:(NSArray *)otherButtonTitles
                 block:(void (^)(NSInteger buttonIndex))block;

/**
 *  显示UIActionSheet
 *
 *  @param title                  视图标题
 *  @param cancelButtonTitle      取消按钮标题
 *  @param otherButtonTitles      其他按钮标题
 *  @param block                  按钮点击事件block
 */
+ (void) showWithTitle:(NSString *)title
     cancelButtonTitle:(NSString *)cancelButtonTitle
     otherButtonTitles:(NSArray *)otherButtonTitles
                 block:(void (^)(NSInteger buttonIndex))block;

/**
 *  显示UIActionSheet
 *
 *  @param title                  视图标题
 *  @param cancelButtonTitle      取消按钮标题
 *  @param destructiveButtonTitle 特殊标记按钮标题  红色
 *  @param block                  按钮点击事件block
 */
+ (void) showWithTitle:(NSString *)title
     cancelButtonTitle:(NSString *)cancelButtonTitle
destructiveButtonTitle:(NSString *)destructiveButtonTitle
                 block:(void (^)(NSInteger buttonIndex))block;

/**
 *  UIActionSheet
 *
 *  @param title        标题
 *  @param buttonTitles 按钮数组
 *  @param block        按钮点击事件block
 */
+ (void) showWithTitle:(NSString *)title
          buttonTitles:(NSArray *)buttonTitles
                 block:(void (^)(NSInteger buttonIndex))block;

#pragma mark- init method
/**
 *  初始化
 *
 *  @param title                  标题
 *  @param cancelButtonTitle      取消按钮标题
 *  @param destructiveButtonTitle 特殊标记按钮标题
 *  @param otherButtonTitles      其他按钮标题
 *  @param block                  按钮点击事件block
 *
 *  @return
 */
- (instancetype)initWithTitle:(NSString *)title
            cancelButtonTitle:(NSString *)cancelButtonTitle
       destructiveButtonTitle:(NSString *)destructiveButtonTitle
            otherButtonTitles:(NSArray *)otherButtonTitles
                        block:(void (^)(NSInteger))block;

/**
 *  初始化
 *
 *  @param title                  标题
 *  @param cancelButtonTitle      取消按钮标题
 *  @param destructiveButtonTitle 特殊标记按钮标题
 *  @param block                  按钮点击事件block
 *
 *  @return
 */
- (instancetype)initWithTitle:(NSString *)title
            cancelButtonTitle:(NSString *)cancelButtonTitle
       destructiveButtonTitle:(NSString *)destructiveButtonTitle
                        block:(void (^)(NSInteger))block;

/**
 *  初始化
 *
 *  @param title                  标题
 *  @param cancelButtonTitle      取消按钮标题
 *  @param otherButtonTitles      其他按钮标题
 *  @param block                  按钮点击事件block
 *
 *  @return
 */
- (instancetype)initWithTitle:(NSString *)title
            cancelButtonTitle:(NSString *)cancelButtonTitle
            otherButtonTitles:(NSArray *)otherButtonTitles
                        block:(void (^)(NSInteger))block;

/**
 *  初始化
 *
 *  @param title                  标题
 *  @param buttonTitles           所有按钮标题
 *  @param block                  按钮点击事件block
 *
 *  @return
 */
- (instancetype)initWithTitle:(NSString *)title
                 buttonTitles:(NSArray *)buttonTitles
                        block:(void (^)(NSInteger))block;
@end
