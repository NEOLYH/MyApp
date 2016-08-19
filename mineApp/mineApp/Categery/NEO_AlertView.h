//
//  NEO_AlertView.h
//  mineApp
//
//  Created by mac1 on 16/7/14.
//  Copyright © 2016年 陆玉洪. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NEO_AlertView : UIView

@property (strong, nonatomic) UIImageView *loopView, *monkeyView;
@property (assign, nonatomic, readonly) BOOL isLoading;

- (void)startAnimating;
- (void)stopAnimating;

@end
