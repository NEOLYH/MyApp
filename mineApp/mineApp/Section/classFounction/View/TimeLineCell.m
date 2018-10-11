//
//  TimeLineCell.m
//  mineApp
//
//  Created by mac1 on 16/8/19.
//  Copyright © 2016年 陆玉洪. All rights reserved.
//

#define kCCellIdentifier_Time @"TimeCell"

#import "TimeLineCell.h"
#import "Masonry.h"

@interface TimeLineCell()

@property(nonatomic, strong) UIImageView * image;

@property(nonatomic, strong) UIView * topLine;

@property(nonatomic, strong) UIView * bottumLine;

@property(nonatomic, strong) UIImageView * timeImage;

@property(nonatomic, strong) UIImageView * backImage;

@property(nonatomic, strong) UILabel * contentLine;

@end

@implementation TimeLineCell

-(instancetype)initWithFrame:(CGRect)frame{
    
    self=[super initWithFrame:frame];
    
    if (self) {
        
        [self configer];
        
    }
    
    return self;
}

-(void)configer{
    
    if(!_image){
        
        _image=[[UIImageView alloc] initWithFrame:CGRectZero];
        
        [self.contentView addSubview:_image];
        
        [_image mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.size.mas_equalTo(CGSizeMake(40, 40));
            make.left.with.offset(10);
            make.centerY.mas_equalTo(self.contentView.mas_centerY);
           
        }];
        
        _image.image=[UIImage imageNamed:@"coding_emoji_20"];
        
        
    }
    
    
}

+(CGFloat)cellHeight{
    
    return 60;
    
}
@end
