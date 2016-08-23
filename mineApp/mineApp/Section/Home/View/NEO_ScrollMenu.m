//
//  NEO_ScrollMenu.m
//  mineApp
//
//  Created by mac1 on 16/8/22.
//  Copyright © 2016年 陆玉洪. All rights reserved.
//

#import "NEO_ScrollMenu.h"
#import "UIView+Common.h"

#define labelFontOfSize [UIFont systemFontOfSize:17]
#define neo_screenWidth [UIScreen mainScreen].bounds.size.width

/** label之间的间距 */
#define  labelMargin 15;
/** 指示器的高度 */
#define  indicatorHeight 3;
/** 形变的度数 */
#define  radio  1.0;

@interface NEO_ScrollMenu()

@property (nonatomic, strong) UILabel *titleLabel;
/** 选中时的label */
@property (nonatomic, strong) UILabel *selectedLabel;
/** 指示器 */
@property (nonatomic, strong) UIView *indicatorView;

@end

@implementation NEO_ScrollMenu

-(NSMutableArray *)titleLableArr{
    
    if (_titleLableArr ==nil) {
    
        _titleLableArr=[NSMutableArray new];
    }
    return _titleLableArr;
}

-(instancetype)initWithFrame:(CGRect)frame{
    
    self=[super initWithFrame:frame];
    
    if (self) {
        
        self.backgroundColor=[UIColor colorWithWhite:1.0 alpha:0.9];
        self.showsHorizontalScrollIndicator = NO;
        self.bounces = NO;
    }
    return self;
}

+(instancetype)NEO_ScrollViewWithFrame:(CGRect)frame{
    
    return [[self alloc] initWithFrame:frame];
}

//设置文字大小
- (CGSize)sizeWithText:(NSString *)text font:(UIFont *)font maxSize:(CGSize)maxSize {
 
    NSDictionary *attrs = @{NSFontAttributeName : font};
    return [text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
    
}

-(void)setTitleArr:(NSArray *)titleArr{
    
    _titleArr=titleArr;
    
    
    /** 创建标题Label */
    CGFloat labelX = 0;
    CGFloat labelY = 0;
    CGFloat labelH = self.frame.size.height - indicatorHeight;
    
    for (NSInteger i=0; i< self.titleArr.count; i++) {
        
        _titleLabel=[[UILabel alloc] init];
        
        _titleLabel.userInteractionEnabled=YES;
        
        _titleLabel.text=_titleArr[i];
        
        _titleLabel.highlightedTextColor=[UIColor redColor];
        
        _titleLabel.tag=i;
        
        _titleLabel.textAlignment=NSTextAlignmentCenter;
        
        CGSize lableSize=[self sizeWithText:_titleLabel.text font:labelFontOfSize maxSize:CGSizeMake(MAXFLOAT, labelH)];
        
        //计算内容宽度
        
        CGFloat labelW=lableSize.width + 2 * labelMargin;
        
        _titleLabel.frame=CGRectMake(labelX, labelY, labelW, labelH);
        
        labelX=labelX+ labelW;
        
        [self.titleLableArr addObject:_titleLabel];
        
        //添加手势
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(titleClick:)];
        [_titleLabel addGestureRecognizer:tap];
        
        // 默认选中第0个label
        if (i == 0) {
            [self titleClick:tap];
        }
        
        [self addSubview:_titleLabel];

    }
    
    
    //srollView长度
    
    CGFloat scrollViewWidth =CGRectGetMaxX(self.subviews.lastObject.frame);
    self.contentSize=CGSizeMake(scrollViewWidth, self.frame.size.height);
    
    UILabel * firstLable=self.subviews.firstObject;
    
    // 添加指示器
    self.indicatorView = [[UIView alloc] init];
    _indicatorView.backgroundColor = [UIColor redColor];
    _indicatorView.height = 3;
    _indicatorView.y = self.frame.size.height - 3;
    [self addSubview:_indicatorView];
    
    
    // 立刻根据文字内容计算第一个label的宽度
    _indicatorView.width = firstLable.width - 2 * labelMargin;
    _indicatorView.Center_X = firstLable.Center_X;
    
}


-(void)titleClick:(UITapGestureRecognizer *) tap{
    
    // 0.获取选中的label
    UILabel *selLabel = (UILabel *)tap.view;
    
    // 1.标题颜色变成红色,设置高亮状态下的颜色， 以及指示器位置
    [self selectLabel:selLabel];
    
    // 2.让选中的标题居中
    [self setupTitleCenter:selLabel];
    
    
    NSInteger index = selLabel.tag;
    if ([self.Mdelegate respondsToSelector:@selector(NEO_ScrollMenu:didSelectTitleAtIndex:)]) {
        [self.Mdelegate NEO_ScrollMenu:self didSelectTitleAtIndex:index];
    }
}

/** 选中label标题颜色变成红色以及指示器位置 */
- (void)selectLabel:(UILabel *)label {
    // 取消高亮
    _selectedLabel.highlighted = NO;
    // 取消形变
    _selectedLabel.transform = CGAffineTransformIdentity;
    // 颜色恢复
    _selectedLabel.textColor = [UIColor blackColor];
    
    // 高亮
    label.highlighted = YES;
    // 形变
    label.transform = CGAffineTransformMakeScale(1.0, 1.0);
    
    _selectedLabel = label;
    
    // 改变指示器位置
    [UIView animateWithDuration:0.20 animations:^{
        self.indicatorView.width = label.width - 2 * labelMargin;
        self.indicatorView.Center_X = label.Center_X;
    }];
}

/** 设置选中的标题居中 */
- (void)setupTitleCenter:(UILabel *)centerLabel {
    // 计算偏移量
    CGFloat offsetX = centerLabel.center.x - neo_screenWidth * 0.5;
    
    if (offsetX < 0) offsetX = 0;
    
    // 获取最大滚动范围
    CGFloat maxOffsetX = self.contentSize.width - neo_screenWidth;
    
    if (offsetX > maxOffsetX) offsetX = maxOffsetX;
    
    // 滚动标题滚动条
    [self setContentOffset:CGPointMake(offsetX, 0) animated:YES];
}




@end
