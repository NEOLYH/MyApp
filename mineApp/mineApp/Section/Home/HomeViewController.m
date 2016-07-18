//
//  HomeViewController.m
//  GITForCode
//
//  Created by mac1 on 16/6/23.
//  Copyright © 2016年 dfdsaf. All rights reserved.
//

#import "HomeViewController.h"
#import "NextViewController.h"

@interface HomeViewController ()

@property (nonatomic,strong)UIButton *leftNavBtn;
@property (nonatomic,strong)UIButton *rightNavBtn;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title=@"主页";
    
    UIButton * button =[[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    [self.view addSubview:button];
    
    button.backgroundColor=[UIColor orangeColor];
    
    [button addTarget:self action:@selector(didClick) forControlEvents:UIControlEventTouchUpInside];
    
    [self setupNavBtn];
    
}



- (void)setupNavBtn{
    
    [self.navigationItem setRightBarButtonItem:[[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"icon_project_cell_pin@2x"] style:UIBarButtonItemStylePlain target:self action:@selector(settingBtnClicked:)] animated:NO];
    
    [self.navigationItem setLeftBarButtonItem:[[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"filtertBtn_normal_Nav"] style:UIBarButtonItemStylePlain target:self action:@selector(addUserBtnClicked:)] animated:NO];
    
}


-(void)settingBtnClicked:(UIButton *)button{
    
    
}

-(void)addUserBtnClicked:(UIButton *)button{
    
}

#pragma mark 跳转

-(void)didClick{
    
    NextViewController * vc=[[NextViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
