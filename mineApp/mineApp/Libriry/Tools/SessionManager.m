//
//  SessionManager.m
//  mineApp
//
//  Created by 陆 on 30/11/2017.
//  Copyright © 2017 陆玉洪. All rights reserved.
//

#import "SessionManager.h"
#import <AFNetworking/AFNetworkActivityIndicatorManager.h>

@implementation SessionManager
+(instancetype)shareManager{
    static SessionManager * manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken,^{
        manager  = [[self alloc] initWithBaseURL:nil];
        
        //{
           //AFJSONRequestSerializer 申明请求的数据是json类型
           //AFHTTPRequestSerializer  二进制的数据格式 （默认)
           //AFPropertyListRequestSerializer
        //}
        manager.requestSerializer = [AFJSONRequestSerializer serializer];
        
        //{
        //AFJSONResponseSerializer 申明返回的结果是json类型
        // AFHTTPResponseSerializer   二进制(默认)
        //AFXMLParserResponseSerializer  XML的解析器
        //}
        manager.responseSerializer = [AFJSONResponseSerializer serializer];
        
        //代表会对服务器返回的证书同本地证书全部进行校验，通过则通过，否则不通过
        manager.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeCertificate];
        
        manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"application/json", @"text/json",@"text/plain",@"text/javascript",@"image/jpeg",
                                                                    @"image/png",@"application/octet-stream",@"multipart/form-data", nil];
        manager.requestSerializer.timeoutInterval = 20.f;//请求响应时间
        [AFNetworkActivityIndicatorManager sharedManager].enabled = YES;//状态栏显示加载
        
//        // 2.设置证书模式
//        NSString * cerPath = [[NSBundle mainBundle] pathForResource:@"214093659330826" ofType:@"cer"];
//        NSData * cerData = [NSData dataWithContentsOfFile:cerPath];
//        sessionManager.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeCertificate withPinnedCertificates:[[NSSet alloc] initWithObjects:cerData, nil]];
//        // 客户端信任自检证书
//        sessionManager.securityPolicy.allowInvalidCertificates = YES;
//        // 对应域名的校验逻辑
//        [sessionManager.securityPolicy setValidatesDomainName:YES];
        
    });
    return  manager;
}

@end
