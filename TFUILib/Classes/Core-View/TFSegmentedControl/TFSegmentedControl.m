//
//  TFSegmentedControl.m
//  Treasure
//
//  Created by xiayiyong on 16/1/15.
//  Copyright © 2016年 上海赛可电子商务有限公司. All rights reserved.
//

#import "TFSegmentedControl.h"
#import <TFBaseLib.h>
#import <Masonry.h>
#import "UIView+Category.h"

@interface TFSegmentedControl ()

@property (nonatomic, strong) UIView *upView;

@property (nonatomic, strong) UIView *lineView;

@property (nonatomic, strong) NSArray *imageNormelArr;

@property (nonatomic, strong) NSArray *imageSelectArr;


@end

@implementation TFSegmentedControl

#pragma mark ---init

- (id)initWithTitles:(NSArray *)titleArr block:(TFSegmentedControlTouchBlock)block
{
    if (self = [self initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 44)
                            titles:titleArr
                             block:block])
    {
        
    }
    
    return self;
}

- (id)initWithFrame:(CGRect)frame
             titles:(NSArray *)titleArr
              block:(TFSegmentedControlTouchBlock)block
{
    if (self = [super initWithFrame:frame])
    {
        _selectedIndex          = 0;
        self.titleHeight        = frame.size.height;
        self.titleColor         = HEXCOLOR(0x333333, 1);
        self.titleSelectedColor = HEXCOLOR(0x03a9f4, 1);
        
        self.lineColor          = HEXCOLOR(0X03A9F4,  1);
        self.lineHeight         = 2;
        
        self.titleArr           = [self createTitleArr:titleArr];
        
        self.block              = block;
        
        [self initViews];
        [self autolayoutViews];
        [self bindData];
    }
    
    return self;
}

- (id)initWithFrame:(CGRect)frame
     imageNormelArr:(NSArray *)imageNormelArr
     imageSelectArr:(NSArray *)imageSelectArr
              block:(TFSegmentedControlTouchBlock)block;
{
    if (self = [super initWithFrame:frame])
    {
        _selectedIndex          = 0;
        self.titleHeight        = frame.size.height;
        self.titleColor         = HEXCOLOR(0x333333, 1);
        self.titleSelectedColor = HEXCOLOR(0x03a9f4, 1);
        
        self.lineColor          = HEXCOLOR(0X03A9F4,  1);
        self.lineHeight         = 2;
        
        self.imageNormelArr = imageNormelArr;
        self.imageSelectArr = imageSelectArr;
        self.block              = block;
        self.titleArr = [self createTitleArr:nil];
        
        [self initViews];
        [self autolayoutViews];
        [self bindData];
        
    }
    
    return self;
}

- (void) initViews
{
    self.clipsToBounds=YES;
    
    self.upView = [[UIView alloc] init];
    self.upView.clipsToBounds=YES;
    [self addSubview:self.upView];
    
    self.lineView = [[UIView alloc] init];
    [self.lineView setBackgroundColor:self.lineColor];
    [self addSubview:self.lineView];
}

-(void)autolayoutViews
{
    WS(weakSelf)
    
    NSInteger count = self.titleArr.count;
    
    // 上面的一排按钮
    [self.upView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.mas_left);
        make.top.equalTo(weakSelf.mas_top);
        make.right.equalTo(weakSelf.mas_right);
        make.bottom.equalTo(weakSelf.mas_bottom);
    }];
    
    [self horizontalWidthViews:self.titleArr inView:self.upView viewPadding:0 containerPadding:0];
    
    // 中间的线条
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.mas_left);
        make.top.equalTo(weakSelf.upView.mas_bottom).offset(-weakSelf.lineHeight);
        make.width.equalTo(weakSelf.mas_width).multipliedBy(1.0/count);
        make.height.equalTo(@(weakSelf.lineHeight));
    }];
    
    if (count > 0)
    {
        self.selectedIndex = 0;
    }
}

-(void)bindData
{
    
}

- (void)select:(NSInteger)page
{
    _selectedIndex = page;
    NSInteger count = self.titleArr.count;
    for (int i = 0; i < count; i ++)
    {
        UIButton *btn = self.titleArr[i];
        [btn setTitleColor:page == btn.tag?self.titleSelectedColor:self.titleColor forState:UIControlStateNormal];
        if (page == btn.tag)
        {
            btn.selected = YES;
        }
        else
        {
            btn.selected = NO;
        }
    }
    
    int left=self.lineView.width*page;
    
    [self.lineView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@(left));
    }];
    
    // 告诉self.view约束需要更新
    [self setNeedsUpdateConstraints];
    
    // 调用此方法告诉self.view检测是否需要更新约束，若需要则更新，下面添加动画效果才起作用
    [self updateConstraintsIfNeeded];
    
    //    [UIView animateWithDuration:0.3 animations:^{
    
    [self layoutIfNeeded];
    //    }];
    
    if (self.block)
    {
        UIButton *btn = self.titleArr[page];
        self.block(btn.titleLabel.text, page);
    }
}

-(void)clickedButton:(UIButton*)sender
{
    [self select:sender.tag];
}

-(NSMutableArray*)createTitleArr:(NSArray*)arr
{
    NSMutableArray *tmpArr = [[NSMutableArray alloc]init];
    
    NSInteger count = arr.count;
    if (arr.count == 0)
    {
        count = self.imageSelectArr.count;
    }
    for (int i = 0; i < count; i ++)
    {
        UIButton *btn = UIButton.new;
        
        btn.backgroundColor = [UIColor clearColor];
        if (arr)
        {
            [btn setTitle:arr[i] forState:UIControlStateNormal];
        }
        if (self.imageNormelArr.count>0)
        {
            [btn setImage:[UIImage imageNamed:self.imageNormelArr[i]] forState:UIControlStateNormal];
        }
        
        if (self.imageSelectArr)
        {
            
            [btn setImage:[UIImage imageNamed:self.imageSelectArr[i]] forState:UIControlStateSelected];
        }
        [btn setTitleColor:self.titleColor forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(clickedButton:) forControlEvents:UIControlEventTouchUpInside];
        
        if (i == 0)
        {
            btn.selected = YES;
        }
        
        btn.tag = i;
        btn.titleLabel.font = FONT_BY_PIXEL(26, 28 , 42);
        
        [tmpArr addObject:btn];
    }
    
    return tmpArr;
}

#pragma mark ---setter getter
-(void)setTitleColor:(UIColor *)titleColor
{
    _titleColor = titleColor;
    
    for (int i = 0; i < self.titleArr.count; i ++)
    {
        UIButton *btn = self.titleArr[i];
        if (self.selectedIndex != btn.tag)
        {
            [btn setTitleColor:self.titleColor forState:UIControlStateNormal];
        }
    }
}

-(void)setTitleSelectedColor:(UIColor *)titleSelectedColor
{
    _titleSelectedColor = titleSelectedColor;
    
    for (int i = 0; i < self.titleArr.count; i ++)
    {
        UIButton *btn = self.titleArr[i];
        if (self.selectedIndex == btn.tag)
        {
            [btn setTitleColor:self.titleSelectedColor forState:UIControlStateNormal];
            break;
        }
    }
}

-(void)setTitleFont:(UIFont *)titleFont
{
    _titleFont = titleFont;
    
    for (int i = 0; i < self.titleArr.count; i ++)
    {
        UIButton *btn = self.titleArr[i];
        if (self.selectedIndex != btn.tag)
        {
            [btn.titleLabel setFont:self.titleFont];
        }
    }
}

-(void)setTitleSelectedFont:(UIFont *)titleSelectedFont
{
    _titleSelectedFont = titleSelectedFont;
    
    for (int i = 0; i < self.titleArr.count; i ++)
    {
        UIButton *btn = self.titleArr[i];
        if (self.selectedIndex == btn.tag)
        {
            [btn.titleLabel setFont:self.titleSelectedColor];
        }
    }
}

-(void)setLineColor:(UIColor *)lineColor
{
    _lineColor = lineColor;
    self.lineView.backgroundColor = self.lineColor;
}

-(void)setLineHeight:(CGFloat)lineHeight
{
    _lineHeight = lineHeight;
    
    [self.lineView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@(_lineHeight));
    }];
}

- (void)setSelectedIndex:(NSInteger)selectedIndex
{
    _selectedIndex = selectedIndex;
    [self select:selectedIndex];
}

#pragma mark ---commonn method

/**
 *  将若干view等宽布局于容器containerView中
 *
 *  @param views         viewArray
 *  @param containerView 容器view
 *  @param containerPadding     距容器的左右边距
 *  @param viewPadding   各view的左右边距
 */
-(void)horizontalWidthViews:(NSArray *)views inView:(UIView *)containerView viewPadding:(CGFloat)viewPadding containerPadding:(CGFloat)containerPadding
{
    UIView *lastView;
    for (UIView *view in views)
    {
        [containerView addSubview:view];
        if (lastView)
        {
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.bottom.equalTo(containerView);
                make.left.equalTo(lastView.mas_right).offset(viewPadding);
                make.width.equalTo(lastView);
            }];
        }
        else
        {
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(containerView).offset(containerPadding);
                make.top.bottom.equalTo(containerView);
            }];
        }
        
        lastView = view;
    }
    
    [lastView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(containerView).offset(-containerPadding);
    }];
}

@end
