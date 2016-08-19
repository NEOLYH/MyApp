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

@property (strong, nonatomic) NEO_AlertView *loadingView;

- (void)beginLoading;
- (void)endLoading;

@end
