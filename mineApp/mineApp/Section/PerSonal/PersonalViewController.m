//
//  PersonalViewController.m
//  GITForCode
//
//  Created by mac1 on 16/6/23.
//  Copyright © 2016年 dfdsaf. All rights reserved.
//

#import "PersonalViewController.h"

@interface PersonalViewController ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong) UITableView * myTableView;

//头部试图
@property(nonatomic,strong) UIView * userHeaderView;

@property(nonatomic,strong) UIButton * userIconImg;

@property(nonatomic,strong) UILabel * userName;

@property (strong, nonatomic) UIButton *fansCountBtn, *followsCountBtn, *followBtn;

@property (strong, nonatomic) UIView *splitLine, *coverView;


@property (nonatomic, copy) void (^userIconClicked)();


@end

@implementation PersonalViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.title=@"我";
    
    [self.navigationItem setRightBarButtonItem:[[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"settingBtn_Nav"] style:UIBarButtonItemStylePlain target:self action:@selector(settingBtnClicked:)] animated:NO];
    
    [self.navigationItem setLeftBarButtonItem:[[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"addUserBtn_Nav"] style:UIBarButtonItemStylePlain target:self action:@selector(addUserBtnClicked:)] animated:NO];
    
    [self createTableView];
    
    
    [self configHeaderView];

}

-(void)configHeaderView{
    
    
    
    
    if(!_userHeaderView){
        
    _userHeaderView =[[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 270)];
    
    [self.view addSubview:_userHeaderView];
    
    }
    
    _userHeaderView.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"blankpage_image_Sleep"]];
    
    _userHeaderView.userInteractionEnabled = YES;
    _userHeaderView.contentMode = UIViewContentModeScaleAspectFill;
    

 
    
    
    if(!_coverView){
        
        _coverView=[[UIView alloc] initWithFrame:_userHeaderView.frame];
        
        _coverView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.4];
        
        [_userHeaderView addSubview:_coverView];
        
        

    }
    
        _myTableView.tableHeaderView=_userHeaderView;
    
    if (!_userIconImg) {
        
        _userIconImg=[[UIButton alloc] initWithFrame:CGRectZero];
        
    }
    
    [_userHeaderView addSubview:_userIconImg];
    
    [_userIconImg mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.with.offset(35);
        make.centerX.mas_equalTo(_userHeaderView);
        make.size.mas_equalTo(CGSizeMake(90, 90));
        
    }];
    
    _userIconImg.backgroundColor=[UIColor redColor];
    
    _userIconImg.layer.cornerRadius=45;
    
    
    __weak typeof(self) weakSelf = self;
    
    _userIconClicked=^(){
        
        [weakSelf userIconClicked];
        
    };

    
    
}

-(void)createTableView{
    
    if (!_myTableView) {
        
    
    _myTableView=[[UITableView alloc] initWithFrame:self.view.frame];
    
    [self.view addSubview:_myTableView];
    
    _myTableView.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"ED_FroumStatInfoBgImage@3x"]];
    
    }
}

#pragma mark delegate and datesource

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 1;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
   
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
   
    UITableViewCell * cell=[[UITableViewCell alloc] init];
    
    return cell;
    
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 2;
}


-(void)settingBtnClicked:(UIButton *)button{
    
    
}

-(void)addUserBtnClicked:(UIButton *)button{
    
    
    
    
}

-(void)userIconClicked{
    
    NSLog(@"123");
    

 }


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
