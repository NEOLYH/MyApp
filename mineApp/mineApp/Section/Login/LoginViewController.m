//
//  LoginViewController.m
//  GITForCode
//
//  Created by mac1 on 16/6/23.
//  Copyright © 2016年 dfdsaf. All rights reserved.
//

#import "LoginViewController.h"
#import "SignViewController.h"
#import "NEO_NavigationController.h"
#import "Muser.h"

@interface LoginViewController ()

@property (weak, nonatomic) IBOutlet UIButton *button;


@end

@implementation LoginViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.title=@"登录";
 
    [self.button addTarget:self action:@selector(push) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *bacBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"fanhui"] style:UIBarButtonItemStylePlain target:self action:@selector(callBack)];
    
    self.navigationItem.leftBarButtonItem =
    bacBarButtonItem;
    
    //设置导航栏的title文字颜色以及大小
    [self.navigationController.navigationBar setTitleTextAttributes:
     
     @{NSFontAttributeName:[UIFont systemFontOfSize:18],
       
       NSForegroundColorAttributeName:[UIColor whiteColor]}];
    

}


+ (LoginViewController *)loginCheckWithController:(UIViewController *)controller loginEvent:(NSInteger)loginEvent
{
    if ([[Muser sharedUser] isLogin]) {
        // 登陆了就什么都不用干了
        return nil;
    } else { // 非登陆的时候就需要
        LoginViewController *loginVC = [[UIStoryboard storyboardWithName:@"Login" bundle:nil] instantiateViewControllerWithIdentifier:@"LoginViewController"];        NEO_NavigationController *nav = [[NEO_NavigationController alloc] initWithRootViewController:loginVC];
        [controller presentViewController:nav animated:YES completion:NULL];
        return loginVC;
    }
}

-(void)push{
    
    SignViewController *signVC=[[UIStoryboard storyboardWithName:@"Login" bundle:nil] instantiateViewControllerWithIdentifier:@"SignViewController"];
    
    [self.navigationController pushViewController:signVC animated:YES];
    
}



- (void)callBack {
    
    
   [self dismissViewControllerAnimated:YES completion:nil]; 
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
