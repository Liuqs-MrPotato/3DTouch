//
//  ViewController.m
//  3DTouch
//
//  Created by 刘全水 on 16/1/15.
//  Copyright © 2016年 刘全水. All rights reserved.
//

#import "ViewController.h"
#import "PreviewViewController.h"

#define screenW [UIScreen mainScreen].bounds.size.width

#define screenH [UIScreen mainScreen].bounds.size.height

#define peekW screenW / 2

@interface ViewController ()<UIViewControllerPreviewingDelegate>

@property(strong,nonatomic)UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    UIApplicationShortcutIcon *icon = [UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeCaptureVideo];
    NSDictionary *dict = @{@"message":@"来自图标，点击了第二个按钮"};
    UIApplicationShortcutItem *item = [[UIApplicationShortcutItem alloc]initWithType:@"two" localizedTitle:@"3DTouch第二个" localizedSubtitle: @"你点一下试试" icon:icon userInfo:dict];
    
    [UIApplication sharedApplication].shortcutItems = @[item];
    
    UIImageView *imageview = [[UIImageView alloc]initWithFrame:CGRectMake((screenW - peekW) / 2, (screenH - peekW) / 2, peekW, peekW)];
    imageview.userInteractionEnabled = YES;
    imageview.image = [UIImage imageNamed:@"dasini"];
    [self.view addSubview:imageview];
    [self registerForPreviewingWithDelegate:self sourceView:imageview];
}


- (UIViewController *)previewingContext:(id<UIViewControllerPreviewing>)context viewControllerForLocation:(CGPoint) location
{
    PreviewViewController *childVC = [[PreviewViewController alloc] init];
    UIImage *image = [UIImage sd_animatedGIFNamed:@"niubi"];
    CGFloat rate = image.size.height / image.size.width;
    CGFloat peekH = screenW * rate;
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, screenW, peekH)];
    imageView.backgroundColor = [UIColor whiteColor];
       imageView.image = image;
    [childVC.view addSubview:imageView];
    childVC.preferredContentSize = CGSizeMake(0.0f,peekH);
    CGRect rect = CGRectMake(0, 0, peekW, peekW);
    context.sourceRect = rect;
    self.imageView = imageView;
    return childVC;
}

-(void)previewingContext:(id<UIViewControllerPreviewing>)previewingContext commitViewController:(UIViewController *)viewControllerToCommit
{
    self.imageView.alpha = 1.0f;
    UIButton *view = [[UIButton alloc]initWithFrame:self.view.bounds];
    view.backgroundColor = [UIColor whiteColor];
    view.userInteractionEnabled = YES;
    self.imageView.frame = CGRectMake(0, (screenH - self.imageView.frame.size.height) / 2, self.imageView.frame.size.height, self.imageView.frame.size.height);
    [view addSubview:self.imageView];
    [self.view addSubview:view];
    [view addTarget:self action:@selector(viewClick:) forControlEvents:UIControlEventTouchUpInside];
    
}

-(void)viewClick:(UIButton *)btn
{
    [UIView animateWithDuration:0.2 animations:^{
      
        btn.alpha = 0.0f;
    }];
    
}


@end

