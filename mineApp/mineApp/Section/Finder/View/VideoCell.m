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

@implementation VideoCell

-(instancetype)initWithFrame:(CGRect)frame{
    
    self=[super initWithFrame:frame];
    
    if(self){
        
        _img=[[UIImageView alloc] initWithFrame:CGRectZero];
        
        [self.contentView addSubview:_img];
        
        [_img mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.top.with.offset(0);
            make.left.with.offset(0);
            make.right.with.offset(0);
            make.bottom.with.offset(-20);
        }];
        
        //_img.backgroundColor=[UIColor redColor];
        
        
        _roomTitle =[[UILabel alloc] initWithFrame:CGRectZero];
        
        [self.contentView addSubview:_roomTitle];
        
        [_roomTitle mas_makeConstraints:^(MASConstraintMaker *make) {
            
            
            make.size.mas_equalTo(CGSizeMake(self.contentView.bounds.size.width, 20));
            make.left.with.offset(0);
            make.right.with.offset(0);
            make.bottom.with.offset(-20);

            
        }];
        
        _roomTitle.backgroundColor=[UIColor clearColor];
        _roomTitle.textColor=[UIColor whiteColor];
        
        _roomName=[[UILabel alloc] initWithFrame:CGRectZero];
        
        [self.contentView addSubview:_roomName];
        
        [_roomName mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.size.mas_equalTo(CGSizeMake(self.contentView.bounds.size.width, 20));
            make.left.with.offset(0);
            make.right.with.offset(0);
            make.bottom.with.offset(0);
            
        }];
        
        _roomName.backgroundColor=[UIColor blueColor];
        
        
    }
    
    return self;
    
}

-(void)setModel:(VedioModel *)model{
    
    _model=model;
    
    [_img sd_setImageWithURL:[NSURL URLWithString:_model.bpic]];
    
    _roomTitle.text = _model.title;
    
    _roomName.text = _model.nickname;
    
    _peopleNum.text= (_model.online.intValue >10000) ? [NSString stringWithFormat:@"%.1f万",(float)_model.online.intValue/10000] : [NSString stringWithFormat:@"%@",_model.online];

}


@end
