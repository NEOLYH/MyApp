//
//  NEO_ScrollMenu.h
//  mineApp
//
//  Created by mac1 on 16/8/22.
//  Copyright © 2016年 陆玉洪. All rights reserved.
//

#import <UIKit/UIKit.h>
@class NEO_ScrollMenu;

@protocol NEO_ScrollMenuDelegate <NSObject>

-(void)NEO_ScrollMenu:(NEO_ScrollMenu *)NEO_ScrollMenu didSelectTitleAtIndex:(NSInteger) index;

@end

@interface NEO_ScrollMenu : UIScrollView

@property(nonatomic, strong) NSArray *titleArr;

@property(nonatomic, strong) NSMutableArray * titleLableArr;

@property(nonatomic,weak) id<NEO_ScrollMenuDelegate> Mdelegate;

+(instancetype)NEO_ScrollViewWithFrame:(CGRect)frame;

/** 选中label标题的标题颜色改变以及指示器位置变化（只是为了让外界去调用）*/
- (void)selectLabel:(UILabel *)label;
/** 选中的标题居中（只是为了让外界去调用）*/
- (void)setupTitleCenter:(UILabel *)centerLabel;


@end
