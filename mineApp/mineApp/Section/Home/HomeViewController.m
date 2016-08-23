//
//  HomeViewController.m
//  GITForCode
//
//  Created by mac1 on 16/6/23.
//  Copyright © 2016年 dfdsaf. All rights reserved.
//

#import "HomeViewController.h"
#import "NextViewController.h"
#import "PopMenu.h"
#import "UIView+Common.h"
#import "NEO_ScrollMenu.h"
#import "Next_OneController.h"
#import "Next_TwoController.h"
#import "Next_ThreeController.h"
#import "Next_FourController.h"
#import "Next_FiveController.h"
#import "Next_SixController.h"
#import "Next_SenvenController.h"
#import "Next_ErghitController.h"

@interface HomeViewController ()<UIScrollViewDelegate,NEO_ScrollMenuDelegate>

@property (nonatomic, strong) UIButton *leftNavBtn;
@property (nonatomic, strong) UIButton *rightNavBtn;
@property (nonatomic, strong) PopMenu * myPopMenu;
@property (nonatomic, strong) NEO_ScrollMenu *topScrollMenu;
@property (nonatomic, strong) UIScrollView *mainScrollView;
@property (nonatomic, strong) NSArray *titles;

@end

@implementation HomeViewController


-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title=@"主页";
    [self setupNavBtn];
    [self confirgerUI];
    
    //添加自控制器
    [self setupChildViewController];

}

- (void)setupNavBtn{
    
    [self.navigationItem setRightBarButtonItem:[[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"icon_project_cell_pin@2x"] style:UIBarButtonItemStylePlain target:self action:@selector(settingBtnClicked:)] animated:NO];
    
    [self.navigationItem setLeftBarButtonItem:[[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"filtertBtn_normal_Nav"] style:UIBarButtonItemStylePlain target:self action:@selector(addUserBtnClicked:)] animated:NO];
    
}

-(void)confirgerUI{
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    // 1.添加所有子控制器
    [self setupChildViewController];
    
    
    self.titles = @[@"精选", @"电视剧", @"电影", @"综艺", @"NBA", @"新闻", @"娱乐", @"音乐", @"网络电影"];
    
    self.topScrollMenu = [NEO_ScrollMenu
                          NEO_ScrollViewWithFrame:CGRectMake(0, 64, self.view.frame.size.width, 44)];
    _topScrollMenu.titleArr = [NSArray arrayWithArray:_titles];
    _topScrollMenu.Mdelegate = self;
    [self.view addSubview:_topScrollMenu];
    
    // 创建底部滚动视图
    self.mainScrollView = [[UIScrollView alloc] init];
    _mainScrollView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    _mainScrollView.contentSize = CGSizeMake(self.view.frame.size.width * _titles.count, 0);
    _mainScrollView.backgroundColor = [UIColor clearColor];
    
    _mainScrollView.pagingEnabled = YES;
    _mainScrollView.bounces = NO;
    _mainScrollView.showsHorizontalScrollIndicator = YES;
    
    _mainScrollView.delegate = self;
    [self.view addSubview:_mainScrollView];
    
    NextViewController *oneVC = [[NextViewController alloc] init];
    [self.mainScrollView addSubview:oneVC.view];
    
    [self.view insertSubview:_mainScrollView belowSubview:_topScrollMenu];

    
    
}

- (void)NEO_ScrollMenu:(NEO_ScrollMenu *)topScrollMenu didSelectTitleAtIndex:(NSInteger)index{
    
    // 1 计算滚动的位置
    CGFloat offsetX = index * self.view.frame.size.width;
    self.mainScrollView.contentOffset = CGPointMake(offsetX, 0);
    
    // 2.给对应位置添加对应子控制器
    [self showVc:index];
}

-(void)setupChildViewController{
    
    // 精选
    NextViewController *oneVC = [[NextViewController alloc] init];
    [self addChildViewController:oneVC];
    
    // 电视剧
    Next_OneController *twoVC = [[Next_OneController alloc] init];
    [self addChildViewController:twoVC];
    
    // 电影
    Next_TwoController *threeVC = [[Next_TwoController alloc] init];
    [self addChildViewController:threeVC];
    
    // 精选
    Next_ThreeController *fourVC = [[Next_ThreeController alloc] init];
    [self addChildViewController:fourVC];
    
    // 电视剧
    Next_FourController *fiveVC = [[Next_FourController alloc] init];
    [self addChildViewController:fiveVC];
    
    // 电影
    Next_FiveController *sixVC = [[Next_FiveController alloc] init];
    [self addChildViewController:sixVC];
    
    // 精选
    Next_SixController *VC7 = [[Next_SixController alloc] init];
    [self addChildViewController:VC7];
    
    // 电视剧
    Next_SenvenController *VC8 = [[Next_SenvenController alloc] init];
    [self addChildViewController:VC8];
    
    // 电影
    Next_ErghitController *VC9 = [[Next_ErghitController alloc] init];
    [self addChildViewController:VC9];
    
}


// 显示控制器的view
- (void)showVc:(NSInteger)index {
    
    CGFloat offsetX = index * self.view.frame.size.width;
    
    UIViewController *vc = self.childViewControllers[index];
    
    // 判断控制器的view有没有加载过,如果已经加载过,就不需要加载
    if (vc.isViewLoaded) return;
    
    [self.mainScrollView addSubview:vc.view];
    vc.view.frame = CGRectMake(offsetX, 0, self.view.frame.size.width, self.view.frame.size.height);
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    // 计算滚动到哪一页
    NSInteger index = scrollView.contentOffset.x / scrollView.bounds.size.width;
    
    // 1.添加子控制器view
    [self showVc:index];
    
    // 2.把对应的标题选中
    [[NSNotificationCenter defaultCenter] postNotificationName:@"change" object:@(index) userInfo:nil];
    
    // 2.把对应的标题选中
    UILabel *selLabel = self.topScrollMenu.titleLableArr[index];
    
    [self.topScrollMenu selectLabel:selLabel];
    
     //3.让选中的标题居中
    [self.topScrollMenu setupTitleCenter:selLabel];
}


-(void)settingBtnClicked:(UIButton *)button{
    
    [self.view endLoading];
        
        NSArray *menuItems=@[
                             [MenuItem itemWithTitle:@"项目" iconName:@"pop_Project" index:0],
                             [MenuItem itemWithTitle:@"任务" iconName:@"pop_Task" index:1],
                             [MenuItem itemWithTitle:@"冒泡" iconName:@"pop_Tweet" index:2],
                             [MenuItem itemWithTitle:@"添加好友" iconName:@"pop_User" index:3],
                             [MenuItem itemWithTitle:@"私信" iconName:@"pop_Message" index:4],
                             [MenuItem itemWithTitle:@"两步验证" iconName:@"pop_2FA" index:5],
                             ];
        
        if(!_myPopMenu){
            
            _myPopMenu = [[PopMenu alloc] initWithFrame:CGRectMake(0, 64, self.view.bounds.size.width, self.view.bounds.size.height-64) items:menuItems];
            
            _myPopMenu.perRowItemCount=3;
            _myPopMenu.menuAnimationType=kPopMenuAnimationTypeNetEase;
        }
    
    [_myPopMenu showMenuAtView:self.view];
    
    __weak typeof (self) weakSelf = self;
    _myPopMenu.didSelectedItemCompletion=^(MenuItem *selectedItem){
      
        
        if(!selectedItem){
            
            return;
        }
        
        switch (selectedItem.index) {
            case 0:
                [weakSelf goToProjectVC];
                break;
            case 1:
                [weakSelf goToNewTweetVC];
                break;
            case 2:
                [weakSelf gotoOldVC];
                break;
            case 3:
                [weakSelf gotoPldVC];
                break;
            case 4:
                [weakSelf gotoPnimVC];
                break;
            case 5:
                [weakSelf gotoDaShaVC];
                break;

            default:
                break;
        }
        
        [weakSelf.myPopMenu.realTimeBlurFooter disMiss];
        
    };
    
    
    

    
}

-(void)addUserBtnClicked:(UIButton *)button{
    
    [self.view beginLoading];
    
}

#pragma mark 跳转



-(void)goToProjectVC{
    
    
    NSLog(@"你猜");
}

-(void)goToNewTweetVC{
    
    NSLog(@"你再猜啊");
}

-(void)gotoOldVC{
    
    NSLog(@"接着猜");
}

-(void)gotoPldVC{
    NSLog(@"猜死心啊");
}

-(void)gotoPnimVC{
    
    NSLog(@"猜不懂啊");
}

-(void)gotoDaShaVC{
    
    NSLog(@"最后才一次啊");
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
