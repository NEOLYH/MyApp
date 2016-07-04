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
@property (weak, nonatomic) IBOutlet UIBarButtonItem *callBack;


@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    [self.button addTarget:self action:@selector(push) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *bacBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    
    self.navigationItem.backBarButtonItem =
    bacBarButtonItem;
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



- (IBAction)callBack:(id)sender {
    
    
   [self dismissViewControllerAnimated:YES completion:nil]; 
    
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
