//
//  YJYYViewController.m
//  YJYYSideViewController
//
//  Created by 遇见远洋 on 16/9/1.
//  Copyright © 2016年 遇见远洋. All rights reserved.
//

#import "YJYYViewController.h"
#define topValue 64
#define leftValue 150


@interface YJYYViewController ()

@end

@implementation YJYYViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor blueColor];
    
    [self setupNavigationTools];
    
    [self addGesture];
}

/**
 *  设置导航栏左右按钮
 */
- (void)setupNavigationTools {
    // 返回按钮
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [backButton setImage:[UIImage imageNamed:@"debunk_arrow_back_img"] forState:UIControlStateNormal];
    [backButton sizeToFit];
    [backButton addTarget:self action:@selector(backbarbuttonDidClickEvent:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backBarButton = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    self.navigationItem.leftBarButtonItem = backBarButton;
    self.title = @"导航";
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
}

- (void)addGesture {
    UITapGestureRecognizer * tapGes = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap:)];
    
    UIPanGestureRecognizer * panGes = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(pan:)];
    
    [self.view addGestureRecognizer:tapGes];
    [self.view addGestureRecognizer:panGes];
}

- (void)tap:(UITapGestureRecognizer *)tapGes {
    
    [UIView animateWithDuration:0.25 animations:^{
        self.navigationController.view.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
    }];
}

- (void)pan:(UIPanGestureRecognizer *)panGes {
    
    [self backbarbuttonDidClickEvent:nil];
}


/** 返回操作 */
- (void)backbarbuttonDidClickEvent:(UIButton *)sender {

    [UIView animateWithDuration:0.25 animations:^{
        // 缩放比例
        CGFloat navH = [UIScreen mainScreen].bounds.size.height - 2 * topValue;
        CGFloat scale = navH / [UIScreen mainScreen].bounds.size.height;
        
        // 菜单左边的间距
        CGFloat leftMenuMargin = [UIScreen mainScreen].bounds.size.width * (1 - scale) * 0.5;
        CGFloat translateX = leftValue - leftMenuMargin;
        
        CGFloat topMargin = [UIScreen mainScreen].bounds.size.height * (1 - scale) * 0.5;
        CGFloat translateY = topValue - topMargin;
        
        // 缩放
        CGAffineTransform scaleForm = CGAffineTransformMakeScale(scale, scale);
        // 平移
        CGAffineTransform translateForm = CGAffineTransformTranslate(scaleForm, translateX / scale, translateY / scale);
        
        self.navigationController.view.transform = translateForm;
        
    }];
}

@end
