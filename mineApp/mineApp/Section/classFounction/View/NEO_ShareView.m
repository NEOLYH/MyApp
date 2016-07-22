//
//  NEO_ShareView.m
//  popDemu
//
//  Created by mac1 on 16/7/22.
//  Copyright © 2016年 陆玉洪. All rights reserved.
//

#import "NEO_ShareView.h"

@interface NEO_ShareView ()

-(void)defalutInit;

//展现
-(void)fadeIn;

-(void)fadeOut;

@end

@implementation NEO_ShareView

@synthesize delegate = _delegate;


-(void)setDataSource:(id<NEO_ShareViewDataSource>)dataSource{
    
    _dataSource=dataSource;
}


-(void)setListView:(UITableView *)listView{
    
    _listView=listView;
    
}

-(id)initWithFrame:(CGRect)frame{
    
    self=[super initWithFrame:frame];
    if (self) {
        
        [self defalutInit];
    }
    
    return self;
}

-(void)defalutInit{
    
    self.layer.borderColor=[UIColor lightGrayColor].CGColor;
    self.layer.borderWidth=1.0f;
    self.layer.cornerRadius=5;
    self.clipsToBounds=YES;
    
    if (!_NEO_Lable) {
        
        _NEO_Lable=[[UILabel alloc] initWithFrame:CGRectZero];
        
        _NEO_Lable.font=[UIFont systemFontOfSize:17.0f];
        
        _NEO_Lable.backgroundColor=[UIColor colorWithRed:59./255.0 green:89./255.0 blue:152./255.0 alpha:1.0f];
        
        _NEO_Lable.textAlignment=NSTextAlignmentCenter;
        
        _NEO_Lable.textColor=[UIColor whiteColor];
        
        CGFloat xWidth=self.bounds.size.width;
        CGFloat xHeight=self.bounds.size.height;
        
        _NEO_Lable.lineBreakMode = UILineBreakModeTailTruncation;
        _NEO_Lable.frame = CGRectMake(0, 0, xWidth, 32.0f);
        [self addSubview:_NEO_Lable];
        
        CGRect tableFrame=CGRectMake(0, 32.f, xWidth, xHeight-32.f);
        
        _listView =[[UITableView alloc] initWithFrame:tableFrame style:UITableViewStylePlain];
        _listView.delegate=self;
        _listView.dataSource=self;
        
        [self addSubview:_listView];
        
        
        _NEO_Lay =[[UIControl alloc] initWithFrame:[UIScreen mainScreen].bounds];
        
        _NEO_Lay.backgroundColor=[UIColor colorWithRed:242./255.0 green:242/255.0 blue:242/255.0 alpha:1];
        
        [self addSubview:_NEO_Lay];
        
        [_NEO_Lay addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
        
    }
}


#pragma mark tableView delegate  datat source 

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if(_dataSource && [self.dataSource respondsToSelector:@selector( NEO_shareView:numberOfRowsInSection:)]){
       
        return [self.dataSource NEO_shareView:self numberOfRowsInSection:section];
    }
       return 0;
}


-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (_dataSource && [self.dataSource respondsToSelector:@selector(NEO_ShareView:cellForIndexPath:)]) {
        
        return [self.dataSource NEO_ShareView:self cellForIndexPath:indexPath];
    }
    return nil;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(self.delegate &&
       [self.delegate respondsToSelector:@selector(NEO_ShareView:heightForRowAtIndexPath:)])
    {
        return [self.delegate NEO_ShareView:self heightForRowAtIndexPath:indexPath];
    }
    
    return 0.0f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(self.delegate &&
       [self.delegate respondsToSelector:@selector(NEO_ShareView:heightForRowAtIndexPath:)])
    {
        [self.delegate Neo_ShareView:self didSelectIndexPath:indexPath];
    }
    
    [self dismiss];
}

#pragma mark animations


-(void)fadeIn{
    
    self.transform=CGAffineTransformMakeScale(1.1, 1.1);
    self.alpha=0;
    [UIView animateWithDuration:0.35 animations:^{
        
        self.alpha = 1;
        self.transform = CGAffineTransformMakeScale(1, 1);
        
    }];
}


-(void)fadeOut{
    
    
    [UIView animateWithDuration:.35 animations:^{
        
        self.transform=CGAffineTransformMakeScale(1.1, 1.1);
        self.alpha=0;
        
    } completion:^(BOOL finished) {
        
        if (finished) {
            
            [_NEO_Lay removeFromSuperview];
            [self removeFromSuperview];
        }
        
    }];
    
}

-(void)setTitle:(NSString *)title{
    
    _NEO_Lable.text=title;
}

-(void)show{
    
    UIWindow *keyWindow=[[UIApplication sharedApplication] keyWindow];
    
    [keyWindow addSubview:_NEO_Lay];

    [keyWindow addSubview:self];
    
    self.center = CGPointMake(keyWindow.bounds.size.width/2.0f,
                              keyWindow.bounds.size.height/2.0f);
    
    
    [self fadeIn];
}

-(void)dismiss{
    
    [self fadeOut];
}

@end
