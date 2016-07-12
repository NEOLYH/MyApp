//
//  NEO_TabBarController.m
//  GITForCode
//
//  Created by mac1 on 16/6/22.
//  Copyright © 2016年 dfdsaf. All rights reserved.
//

#import "NEO_TabBarController.h"
#import "NEO_NavigationController.h"
#import "PersonalViewController.h"
#import "FinderViewController.h"
#import "ClassFounctiomController.h"
#import "HomeViewController.h"
#import "ShopingCarViewController.h"
#import "LoginViewController.h"
#import "Muser.h"


@interface NEO_TabBarController ()<UITabBarControllerDelegate,UINavigationControllerDelegate>
@property(nonatomic, assign) NSInteger selectViewControllerIndex;

@end

@implementation NEO_TabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.delegate = self;
    
    [self setTabBarControllers];
    
    [self customizeTabBarInterface];

    
}

#pragma mark 设置tabBar

-(void)setTabBarControllers{

   self.tabBar.tintColor = [UIColor colorWithRed:65/255.0 green:179/255.0 blue:94/255.0 alpha:1];

    self.tabBar.barTintColor=[UIColor colorWithRed:30/255.0 green:36/255.0 blue:46/255.0 alpha:1];
    
    self.tabBar.translucent = YES;
    
}


#pragma mark 定义tarBar

-(void)customizeTabBarInterface{
    
    
    
    HomeViewController * Home_VC=[[HomeViewController alloc] init];
    
    ClassFounctiomController *Class_VC=[[ClassFounctiomController alloc] init];

    FinderViewController * Finder_VC=[[FinderViewController alloc] init];
    ShopingCarViewController *ShopCar_VC=[[ShopingCarViewController alloc] init];
    PersonalViewController * Person_VC=[[PersonalViewController alloc] init];
    
    NEO_NavigationController *navigationController_Home = [[NEO_NavigationController alloc]
                                                           initWithRootViewController:Home_VC];
    
    
    
    NEO_NavigationController *navigationController_Moment = [[NEO_NavigationController alloc]
                                                             initWithRootViewController:Finder_VC];
    
    NEO_NavigationController *navigationController_NearBy = [[NEO_NavigationController alloc]
                                                             initWithRootViewController:ShopCar_VC];
    NEO_NavigationController *navigationController_ShoppingCart = [[NEO_NavigationController alloc]
                                                                   initWithRootViewController:Class_VC];
    
    NEO_NavigationController *navigationController_Personal = [[NEO_NavigationController alloc]
                                                               initWithRootViewController:Person_VC];
    
    
    self.viewControllers = @[navigationController_Home, navigationController_Moment, navigationController_NearBy, navigationController_ShoppingCart, navigationController_Personal];
    
    for (UINavigationController *navigationController in self.viewControllers) {
        [navigationController setDelegate:self];
    }
    
    NSArray *dataArray = @[@"主页", @"动态", @"冒泡", @"进货车", @"我"];
    
    //NSArray *nImageArray = @[@"tab_home", @"home_icon_dynamic", @"tab_nearby", @"tab_cart", @"tab_me"];
    
    //NSArray *sImgaearray = @[@"tab_home_pre", @"home_icon_dynamic_h", @"tab_nearby_pre", @"tab_cart_pre", @"tab_me_pre"];
    
     NSArray *nImageArray = @[@"project_normal", @"task_normal", @"tweet_normal", @"privatemessage_normal", @"me_normal"];
    NSArray *sImgaearray = @[@"project_selected", @"task_selected", @"tweet_selected", @"privatemessage_selected", @"me_selected"];
    
    for (int i = 0; i < [self.viewControllers count]; i++) {
        [self setupTabBarItem:self.viewControllers[i]
                    withTitle:dataArray[i]
                  normalImage:nImageArray[i]
                selectedImage:sImgaearray[i]];
    }

    
}



- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController
{
    if ([viewController isKindOfClass:[UINavigationController class]]) {
        
        UINavigationController *navigationController = (UINavigationController *)viewController;
        
        if ([[navigationController.viewControllers firstObject] isKindOfClass:[PersonalViewController class]]) {
            
            if ([Muser sharedUser].isLogin) {
                _selectViewControllerIndex = 4;
                
               LoginViewController *login = [[UIStoryboard storyboardWithName:@"Login" bundle:nil] instantiateViewControllerWithIdentifier:@"LoginViewController"];
                
                
                 NEO_NavigationController *navController = [[NEO_NavigationController alloc] initWithRootViewController:login];
                
                [self presentViewController:navController animated:YES completion:nil];
                
                return NO;
            }
            
            return YES;
        }

    }
    
    return YES;
}


/*!
 *  给tabbar的每个viewController添加标题和图片,选中和非选中得
 *
 *  @param viewController
 *  @param title          标题
 *  @param nImage         普通图
 *  @param sImage         高亮图
 */
- (void)setupTabBarItem:(UIViewController *)viewController
              withTitle:(NSString *)title
            normalImage:(NSString *)nImage
          selectedImage:(NSString *)sImage
{
    UIImage *normalImage = [[UIImage imageNamed:nImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage *selectedImage = [[UIImage imageNamed:sImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    viewController.tabBarItem = [[UITabBarItem alloc] initWithTitle:title
                                                              image:normalImage
                                                      selectedImage:selectedImage];
    

}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
