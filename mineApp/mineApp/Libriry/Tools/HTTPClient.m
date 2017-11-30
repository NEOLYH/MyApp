//
//  HTTPClient.m
//  mineApp
//
//  Created by 陆 on 30/11/2017.
//  Copyright © 2017 陆玉洪. All rights reserved.
//

#import "HTTPClient.h"

@implementation HTTPClient

+(instancetype)shareInstance{
    static HTTPClient * httpClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        httpClient = [[HTTPClient alloc] init];
    });
    return httpClient;
}

-(void)getPath:(NSString *)path
    paramaters:(NSDictionary *)paramaters
        isHint:(BOOL)isHint
       success:(void (^)(id reponse))suceess
       failure:(void (^)(NSInteger errorCode, NSString * errorMassege))failure{
    
    [[SessionManager shareManager] GET:path parameters:paramaters progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}

- (void)getPath:(NSString *)path
     parameters:(NSMutableDictionary *)parameters
        isCache:(BOOL)isCahe
         isHint:(BOOL)isHint
        success:(void (^)(id jsonObj))success
   cacheSuccess:(void (^)(NSString *json,NSString *laststamp))cacheSuccess
        failure:(void (^)(NSInteger erroeCode, NSString *errorMessage))failure{
    
}

- (void)postPath:(NSString *)path
      parameters:(NSMutableDictionary *)parameters
          isHint:(BOOL)isHint
         success:(void (^)(id jsonObj))success
         failure:(void (^)(NSInteger errorCode, NSString *errorMessage))failure{
    [[SessionManager shareManager] POST:path     parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id responseObject) {
        
        success(responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        failure(1,[error localizedDescription]);
    }];
}

- (void)postPath:(NSString *)path
      parameters:(NSMutableDictionary *)parameters
          images:(NSMutableArray *)images
          isHint:(BOOL)isHint
        progress:(void (^)(float percentage))progress
         success:(void (^)(id result))success
         failure:(void (^)(NSInteger errorCode, NSString *errorMessage))failure{
    
}
@end
