//
//  SessionManager.h
//  mineApp
//
//  Created by 陆 on 30/11/2017.
//  Copyright © 2017 陆玉洪. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

@interface SessionManager : AFHTTPSessionManager
+(instancetype)shareManager;
@end
