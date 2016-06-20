//
//  UITextField+LimitLength.h
//  TextLengthLimitDemo
//
//  Created by xiayiyong on 15/7/1.
//  Copyright (c) 2015年 上海赛可电子商务有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (LimitLength)

/**
 *  限制输入框可输入的字符串长度
 *
 *  @param length 
 */
- (void)limitTextLength:(int)length;

@end
