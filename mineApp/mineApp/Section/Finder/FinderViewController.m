//
//  FinderViewController.m
//  GITForCode
//
//  Created by mac1 on 16/6/23.
//  Copyright © 2016年 dfdsaf. All rights reserved.
//

#import "FinderViewController.h"
#import "VideoCell.h"
#import "AFHTTPSessionManager.h"
#import "VedioModel.h"
#import "MJExtension.h"
#import "UIView+Common.h"

#define kItemW ((kScreenW - 20)/2)
#define kItemH ((kScreenW - 20)/2) * [UIScreen mainScreen].bounds.size.width / [UIScreen mainScreen].bounds.size.height
#define HomeUrlH @"http://www.zhanqi.tv/api/static/live.hots/20-"
#define HomeUrlF @".json?os=1&ver=3.1.1"
static NSString *registerID = @"cell";

@interface FinderViewController ()<
UICollectionViewDataSource,
UICollectionViewDelegate,
UICollectionViewDelegateFlowLayout>

@property(nonatomic, strong) UICollectionView  * myCollectionVC;
@property(nonatomic, strong) NSMutableArray * data;
@end

@implementation FinderViewController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title=@"动态";
    self.data=[NSMutableArray new];
    [self collectionViewCreate];
    [self dataInit];
}

#pragma mark - 创建collectionView

-(void)collectionViewCreate{
    
    UICollectionViewFlowLayout * FlowLayout=[[UICollectionViewFlowLayout alloc] init];
    FlowLayout.headerReferenceSize=CGSizeMake(kScreenW, 10);
    FlowLayout.itemSize = CGSizeMake(kItemW, kItemH + 20);
    FlowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    FlowLayout.minimumInteritemSpacing = 10;
    FlowLayout.minimumLineSpacing = 20;
    FlowLayout.sectionInset = UIEdgeInsetsMake(0, 5, 0, 5);
    
    _myCollectionVC=[[UICollectionView alloc] initWithFrame:CGRectMake(0, 64, kScreenW, kScreenH-64) collectionViewLayout:FlowLayout];
    [self.view addSubview:_myCollectionVC];
    
    _myCollectionVC.backgroundColor = [UIColor whiteColor];
    _myCollectionVC.pagingEnabled = YES;
    _myCollectionVC.showsHorizontalScrollIndicator = NO;
    self.myCollectionVC.delegate = self;
    self.myCollectionVC.dataSource = self;
    [self.myCollectionVC registerClass:[VideoCell class] forCellWithReuseIdentifier:registerID];
    self.automaticallyAdjustsScrollViewInsets = NO;
}


-(void)dataInit{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    [self.view beginLoading];
    [manager GET:[NSString stringWithFormat:@"%@%@%@",HomeUrlH,@1,HomeUrlF] parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"111%@",responseObject);
        _data = [[responseObject objectForKey:@"data"] objectForKey:@"rooms"];
        [self.view endLoading];
        [_myCollectionVC reloadData];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"\n%@",error);
    }];
}

#pragma mark - delegate-dataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _data.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    VideoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:registerID forIndexPath:indexPath];
     
    VedioModel * model=[[VedioModel alloc] init];
    [model mj_setKeyValues:_data[indexPath.row]];
    
    cell.model = model;
    
    return cell;
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    NSLog(@"%@",indexPath);
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
