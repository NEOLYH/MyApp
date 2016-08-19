//
//  HomeViewController.m
//  GITForCode
//
//  Created by mac1 on 16/6/23.
//  Copyright © 2016年 dfdsaf. All rights reserved.
//

#import "HomeViewController.h"
#import "NextViewController.h"
#import "PopMenu.h"
#import "UIView+Common.h"

@interface HomeViewController ()

@property (nonatomic, strong) UIButton *leftNavBtn;
@property (nonatomic, strong) UIButton *rightNavBtn;
@property (nonatomic, strong) PopMenu * myPopMenu;

@end

@implementation HomeViewController


-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    [self.view beginLoading];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.title=@"主页";
//    
//    UIButton * button =[[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
//    [self.view addSubview:button];
//    
//    button.backgroundColor=[UIColor orangeColor];
//    
//    [button addTarget:self action:@selector(didClick) forControlEvents:UIControlEventTouchUpInside];
    
    UITableView *tableView=[[UITableView alloc ] initWithFrame:self.view.frame style:UITableViewStylePlain];
    tableView.backgroundColor=[UIColor orangeColor];
    [self.view addSubview:tableView];
//    
    [self setupNavBtn];
    
    
    
}



- (void)setupNavBtn{
    
    [self.navigationItem setRightBarButtonItem:[[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"icon_project_cell_pin@2x"] style:UIBarButtonItemStylePlain target:self action:@selector(settingBtnClicked:)] animated:NO];
    
    [self.navigationItem setLeftBarButtonItem:[[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"filtertBtn_normal_Nav"] style:UIBarButtonItemStylePlain target:self action:@selector(addUserBtnClicked:)] animated:NO];
    
}


-(void)settingBtnClicked:(UIButton *)button{
    
    [self.view endLoading];
        
        NSArray *menuItems=@[
                             [MenuItem itemWithTitle:@"项目" iconName:@"pop_Project" index:0],
                             [MenuItem itemWithTitle:@"任务" iconName:@"pop_Task" index:1],
                             [MenuItem itemWithTitle:@"冒泡" iconName:@"pop_Tweet" index:2],
                             [MenuItem itemWithTitle:@"添加好友" iconName:@"pop_User" index:3],
                             [MenuItem itemWithTitle:@"私信" iconName:@"pop_Message" index:4],
                             [MenuItem itemWithTitle:@"两步验证" iconName:@"pop_2FA" index:5],
                             ];
        
        if(!_myPopMenu){
            
            _myPopMenu = [[PopMenu alloc] initWithFrame:CGRectMake(0, 64, self.view.bounds.size.width, self.view.bounds.size.height-64) items:menuItems];
            
            _myPopMenu.perRowItemCount=3;
            _myPopMenu.menuAnimationType=kPopMenuAnimationTypeNetEase;
        }
    
    [_myPopMenu showMenuAtView:self.view];
    
    __weak typeof (self) weakSelf = self;
    _myPopMenu.didSelectedItemCompletion=^(MenuItem *selectedItem){
      
        
        if(!selectedItem){
            
            return;
        }
        
        switch (selectedItem.index) {
            case 0:
                [weakSelf goToProjectVC];
                break;
            case 1:
                [weakSelf goToNewTweetVC];
                break;
            case 2:
                [weakSelf gotoOldVC];
                break;
            case 3:
                [weakSelf gotoPldVC];
                break;
            case 4:
                [weakSelf gotoPnimVC];
                break;
            case 5:
                [weakSelf gotoDaShaVC];
                break;

            default:
                break;
        }
        
        [weakSelf.myPopMenu.realTimeBlurFooter disMiss];
        
    };
    
    
    

    
}

-(void)addUserBtnClicked:(UIButton *)button{
    
    [self.view beginLoading];
    
    
    
}

#pragma mark 跳转

//-(void)didClick{
//    
//    
//    NextViewController * vc=[[NextViewController alloc] init];
//    [self.navigationController pushViewController:vc animated:YES];
//    
//    
//}

-(void)goToProjectVC{
    
    
    NSLog(@"你猜");
}

-(void)goToNewTweetVC{
    
    NSLog(@"你再猜啊");
}

-(void)gotoOldVC{
    
    NSLog(@"接着猜");
}

-(void)gotoPldVC{
    NSLog(@"猜死心啊");
}

-(void)gotoPnimVC{
    
    NSLog(@"猜不懂啊");
}

-(void)gotoDaShaVC{
    
    NSLog(@"最后才一次啊");
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
