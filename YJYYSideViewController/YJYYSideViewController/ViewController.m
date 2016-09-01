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

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    YJYYNavViewController * navController = [[YJYYNavViewController alloc]initWithRootViewController:[[YJYYViewController alloc]init]];
    [self addChildViewController:navController];
    self.view.backgroundColor = [UIColor greenColor];
    //添加左右两侧栏
    YJYYSideView * sideView = [[YJYYSideView alloc]initWithFrame:CGRectMake(0, 64, 150, self.view.bounds.size.height - 128)];
    [self.view addSubview:sideView];
    [self.view addSubview:navController.view];
}

@end
