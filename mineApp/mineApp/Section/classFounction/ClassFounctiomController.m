//
//  ClassFounctiomController.m
//  GITForCode
//
//  Created by mac1 on 16/6/23.
//  Copyright © 2016年 dfdsaf. All rights reserved.
//

#import "ClassFounctiomController.h"

@interface ClassFounctiomController ()

@end

@implementation ClassFounctiomController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title=@"广场";
    
    
    UIBarButtonItem *shareItem=[[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"tipIcon_Tweet@2x"] style:UIBarButtonItemStylePlain target:self action:@selector(shared:)];
    
    UIBarButtonItem *secondItem=[[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"tips_menu_icon_mkread@2x"] style:UIBarButtonItemStylePlain target:self action:@selector(didClock:)];
    
    NSArray *arr=[[NSArray alloc] initWithObjects:shareItem,secondItem, nil];
    
    
    self.navigationItem.rightBarButtonItems=arr;
    
    
}


-(void)shared:(UIButton *)button{
    
    
}

-(void)didClock:(UIButton *)button{
    
    
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
