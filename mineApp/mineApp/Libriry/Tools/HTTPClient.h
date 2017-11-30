//
//  HTTPClient.h
//  mineApp
//
//  Created by 陆 on 30/11/2017.
//  Copyright © 2017 陆玉洪. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SessionManager.h"

@interface HTTPClient : NSObject
+(instancetype)shareInstance;

/*!
 @method
 @abstract  GET请求接口
 @discussion
 @param path       URI
 @param parameters 参数
 @param isHint     服务器错误或者无网络时是否提示
 @param success    成功回调
 @param failure    失败回调
 */
-(void)getPath:(NSString *)path
    paramaters:(NSDictionary *)paramaters
        isHint:(BOOL)isHint
       success:(void (^)(id reponse))suceess
       failure:(void (^)(NSInteger errorCode, NSString * errorMassege))failure;

/*!
 @method
 @abstract  GET请求接口
 @discussion
 @param path       URI
 @param parameters 参数
 @param isHint     服务器错误或者无网络时是否提示
 @param isCache    是否缓存数据
 @param success    成功回调
 @param failure    失败回调
 */
- (void)getPath:(NSString *)path
     parameters:(NSMutableDictionary *)parameters
        isCache:(BOOL)isCahe
         isHint:(BOOL)isHint
        success:(void (^)(id jsonObj))success
   cacheSuccess:(void (^)(NSString *json,NSString *laststamp))cacheSuccess
        failure:(void (^)(NSInteger erroeCode, NSString *errorMessage))failure;


/*!
 @method
 @abstract  POST请求接口
 @discussion
 @param path       URI
 @param parameters 参数
 @param isHint     服务器错误或者无网络时是否提示
 @param success    成功回调
 @param failure    失败回调
 */
- (void)postPath:(NSString *)path
      parameters:(NSMutableDictionary *)parameters
          isHint:(BOOL)isHint
         success:(void (^)(id jsonObj))success
         failure:(void (^)(NSInteger errorCode, NSString *errorMessage))failure;

- (void)postPath:(NSString *)path
      parameters:(NSMutableDictionary *)parameters
          images:(NSMutableArray *)images
          isHint:(BOOL)isHint
        progress:(void (^)(float percentage))progress
         success:(void (^)(id result))success
         failure:(void (^)(NSInteger errorCode, NSString *errorMessage))failure;




@end
