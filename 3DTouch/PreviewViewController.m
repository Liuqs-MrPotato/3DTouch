//
//  PreviewViewController.m
//  3DTouch
//
//  Created by 刘全水 on 16/1/18.
//  Copyright © 2016年 刘全水. All rights reserved.
//

#import "PreviewViewController.h"

@interface PreviewViewController ()<UIPreviewActionItem>

@end

@implementation PreviewViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (NSArray<id<UIPreviewActionItem>> *)previewActionItems;
{
    UIPreviewAction *p1 =[UIPreviewAction actionWithTitle:@"收藏" style:UIPreviewActionStyleDefault handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {/*点击后的操作*/}];
    
    UIPreviewAction *p2 =[UIPreviewAction actionWithTitle:@"分享" style:UIPreviewActionStyleDefault handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {/*点击后的操作*/}];
    
    UIPreviewAction *p3 =[UIPreviewAction actionWithTitle:@"转发" style:UIPreviewActionStyleDefault handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {/*点击后的操作*/}];
    
    UIPreviewAction *p4 =[UIPreviewAction actionWithTitle:@"删除" style:UIPreviewActionStyleDestructive handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {/*点击后的操作*/}];
    
    NSArray *actions = @[p1,p2,p3,p4];
    
    return actions;
}



@end
