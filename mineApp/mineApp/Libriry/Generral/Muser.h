//
//  Muser.h
//  GITForCode
//
//  Created by mac1 on 16/6/24.
//  Copyright © 2016年 dfdsaf. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Muser : NSObject

//判断用户是否登陆成功
@property(nonatomic,assign)BOOL isLogin;

@property(nonatomic,assign)BOOL isKeepLogin;

+(Muser *)sharedUser;

@end
