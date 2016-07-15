//
//  userHeaderView.h
//  mineApp
//
//  Created by mac1 on 16/7/12.
//  Copyright © 2016年 陆玉洪. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface userHeaderView : UIView

- (void)addTapBlock:(void(^)(id obj))tapAction;

@property (strong, nonatomic) UIImage *bgImage;

@property(nonatomic,strong) UIButton * userIconBtn;

@property (strong, nonatomic) UIButton *fansCountBtn, *followsCountBtn, *followBtn;

//用户头像的size
@property (assign, nonatomic) CGFloat userIconViewWith;

@property (nonatomic, copy) void (^userIconClicked)();
@property (nonatomic, copy) void (^fansCountBtnClicked)();
@property (nonatomic, copy) void (^followsCountBtnClicked)();
@property (nonatomic, copy) void (^followBtnClicked)();

+ (id)userHeaderViewWithImageName:(NSString *)image frameX:(CGFloat)x frameY:(CGFloat)y frameM:(CGFloat)m frameZ:(CGFloat)z;

@end
