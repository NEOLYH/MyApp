//
//  NEO_NavigationController.m
//  GITForCode
//
//  Created by mac1 on 16/6/22.
//  Copyright © 2016年 dfdsaf. All rights reserved.
//

#import "NEO_NavigationController.h"

@interface NEO_NavigationController ()<UIGestureRecognizerDelegate>


@end

@implementation NEO_NavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.navigationBar.barTintColor=[UIColor redColor];
//    
//    //设置导航栏的title文字颜色以及大小
//    [self.navigationController.navigationBar setTitleTextAttributes:
//     
//     @{NSFontAttributeName:[UIFont systemFontOfSize:18],
//       
//       NSForegroundColorAttributeName:[UIColor whiteColor]}];
//    
    //设置导航栏的返回item颜色
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    
   
    self.interactivePopGestureRecognizer.delegate=self;
    
    
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
    if (self.childViewControllers.count > 0) {
        // 判断子控制器的数量
        NSString *title = @"";
        
        if (self.childViewControllers.count == 1) {
            title = self.childViewControllers.firstObject.title;
        }
        
        // 设置返回按钮
        
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStylePlain target:self action:@selector(goBack)];
        viewController.navigationItem.leftBarButtonItem.image=[UIImage imageNamed:@"back"];
        
        // 隐藏底部的 TabBar
        viewController.hidesBottomBarWhenPushed = YES;
    }
    
    [super pushViewController:viewController animated:animated];
}

#pragma mark - UIGestureRecognizerDelegate
/// 手势识别将要开始
///
/// @param gestureRecognizer 手势识别
///
/// @return 返回 NO，放弃当前识别到的手势
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    // 如果是根视图控制器，则不支持手势返回
    return self.childViewControllers.count > 1;
}

#pragma mark - 监听方法
/// 返回上级视图控制器
- (void)goBack {
    
    [self popViewControllerAnimated:YES];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
