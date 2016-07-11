//
//  VedioModel.h
//  mineApp
//
//  Created by mac1 on 16/7/9.
//  Copyright © 2016年 陆玉洪. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VedioModel : NSObject

//主播名字
@property (nonatomic, copy) NSString *nickname;

//观看人数
@property (nonatomic, copy) NSString *online;

//直播标题
@property (nonatomic, copy) NSString *title;

//缩略图大图    小图是sqic
@property (nonatomic, copy) NSString *bpic;

//HLS拼接关键词
@property (nonatomic, copy) NSString *videoId;          


@end
