//
//  TFViewController.m
//  Treasure
//
//  Created by xiayiyong on 15/9/7.
//  Copyright (c) 2015年 上海赛可电子商务有限公司. All rights reserved.
//

#import "TFViewController.h"
#import "TFUICategory.h"
#import "TFUIUtil.h"

#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)

@interface TFViewController ()<UINavigationBarDelegate>

@property(nonatomic,strong)UIView *headView;

@property(nonatomic,strong)UIView *footView;

@property(nonatomic,strong)TFLoadingView *loadingView;

@end

@implementation TFViewController

#pragma mark- init

- (id)initWithResultBlock:(TFViewControllerResultBlock)block
{
    return [self initWithViewModel:nil resultBlock:block];
}

- (id)initWithViewModel:(id)viewModel
{
    return [self initWithViewModel:viewModel resultBlock:nil];
}

- (id)initWithViewModel:(id)viewModel resultBlock:(TFViewControllerResultBlock)block
{
    self = [super init];
    if (self)
    {
        // Initialization code
        _viewModel = viewModel;
        _resultBlock     = block;
    }
    
    return self;
}

- (id)initWithData:(NSDictionary*)data
{
    return [self initWithData:nil resultBlock:nil];
}

- (id)initWithData:(NSDictionary*)data resultBlock:(TFViewControllerResultBlock)block
{
    self = [super init];
    if (self)
    {
        // Initialization code
        _resultBlock=block;
        
        NSString *viewControllerClassName = NSStringFromClass([self class]);
        NSString *viewModelClassName      = [viewControllerClassName stringByReplacingOccurrencesOfString:@"ViewController" withString:@"ViewModel"];
        
        Class viewModel = NSClassFromString(viewModelClassName);
        if (viewModel)
        {
            _viewModel = [viewModel mj_objectWithKeyValues:data];
        }
    }
    
    return self;
}

- (id)initWithViewModel:(id)viewModel
                nibName:(NSString *)nibName
                 bundle:(NSBundle *)bundle
            resultBlock:(TFViewControllerResultBlock)block
{
    self = [super initWithNibName:nibName bundle:bundle];
    if (self)
    {
        // Initialization code
        _viewModel = viewModel;
        _resultBlock     = block;
    }

    return self;
}

- (id)initWithViewModel:(id)viewModel
                nibName:(NSString *)nibName
                 bundle:(NSBundle *)bundle
{
    self = [super initWithNibName:nibName bundle:bundle];
    if (self == nil) return nil;

    _viewModel = viewModel;

    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        // Custom initialization
        
    }
    
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //[self.navigationController.view sendSubviewToBack:self.navigationController.navigationBar];
    //self.view.backgroundColor = [UIColor clearColor];
    
    [self initBackButton];
    
    if ([self.viewModel respondsToSelector:@selector(title)])
    {
        if ([self.viewModel title] != nil)
        {
            [self initTitle:[self.viewModel title]];
        }
    }
    
    //statusbar改白色
    //[[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    //self.edgesForExtendedLayout = UIRectEdgeNone;
    self.automaticallyAdjustsScrollViewInsets           = YES;
    self.navigationController.navigationBar.translucent = NO;
    
    [self initViews];
    [self autolayoutViews];
    [self bindData];
}

#pragma mark- 控制状态栏的样式

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleDefault;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

#pragma mark- init autolayout bind

- (void)initViews
{

}

- (void)autolayoutViews
{
    
}

- (void)bindData
{
    
}

#pragma mark load data

- (void)startLoadData
{
    
}

- (void)endLoadData
{
    [self hideHud];
}

-(void)showCustomNaviBar:(TFView *)customNaviBar
{
    self.customNaviBarView = customNaviBar;
    
    UIView *view = [self findInView:self.navigationController.navigationBar withName:@"_UINavigationBarBackground"];
    [view addSubview:self.customNaviBarView];
    self.customNaviBarView.alpha = 0;
    [UIView animateWithDuration:0.25
                     animations:^{
                         self.customNaviBarView.alpha = 1;
                     }];

}

-(void)hideCustomNaviBar
{
    [UIView animateWithDuration:0.25
                     animations:^{
                         self.customNaviBarView.alpha = 0;
                     } completion:^(BOOL finished) {
                         [self.customNaviBarView removeFromSuperview];
                     }];
}

#pragma mark- setter getter

- (id)viewModel
{
    if (_viewModel == nil)
    {
        NSString *viewControllerClassName = NSStringFromClass([self class]);
        NSString *viewModelClassName      = [viewControllerClassName stringByReplacingOccurrencesOfString:@"ViewController" withString:@"ViewModel"];
        
        Class viewModel = NSClassFromString(viewModelClassName);
        if (viewModel)
        {
            _viewModel = [[viewModel alloc]init];
        }
    }

    return _viewModel;
}

#pragma mark - privite method -

-(UIView *)findInView:(UIView *)aView withName:(NSString *)name
{
    Class cl = [aView class];
    NSString *desc = [cl description];
    
    if ([name isEqualToString:desc])
    {
        return aView;
    }
    
    for (NSUInteger i = 0; i < [aView.subviews count]; i++)
    {
        UIView *subView = [aView.subviews objectAtIndex:i];
        subView = [self findInView:subView withName:name];
        if (subView)
        {
            return subView;
        }
    }
    return nil;
}

@end

