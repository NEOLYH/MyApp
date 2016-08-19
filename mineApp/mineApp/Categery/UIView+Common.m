//
//  UIView+Common.m
//  mineApp
//
//  Created by mac1 on 16/7/29.
//  Copyright © 2016年 陆玉洪. All rights reserved.
//

#import "UIView+Common.h"
#import <objc/runtime.h>
static char LoadingViewKey, BlankPageViewKey;

@implementation UIView (Common)

- (void)setLoadingView:(NEO_AlertView *)loadingView{
    [self willChangeValueForKey:@"LoadingViewKey"];
    objc_setAssociatedObject(self, &LoadingViewKey,
                             loadingView,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self didChangeValueForKey:@"LoadingViewKey"];
}

- (NEO_AlertView *)loadingView{
    return objc_getAssociatedObject(self, &LoadingViewKey);
}
- (void)beginLoading{
    
//    for (UIView *aView in [self.blankPageContainer subviews]) {
//        if ([aView isKindOfClass:[NEO_AlertView class]] && !aView.hidden) {
//            return;
//        }
//    }
    if (!self.loadingView) { //初始化LoadingView
        self.loadingView = [[NEO_AlertView alloc] initWithFrame:self.bounds];
    }
    [self addSubview:self.loadingView];
    [self.loadingView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.self.edges.equalTo(self);
    }];
    [self.loadingView startAnimating];
}
- (void)endLoading{
    
    if (self.loadingView) {
        [self.loadingView stopAnimating];
    }
}

@end
