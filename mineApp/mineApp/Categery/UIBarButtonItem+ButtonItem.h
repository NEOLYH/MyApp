//
//  UIBarButtonItem+ButtonItem.h
//  mineApp
//
//  Created by mac1 on 16/7/19.
//  Copyright © 2016年 陆玉洪. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (ButtonItem)

+(UIBarButtonItem *)barButtonItemWithTitle:(NSString *)title imageName:(NSString *)imageName target:(id)target selector:(SEL)selector;


-(void)setBarWithTitle:(NSString *)string;

@end
