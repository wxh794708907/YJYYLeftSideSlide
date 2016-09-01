//
//  YJYYViewController.m
//  YJYYSideViewController
//
//  Created by 遇见远洋 on 16/9/1.
//  Copyright © 2016年 遇见远洋. All rights reserved.
//

#import "YJYYViewController.h"

@interface YJYYViewController ()
@property (assign,nonatomic)BOOL isScale;/**是否缩小*/


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
//    UITapGestureRecognizer * tapGes = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap:)];
    
    UIPanGestureRecognizer * panGes = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(pan:)];
    
//    [self.view addGestureRecognizer:tapGes];
    [self.view addGestureRecognizer:panGes];
}

- (void)tap:(UITapGestureRecognizer *)tapGes {
    
    [UIView animateWithDuration:0.25 animations:^{
        self.navigationController.view.frame = [UIScreen mainScreen].bounds;
    } completion:^(BOOL finished) {
        self.isScale = NO;
    }];
}

- (void)pan:(UIPanGestureRecognizer *)panGes {
    if (self.isScale) {
        [UIView animateWithDuration:0.25 animations:^{
            self.navigationController.view.frame = [UIScreen mainScreen].bounds;
        } completion:^(BOOL finished) {
            self.isScale = NO;
        }];
        return;
    }
//    self.isScale = YES;
    CGPoint  tansP = [panGes translationInView:self.view];
    NSLog(@"%@",NSStringFromCGPoint(tansP));
    CGFloat  x = tansP.x;
    if (tansP.x >= 0) {
        x = 150;
    }else if (tansP.x <= 0) {
        x = 0;
    }
    if (x == 0) {
        self.isScale = NO;
    }
    
    
    [UIView animateWithDuration:0.25 animations:^{
        self.navigationController.view.frame = CGRectMake(x, self.navigationController.view.frame.origin.y, self.navigationController.view.frame.size.width, self.navigationController.view.frame.size.height);
//        self.navigationController.view.transform = CGAffineTransformMakeScale(0.9, 0.9);
    } completion:^(BOOL finished) {
        
    }];
}


/** 返回操作 */
- (void)backbarbuttonDidClickEvent:(UIButton *)sender {
    if (self.isScale) {
        return;
    }
    [UIView animateWithDuration:0.25 animations:^{
        self.navigationController.view.frame = CGRectMake(150, 64, self.view.bounds.size.width, self.view.bounds.size.height - 128);
    } completion:^(BOOL finished) {
        self.isScale = YES;
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
