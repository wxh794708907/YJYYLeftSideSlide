//
//  ViewController.m
//  YJYYSideViewController
//
//  Created by 遇见远洋 on 16/9/1.
//  Copyright © 2016年 遇见远洋. All rights reserved.
//

#import "ViewController.h"
#import "YJYYSideView.h"
#import "YJYYNavViewController.h"
#import "YJYYViewController.h"
#define topValue 64
#define leftMenuW 150


@interface ViewController ()<YJYYLeftMenuDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    YJYYNavViewController * navController = [[YJYYNavViewController alloc]initWithRootViewController:[[YJYYViewController alloc]init]];
    [self addChildViewController:navController];
    self.view.backgroundColor = [UIColor greenColor];
    //添加左右两侧栏
    YJYYSideView * sideView = [[YJYYSideView alloc]initWithFrame:CGRectMake(0, topValue, leftMenuW, self.view.bounds.size.height - topValue * 2)];
    sideView.delegate = self;

    [self.view addSubview:sideView];
    [self.view addSubview:navController.view];
}


#pragma mark - HMLeftMenuDelegate
- (void)leftMenu:(YJYYSideView *)menu didSelectedButtonFromIndex:(NSInteger)fromIndex toIndex:(NSInteger)toIndex
{
    NSLog(@"点击了FromIndex %ld-----toIndex %ld",fromIndex,toIndex);
}


@end
