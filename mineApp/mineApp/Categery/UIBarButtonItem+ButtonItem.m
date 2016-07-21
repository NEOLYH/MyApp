//
//  UIBarButtonItem+ButtonItem.m
//  mineApp
//
//  Created by mac1 on 16/7/19.
//  Copyright © 2016年 陆玉洪. All rights reserved.
//

#import "UIBarButtonItem+ButtonItem.h"

@implementation UIBarButtonItem (ButtonItem)

+(UIBarButtonItem *)barButtonItemWithTitle:(NSString *)title imageName:(NSString *)imageName target:(id)target selector:(SEL)selector{
    
    UIButton *barItem=[[UIButton alloc] initWithFrame:CGRectMake(0, 0, 70, 30)];
    
    [barItem setTitle:title forState:UIControlStateNormal];
    
    barItem.titleLabel.font=[UIFont systemFontOfSize:16];;
    
    [barItem setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    
    [barItem addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem  *barItems=[[UIBarButtonItem alloc] initWithCustomView:barItem];
    
    return barItems;
}

-(void)setBarWithTitle:(NSString *)string{
    
    
}

@end
