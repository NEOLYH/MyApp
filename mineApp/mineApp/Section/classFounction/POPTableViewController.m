//
//  POPTableViewController.m
//  mineApp
//
//  Created by mac1 on 16/7/22.
//  Copyright © 2016年 陆玉洪. All rights reserved.
//
#define kCCellIdentifier_Time @"TimeCell"

#import "POPTableViewController.h"
#import "TimeLineCell.h"

@interface POPTableViewController()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic, strong) UITableView * tableView;

@end

@implementation POPTableViewController

-(void)viewDidLoad{
    
    [super viewDidLoad];
    
    UIBarButtonItem *secondItem=[[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"tips_menu_icon_mkread@2x"] style:UIBarButtonItemStylePlain target:self action:@selector(didClock:)];
    
    self.navigationItem.rightBarButtonItem=secondItem;
    
    [self  configerUI];
    
}

-(void)configerUI{
    
    _tableView =[[UITableView alloc] initWithFrame:CGRectMake(0, 164,self.view.bounds.size.width, self.view.bounds.size.height) style:UITableViewStylePlain];
    
    [self.view addSubview:_tableView];
    
    [_tableView registerClass:[TimeLineCell class] forCellReuseIdentifier:kCCellIdentifier_Time];
    
    
    _tableView.delegate=self;
    _tableView.dataSource=self;
    
   // _tableView.backgroundColor=[UIColor orangeColor];
    
}

-(void)didClock:(UIButton *)button{
    
    CGFloat xWidth = self.view.bounds.size.width - 20.0f;
    CGFloat yHeight = 272.0f;
    CGFloat yOffset = (self.view.bounds.size.height - yHeight)/2.0f;
    NEO_ShareView *poplistview = [[NEO_ShareView alloc] initWithFrame:CGRectMake(10, yOffset, xWidth, yHeight)];
    poplistview.delegate = self;
    poplistview.dataSource = self;
    poplistview.listView.scrollEnabled = FALSE;
    [poplistview setTitle:@"Share to"];
    [poplistview show];
    
    
}


#pragma mark NEO_ShareViewDelegate

-(UITableViewCell *)NEO_ShareView:(NEO_ShareView *)NEO_shareView cellForIndexPath:(NSIndexPath *)indexPath{
    
    static NSString * identifier=@"cell";
    
    UITableViewCell * cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    
    int row =indexPath.row;
    
    switch (row) {
        case 0:
            
            cell.textLabel.text=@"faceBook";
            cell.imageView.image=[UIImage imageNamed:@"add_user_icon@2x"];
            break;
            
        case 1:
            
            cell.textLabel.text=@"qq";
            cell.imageView.image=[UIImage imageNamed:@"add_user_icon@2x"];
            break;
            
        case 2:
            
            cell.textLabel.text=@"bolong";
            cell.imageView.image=[UIImage imageNamed:@"add_user_icon@2x"];
            break;
        case 3:
            
            cell.textLabel.text=@"qddq";
            cell.imageView.image=[UIImage imageNamed:@"add_user_icon@2x"];
            break;
            
        default:
            break;
    }
    
    return cell;
}

-(NSInteger)NEO_shareView:(NEO_ShareView *)NEO_shareView numberOfRowsInSection:(NSInteger)section{
    
    return 4;
}

#pragma mark - UIPopoverListViewDelegate
-(void)Neo_ShareView:(NEO_ShareView *)NEO_shareView didSelectIndexPath:(NSInteger *)indexPath{
    
    NSLog(@"%d",indexPath);
    
}


- (CGFloat)NEO_ShareView:(NEO_ShareView *)NEO_shareView heightForRowAtIndexPath:(NSInteger *)indexPath{
    
    return 60.f;
}


#pragma mark tableView dataSource delegate 

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 1;
    
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    TimeLineCell *  cell=[tableView  dequeueReusableCellWithIdentifier:kCCellIdentifier_Time forIndexPath:indexPath];
    
    return cell;
    
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    
    return 1;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return [TimeLineCell cellHeight];
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return 0;
}

@end
