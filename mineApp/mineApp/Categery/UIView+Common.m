//
//  UIView+Common.m
//  mineApp
//
//  Created by mac1 on 16/7/29.
//  Copyright © 2016年 陆玉洪. All rights reserved.
//

#import "UIView+Common.h"
#import <objc/runtime.h>
static char LoadingViewKey;

@implementation UIView (Common)

-(void)setX:(CGFloat)x{
    
    
    CGRect frame= self.frame;
    frame.origin.x=x;
    self.frame=frame;
}

-(void)setY:(CGFloat)y{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

-(void)setWidth:(CGFloat)width{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

-(void)setHeight:(CGFloat)height{
    
    CGRect frame = self.frame;
    frame.size.width = height;
    self.frame = frame;
}

-(void)setCenter_X:(CGFloat)Center_X{
    
    CGPoint Center=self.center;
    
    Center.x=Center_X;
    
    self.center=Center;
}

-(void)setCenter_Y:(CGFloat)Center_Y{
    
    CGPoint Center=self.center;
    
    Center.y=Center_Y;
    
    self.center=Center;
}

-(void)setSize:(CGSize)size{
   
    CGRect frame=self.frame;
    
    frame.size=size;
    
    self.frame= frame;
    
}

-(void)setRight:(CGFloat)right{
    
    self.x=self.right-self.width;
    
}

-(void)setButtom:(CGFloat)buttom{
    
    self.y=self.buttom-self.height;
}

-(CGFloat)x{
    
    return self.frame.origin.x;
}

-(CGFloat)y{
    
    return self.frame.origin.y;
}

-(CGFloat)width{
    
    return self.frame.size.width;
}

-(CGFloat)height{
    
    return  self.frame.size.height;
}

-(CGFloat)Center_X{
    
    return self.center.x;
}

-(CGFloat)Center_Y{
    
    return self.center.y;
}

-(CGSize)size{
    
    return self.frame.size;
}

-(CGFloat)right{
    
    return CGRectGetMaxX(self.frame);
}

-(CGFloat)buttom{
    
    return CGRectGetMaxY(self.frame);
}

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
