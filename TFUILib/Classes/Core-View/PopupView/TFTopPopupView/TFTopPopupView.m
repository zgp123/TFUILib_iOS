//
//  TFTopPopupView.m
//  AFPopup
//
//  Created by Alvaro Franco on 3/7/14.
//  Copyright (c) 2014 xiayiyong. All rights reserved.
//

#import "TFTopPopupView.h"
#import "UIView+Category.h"

@interface TFTopPopupView ()

@property (nonatomic, assign) TFTopPopupViewAnimateType type;

@property (nonatomic, strong) UIView *alertView;
@property (nonatomic, strong) UIView *blackgroundView;

@end

@implementation TFTopPopupView

- (instancetype)initWithPopupView:(UIView*)popupView andHeight:(CGFloat)height
{
    self = [super initWithFrame:CGRectZero];
    
    if (self)
    {
        self.frame=CGRectMake(0, 0, [[UIScreen mainScreen]bounds].size.width, [[UIScreen mainScreen]bounds].size.height);
        
        if (height<=0||height>[[UIScreen mainScreen]bounds].size.height)
        {
            height=[[UIScreen mainScreen]bounds].size.height;
        }
        
        UIViewAutoresizing autoresizingMask = UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleHeight |
        UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin |
        UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleWidth;

        
        self.blackgroundView = [[UIView alloc] initWithFrame:self.frame];
        self.blackgroundView.backgroundColor = HEXCOLOR(0X000008,0.5);
        self.blackgroundView.autoresizingMask = autoresizingMask;
        
        
        self.alertView = popupView;
        self.alertView.frame = CGRectMake(self.centerX-popupView.frame.size.width/2, 0, popupView.frame.size.width, popupView.frame.size.height);

        [self addSubview:self.blackgroundView];
        [self addSubview:self.alertView];
    }
    
    return self;
}

- (void)showWithAnimateType:(TFTopPopupViewAnimateType)type
{
    self.type=type;
    [self show];
}

-(void)show
{
    [[UIApplication sharedApplication].keyWindow addSubview:self];
    
    _alertView.frame = CGRectMake(-_alertView.frame.origin.x, -_alertView.frame.size.height, _alertView.frame.size.width, _alertView.frame.size.height);
    
    [UIView animateWithDuration:0.5
                          delay:0
                        options:UIViewAnimationOptionTransitionFlipFromTop
                     animations:^{
                         _alertView.frame = CGRectMake(-_alertView.frame.origin.x, 0, _alertView.frame.size.width, _alertView.frame.size.height);
                     }
                     completion:^(BOOL finished) {
                         
                     }];
}

-(void)hide
{
    
    [UIView animateWithDuration:0.5
                          delay:0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         _alertView.frame = CGRectMake(-_alertView.frame.origin.x, -_alertView.frame.size.height, _alertView.frame.size.width, _alertView.frame.size.height);
                     }
                     completion:^(BOOL finished) {
                         [self removeFromSuperview];
                     }];
}

@end
