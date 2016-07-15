//
//  PersonalViewController.m
//  GITForCode
//
//  Created by mac1 on 16/6/23.
//  Copyright © 2016年 dfdsaf. All rights reserved.
//

#import "PersonalViewController.h"
#import "userHeaderView.h"


@interface PersonalViewController ()<UITableViewDataSource,UITableViewDelegate,UIActionSheetDelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate>

@property(nonatomic, strong) UITableView * myTableView;

//头部试图
@property(nonatomic, strong) userHeaderView * headerView;

@property(nonatomic, strong) UIImage * userIconImage;

 @end

@implementation PersonalViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.title=@"我";
    
    self.view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"ED_HeiYunWorkTitleImage"]];
    
    [self.navigationItem setRightBarButtonItem:[[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"settingBtn_Nav"] style:UIBarButtonItemStylePlain target:self action:@selector(settingBtnClicked:)] animated:NO];
    
    [self.navigationItem setLeftBarButtonItem:[[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"addUserBtn_Nav"] style:UIBarButtonItemStylePlain target:self action:@selector(addUserBtnClicked:)] animated:NO];
    
    [self createTableView];
    
    [self configHeaderView];

}

-(void)configHeaderView{
    
    _headerView=[userHeaderView  userHeaderViewWithImageName:@"_userIconImage" frameX:0 frameY:0 frameM:self.view.bounds.size.width frameZ:230];
    
    _myTableView.tableHeaderView=_headerView;
    
   _headerView.fansCountBtn.titleLabel.text=@"粉丝";
    _headerView.fansCountBtn.titleLabel.textColor=[UIColor whiteColor];
    
    [_headerView.userIconBtn addTarget:self action:@selector(userIconBtnClick:) forControlEvents:UIControlEventTouchUpInside];
}

-(void)createTableView{
    
    if (!_myTableView) {
        
    _myTableView=[[UITableView alloc] initWithFrame:self.view.frame];
    
    [self.view addSubview:_myTableView];
    
        
    
    }
}

-(void)userIconBtnClick:(UIButton *)button{
    
    UIAlertController * alertControl=[UIAlertController alertControllerWithTitle:@"提示" message:@"拍照" preferredStyle:UIAlertControllerStyleActionSheet];

    
    UIAlertAction *camaraBtn=[UIAlertAction actionWithTitle:@"相机" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        [self  camaraGo];

        
    }];
    
    UIAlertAction *fileBtn=[UIAlertAction actionWithTitle:@"相册" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        [self photoGo];
        
    }];
    
    UIAlertAction *CancleBtn=[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        
    }];
    
    [alertControl addAction:camaraBtn];
    [alertControl addAction:fileBtn];
    [alertControl addAction:CancleBtn];
    
    [self presentViewController:alertControl animated:YES completion:^{
        
    }];
}

-(void)camaraGo{
    
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
    {
        UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeCamera;//设置类型为相机
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];//初始化
        picker.delegate = self;//设置代理
        picker.allowsEditing = YES;//设置照片可编辑
        picker.sourceType = sourceType;
        //设置是否显示相机控制按钮 默认为YES
        picker.showsCameraControls = YES;
        
                //创建叠加层(例如添加的相框)
                UIView *overLayView=[[UIView alloc]initWithFrame:CGRectMake(0, 120, 320, 254)];
                //取景器的背景图片，该图片中间挖掉了一块变成透明，用来显示摄像头获取的图片；
                UIImage *overLayImag=[UIImage imageNamed:@"zhaoxiangdingwei.png"];
                UIImageView *bgImageView=[[UIImageView alloc]initWithImage:overLayImag];
                [overLayView addSubview:bgImageView];
                picker.cameraOverlayView=overLayView;
        
        //选择前置摄像头或后置摄像头
        picker.cameraDevice=UIImagePickerControllerCameraDeviceFront;
        [self presentViewController:picker animated:YES completion:^{
        }];
    }
    else {  
        NSLog(@"该设备无相机");  
    }
    
}

-(void)photoGo{
    
    
    //首先需要判断资源是否可用
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
        
        UIImagePickerController *pickerImage = [[UIImagePickerController alloc] init];
        
        pickerImage.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        //获得相机模式下支持的媒体类型
        //        pickerImage.mediaTypes = [UIImagePickerController availableMediaTypesForSourceType:pickerImage.sourceType];
        pickerImage.delegate = self;
        //设置允许编辑
        pickerImage.allowsEditing = YES;
        
        [self presentViewController:pickerImage animated:YES completion:^{
            
            
        }];
    }
    
}


#pragma mark - 从相册选择图片后操作
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    //NSLog(@"%@",info);
    
    //获取源图像（未经裁剪）
    //    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    
    //获取裁剪后的图像
    UIImage *image = info[UIImagePickerControllerEditedImage];
    
    //将照片存到媒体库
    UIImageWriteToSavedPhotosAlbum(image, self, @selector(image:didFinishSavingWithError:contextInfo:), NULL);
    
    self.userIconImage = image;
    
    //将照片存到沙盒
    [self saveImage:image];
    
    
    
    [picker dismissViewControllerAnimated:YES completion:^{
    }];
}

#pragma mark - 照片存到本地后的回调
- (void)image:(UIImage*)image didFinishSavingWithError:(NSError*)error contextInfo:(void*)contextInfo{
    if (!error) {
        NSLog(@"存储成功");
        
        
        
        
         
    } else {
        NSLog(@"存储失败：%@", error);
    }
}


- (void) saveImage:(UIImage *)currentImage {
    //设置照片的品质
    NSData *imageData = UIImageJPEGRepresentation(currentImage, 0.5);
    
    NSLog(@"%@",NSHomeDirectory());
    // 获取沙盒目录
    NSString *filePath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/currentImage.png"];
    // 将图片写入文件
    [imageData writeToFile:filePath atomically:NO];
    //将选择的图片显示出来
        [_headerView.userIconBtn setBackgroundImage:[UIImage imageWithContentsOfFile:filePath] forState:UIControlStateNormal];
    
    _headerView.userIconBtn.layer.cornerRadius=_headerView.userIconViewWith /2;
    
    
}

#pragma mark 取消操作时的回调

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    [picker dismissViewControllerAnimated:YES completion:^{
    }];
    
}

#pragma mark delegate and datesource

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 1;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
   
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
   
    UITableViewCell * cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    
    cell.backgroundColor=[UIColor clearColor];
    
    return cell;
    
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 2;
}


-(void)settingBtnClicked:(UIButton *)button{
    
    
}

-(void)addUserBtnClicked:(UIButton *)button{
    
    
    
    
}

-(void)userIconClicked{
    
    NSLog(@"123");
    

 }


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
