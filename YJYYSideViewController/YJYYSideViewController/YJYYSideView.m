//
//  YJYYSideView.m
//  YJYYSideViewController
//
//  Created by 遇见远洋 on 16/9/1.
//  Copyright © 2016年 遇见远洋. All rights reserved.
//

#import "YJYYSideView.h"

@interface YJYYSideView ()
@property (copy,nonatomic)NSArray * titles;/**<标题数组*/
@property (copy,nonatomic)NSMutableArray * btnsArray;/**<按钮数组*/

@end

@implementation YJYYSideView


- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor cyanColor];
        [self addLeftButtons];
    }
    return self;
}

- (void)addLeftButtons {
    for (int i = 0 ; i < 5; i++) {
        UIButton * btn = [UIButton new];
        [btn setTitle:self.titles[i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        btn.backgroundColor = [UIColor greenColor];
        btn.tag = i;
        [self addSubview:btn];
        [self.btnsArray addObject:btn];
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self.btnsArray enumerateObjectsUsingBlock:^(UIButton  * btn, NSUInteger idx, BOOL * _Nonnull stop) {
        CGFloat height = self.bounds.size.height / 5.0;
        btn.frame = CGRectMake(0, idx * height, self.bounds.size.width, height);
    }];
}

- (NSMutableArray *)btnsArray {
    if (!_btnsArray) {
        _btnsArray = [NSMutableArray array];
    }
    return _btnsArray;
}


- (NSArray *)titles {
    if (!_titles) {
        _titles = @[@"刚哥",@"佳哥",@"老司机",@"超哥",@"轩哥"];
    }
    return _titles;
}

@end
