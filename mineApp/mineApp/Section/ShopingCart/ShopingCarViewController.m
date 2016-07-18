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

    //[self.navigationItem setRightBarButtonItem:[[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"tweetBtn_Nav"] style:UIBarButtonItemStylePlain target:self action:@selector(sendMsgBtnClicked:)] animated:NO];
    
    
    UIBarButtonItem *leftBarItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"hot_topic_Nav"] style:UIBarButtonItemStylePlain target:self action:@selector(hotTopicBtnClicked:)];
    
    [self.parentViewController.navigationItem setLeftBarButtonItem:leftBarItem animated:NO];
    
    
   
    UIBarButtonItem *rightBarItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"btn_setFrequent@2x"] style:UIBarButtonItemStylePlain target:self action:@selector(iconTopicBtnClicked:)];
    
    [self.parentViewController.navigationItem  setRightBarButtonItem:rightBarItem animated:NO];

}

-(void)hotTopicBtnClicked:(UIButton *)button{
    
    
}

-(void)iconTopicBtnClicked:(UIButton *)button{
    
}

-(void)sendMsgBtnClicked:(UIButton * )button{
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
