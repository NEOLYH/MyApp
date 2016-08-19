//
//  userHeaderView.m
//  mineApp
//
//  Created by mac1 on 16/7/12.
//  Copyright © 2016年 陆玉洪. All rights reserved.
//

#import "userHeaderView.h"

@interface userHeaderView()

 

@property (strong, nonatomic) UILabel *userLabel;

 

@property (strong, nonatomic) UIView *splitLine, *coverView;


 



@property (nonatomic, copy) void(^tapAction)(id);

@end

@implementation userHeaderView

+ (id)userHeaderViewWithImageName:(NSString *)image frameX:(CGFloat)x frameY:(CGFloat)y frameM:(CGFloat)m frameZ:(CGFloat)z{
    
    if (!image) {
        return nil;
    }
    userHeaderView *headerView = [[userHeaderView alloc] initWithFrame:CGRectMake(x,y,m, z)];
    
    headerView.userInteractionEnabled = YES;
    
    headerView.contentMode = UIViewContentModeScaleAspectFill;
    
    
         
    [headerView configUI];
    
    return headerView;
}



- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (instancetype)init
{
    return [self initWithFrame:CGRectZero];
}

- (void)tap{
    
    if (self.tapAction) {
        
        self.tapAction(self);
    }
}

- (void)addTapBlock:(void(^)(id obj))tapAction{
    
    self.tapAction = tapAction;
    
    if (![self gestureRecognizers]) {
        self.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap)];
        [self addGestureRecognizer:tap];
    }
}

-(void)configUI{
    
    
     __weak typeof(self) weakSelf = self;
    
    //遮罩
    if(!_coverView){
       
        _coverView = [[UIView alloc] init];
        
        _coverView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.4];
        
        [self  addSubview:_coverView];
        
        [_coverView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(weakSelf);
        }];
        
        
        
        if (kDevice_Is_iPhone6Plus) {
            
            _userIconViewWith = 100;
            
        }else if (kDevice_Is_iPhone6){
            
            _userIconViewWith = 90;
            
        }else{
            
            _userIconViewWith = 75;
        }
        
        
        //人物头像
        if (!_userIconBtn) {
        
            _userIconBtn=[[UIButton alloc] initWithFrame:CGRectZero];
            
            [self addSubview:_userIconBtn];
            
            _userIconBtn.clipsToBounds=YES;

            [_userIconBtn mas_makeConstraints:^(MASConstraintMaker *make) {
               
                make.top.with.offset(30);
                make.centerX.mas_equalTo(weakSelf);
                make.size.mas_equalTo(CGSizeMake(_userIconViewWith, _userIconViewWith));
                
            }];
            
            NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
            
            NSData * str= [defaults objectForKey:@"image_data"];
            
            [defaults synchronize];
            
            if (str) {
                
                [_userIconBtn setBackgroundImage:[UIImage imageWithData:str] forState:UIControlStateNormal];
            }
             
            _userIconBtn.layer.cornerRadius=_userIconViewWith / 2;
            
            
            
        }
        
        //名称
        if(!_userLabel){
            
            _userLabel=[[UILabel alloc] initWithFrame:CGRectZero];
            
            [self addSubview:_userLabel];
            
            [_userLabel mas_makeConstraints:^(MASConstraintMaker *make) {
               
                make.top.mas_equalTo(_userIconBtn.mas_bottom).offset(15);
                make.centerX.mas_equalTo(weakSelf);
                
            }];
            
            _userLabel.text=@"Monn";
            
            _userLabel.textColor=[UIColor whiteColor];
            
        }
        
        
        if (!_splitLine) {
            
            _splitLine = [[UIView alloc] init];
            
            _splitLine.backgroundColor = [UIColor whiteColor];
            
            [self addSubview:_splitLine];
            
            [_splitLine mas_makeConstraints:^(MASConstraintMaker *make) {
                
                make.centerX.equalTo(self.mas_centerX);
                make.bottom.with.offset(-20);
                make.size.mas_equalTo(CGSizeMake(0.5, 15));
            }];
        }
        
        if (!_fansCountBtn) {
            
            _fansCountBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            
           _fansCountBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
            
            _fansCountBtn.titleLabel.text=@"粉丝";
            _fansCountBtn.titleLabel.textColor=[UIColor whiteColor];

            
            [self addSubview:_fansCountBtn];
            
            
            [_fansCountBtn mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(self.mas_left);
                make.right.equalTo(_splitLine.mas_left).offset(15);
                make.bottom.equalTo(self.mas_bottom).offset(-15);
            }];
            

        }
        
        if (!_followsCountBtn) {
            
            _followsCountBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            
            _followsCountBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
            
            [self addSubview:_followsCountBtn];
        }
        
        
        
         [_followsCountBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.mas_right);
            make.left.equalTo(_splitLine.mas_right).offset(15);
            make.height.equalTo(@[_fansCountBtn.mas_height]);
        }];
        
        
        
        
        

    }
    
    
}


@end
