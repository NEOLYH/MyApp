//
//  VideoCell.h
//  mineApp
//
//  Created by mac1 on 16/7/9.
//  Copyright © 2016年 陆玉洪. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VedioModel.h"

@interface VideoCell : UICollectionViewCell

//模型
@property(nonatomic, strong) VedioModel * model;

//缩略图片
@property(nonatomic, strong) UIImageView * img;

//房间名
@property(nonatomic, strong) UILabel * roomTitle;

////主播名称
//@property(nonatomic, strong) UILabel * roomName;

//在线人数
@property(nonatomic, strong) UILabel * peopleNum;

@end
