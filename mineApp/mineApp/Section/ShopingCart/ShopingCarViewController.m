//
//  ShopingCarViewController.m
//  GITForCode
//
//  Created by mac1 on 16/6/23.
//  Copyright © 2016年 dfdsaf. All rights reserved.
//

#import "ShopingCarViewController.h"

@interface ShopingCarViewController ()

@end

@implementation ShopingCarViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self navigationItemAndAction];
}

-(void)navigationItemAndAction{
    UIBarButtonItem *leftBarItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"hot_topic_Nav"] style:UIBarButtonItemStylePlain target:self action:@selector(hotTopicBtnClicked:)];
    UIBarButtonItem *rightBarItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"btn_setFrequent@2x"] style:UIBarButtonItemStylePlain target:self action:@selector(iconTopicBtnClicked:)];
    [self.parentViewController.navigationItem setLeftBarButtonItem:leftBarItem animated:NO];
    [self.parentViewController.navigationItem  setRightBarButtonItem:rightBarItem animated:NO];
}

#pragma  mark item action
-(void)hotTopicBtnClicked:(UIButton *)button{
}

-(void)iconTopicBtnClicked:(UIButton *)button{
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
