//
//  YJYYSideView.h
//  YJYYSideViewController
//
//  Created by 遇见远洋 on 16/9/1.
//  Copyright © 2016年 遇见远洋. All rights reserved.
//

#import <UIKit/UIKit.h>
@class YJYYSideView;

@protocol YJYYLeftMenuDelegate <NSObject>
@optional
- (void)leftMenu:(YJYYSideView *)menu didSelectedButtonFromIndex:(NSInteger)fromIndex toIndex:(NSInteger)toIndex;
@end
@interface YJYYSideView : UIView
@property (nonatomic, weak) id<YJYYLeftMenuDelegate> delegate;



@end
