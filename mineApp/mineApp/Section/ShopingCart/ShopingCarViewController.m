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
    
    self.title=@"泡泡";
    
    
    [self.navigationItem setRightBarButtonItem:[[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"tweetBtn_Nav"] style:UIBarButtonItemStylePlain target:self action:@selector(sendMsgBtnClicked:)] animated:NO];
    
    
}

-(void)sendMsgBtnClicked:(UIButton * )button{
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
