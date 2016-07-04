//
//  Muser.m
//  GITForCode
//
//  Created by mac1 on 16/6/24.
//  Copyright © 2016年 dfdsaf. All rights reserved.
//

#import "Muser.h"

@implementation Muser

static Muser *user = nil;

+(Muser *)sharedUser{
    
    static  dispatch_once_t onceToken;
    
    dispatch_once(&onceToken,^{
        
        user=[[Muser alloc]init];
    });
    return user;
}


@end
