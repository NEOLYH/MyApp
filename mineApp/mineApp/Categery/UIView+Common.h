//
//  UIView+Common.h
//  mineApp
//
//  Created by mac1 on 16/7/29.
//  Copyright © 2016年 陆玉洪. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NEO_AlertView.h"

@interface UIView (Common)

@property(nonatomic, assign) CGFloat x;

@property(nonatomic, assign) CGFloat y;

@property(nonatomic, assign) CGFloat width;

@property(nonatomic, assign) CGFloat height;

@property(nonatomic, assign) CGFloat Center_X;

@property(nonatomic, assign) CGFloat Center_Y;

@property(nonatomic, assign) CGSize size;

@property(nonatomic, assign) CGFloat right;

@property(nonatomic, assign) CGFloat buttom;

@property(nonatomic, strong) NEO_AlertView *loadingView;

- (void)beginLoading;
- (void)endLoading;

/** 在分类中声明@property， 只会生成方法的声明， 不会生成方法的实现和带有_线成员变量 */

@end
