//
//  VideoCell.m
//  mineApp
//
//  Created by mac1 on 16/7/9.
//  Copyright © 2016年 陆玉洪. All rights reserved.
//

#import "VideoCell.h"
#import <Masonry.h>
#import "UIImageView+WebCache.h"
@interface VideoCell()

//主播名称
@property(nonatomic, strong) UILabel * roomName;

@end
@implementation VideoCell

-(instancetype)initWithFrame:(CGRect)frame{
    
    self=[super initWithFrame:frame];
    
    if(self){
        //_img = [[UIImageView alloc] initWithFrame:CGRectZero];
        [self.contentView addSubview:self.img];
        [self.contentView addSubview:self.roomTitle];
        [self.contentView addSubview:self.roomName];
        
        [_img mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.with.offset(0);
            make.left.with.offset(0);
            make.right.with.offset(0);
            make.bottom.with.offset(-20);
        }];
        
        [_roomTitle mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(self.contentView.bounds.size.width, 20));
            make.left.with.offset(0);
            make.right.with.offset(0);
            make.bottom.with.offset(-20);
        }];
        [_roomName mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(self.contentView.bounds.size.width, 20));
            make.left.with.offset(0);
            make.right.with.offset(0);
            make.bottom.with.offset(0);
        }];
        
        self.contentView.backgroundColor = [UIColor whiteColor];
        
        //_roomTitle.backgroundColor=[UIColor blackColor];
        _roomTitle.textColor=[UIColor blackColor];
        
       
        _roomName.textColor=[UIColor whiteColor];
        _roomName.backgroundColor=[UIColor blueColor];
    }
    
    return self;
    
}

-(void)setModel:(VedioModel *)model{
    
    _model=model;
    
    [_img sd_setImageWithURL:[NSURL URLWithString:_model.bpic]];
    //[_img sd_setHighlightedImageWithURL:[NSURL URLWithString:_model.bpic] options:SDWebImageHighPriority];
    
    _roomTitle.text = _model.title;
    
    _roomName.text = _model.nickname;
    
    _peopleNum.text= (_model.online.intValue >10000) ? [NSString stringWithFormat:@"%.1f万",(float)_model.online.intValue/10000] : [NSString stringWithFormat:@"%@",_model.online];

}
#pragma mark - lazy loading
-(UIImageView *)img{
    if (!_img) {
        _img = [[UIImageView alloc] initWithFrame:self.contentView.frame];
    }
    return _img;
}

-(UILabel *)roomTitle{
    if (!_roomTitle) {
        _roomTitle =[[UILabel alloc] init];
    }
    return _roomTitle;
}

-(UILabel *)roomName{
    if (!_roomName) {
       _roomName =[[UILabel alloc] init];
    }
    return _roomName;
}

@end
