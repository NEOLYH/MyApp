//
//  NEO_ShareView.h
//  popDemu
//
//  Created by mac1 on 16/7/22.
//  Copyright © 2016年 陆玉洪. All rights reserved.
//

#import <UIKit/UIKit.h>

@class NEO_ShareView;

@protocol NEO_ShareViewDataSource <NSObject>
@required

-(UITableViewCell *)NEO_ShareView:(NEO_ShareView *)NEO_shareView cellForIndexPath:(NSIndexPath *)indexPath;

-(NSInteger)NEO_shareView:(NEO_ShareView *)NEO_shareView numberOfRowsInSection:(NSInteger)section;


@end

@protocol NEO_ShareViewDelegate<NSObject>

@optional

-(void)Neo_ShareView:(NEO_ShareView *) NEO_shareView didSelectIndexPath:(NSInteger *)indexPath;

-(void)NEO_ShareViewCancel:(NEO_ShareView *)NEO_shareView;

-(CGFloat)NEO_ShareView:(NEO_ShareView *)NEO_shareView heightForRowAtIndexPath:(NSInteger *)indexPath;

@end

@interface NEO_ShareView : UIView<UITableViewDataSource,UITableViewDelegate>
{
    UITableView * _NEO_tableView;
    UILabel * _NEO_Lable;
    UIControl * _NEO_Lay;
    
    id<NEO_ShareViewDataSource> _datasource;
    id<NEO_ShareViewDelegate> _delegate;
}

@property(nonatomic, strong)id<NEO_ShareViewDelegate>delegate;
@property(nonatomic, strong)id<NEO_ShareViewDataSource>dataSource;

@property(nonatomic, strong)UITableView * listView;

-(void)setTitle:(NSString *)title;

-(void)show;

-(void)dismiss;

@end
