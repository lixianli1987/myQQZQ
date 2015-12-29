//
//  CreateViewController.m
//  QQZQ
//
//  Created by cafuc on 15/9/5.
//  Copyright (c) 2015年 cafuc. All rights reserved.
//

#import "CreateViewController.h"
#import "MyUtils.h"
#import "ChoiceProvinceViewController.h"
#import "ImageCropViewController.h"
#import "AFNetworking.h"
#import "WebServiceHost.h"
#import "MyTeamViewController.h"
#import "Common.h"
#import "UserData.h"


@interface CreateViewController ()<UITextViewDelegate,UITextFieldDelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate,ImageCropViewControllerDelegate>
{
    //选择x人制
    int flag5;
    int flag7;
    int flag9;
    int flag11;
    
    //0:任何人  1:需审核
    int flagChoice;
    
    //球队头像
    UIImage *imageHead;
}

@end

@implementation CreateViewController

@synthesize buttonBack;
@synthesize buttonSure;
@synthesize viewSportHeadImg;
@synthesize textFieldSportName;
@synthesize viewSportLocation;
@synthesize labelSportLocation;
@synthesize button5People;
@synthesize button7People;
@synthesize button9People;
@synthesize button11People;
@synthesize buttonAnybody;
@synthesize buttonNeedVerify;
@synthesize textViewProfile;
@synthesize view5;
@synthesize view7;
@synthesize view9;
@synthesize view11;
@synthesize viewEveryOne;
@synthesize viewNeed;
@synthesize viewHeadImg;
@synthesize imageViewHeadImg;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //初始化选择5
    flag5 = 1;
    flag7 = 0;
    flag9 = 0;
    flag11 = 0;
    
    //初始化选择 任何人
    flagChoice = 0;
    
    
    //初始化时设置button的状态
    //需要设置5\7\9\11人制 和 任意人\需审核
    [button5People setSelected:YES];
    [button5People setBackgroundImage:[UIImage imageNamed:@"choiceNot"] forState:UIControlStateNormal];
    [button5People setBackgroundImage:[UIImage imageNamed:@"choice"] forState:UIControlStateSelected];
    [button7People setSelected:NO];
    [button7People setBackgroundImage:[UIImage imageNamed:@"choiceNot"] forState:UIControlStateNormal];
    [button7People setBackgroundImage:[UIImage imageNamed:@"choice"] forState:UIControlStateSelected];
    [button9People setSelected:NO];
    [button9People setBackgroundImage:[UIImage imageNamed:@"choiceNot"] forState:UIControlStateNormal];
    [button9People setBackgroundImage:[UIImage imageNamed:@"choice"] forState:UIControlStateSelected];
    [button11People setSelected:NO];
    [button11People setBackgroundImage:[UIImage imageNamed:@"choiceNot"] forState:UIControlStateNormal];
    [button11People setBackgroundImage:[UIImage imageNamed:@"choice"] forState:UIControlStateSelected];
    
    [buttonAnybody setSelected:YES];
    [buttonAnybody setBackgroundImage:[UIImage imageNamed:@"choice2Not"] forState:UIControlStateNormal];
    [buttonAnybody setBackgroundImage:[UIImage imageNamed:@"choice2"] forState:UIControlStateSelected];
    [buttonNeedVerify setSelected:NO];
    [buttonNeedVerify setBackgroundImage:[UIImage imageNamed:@"choice2Not"] forState:UIControlStateNormal];
    [buttonNeedVerify setBackgroundImage:[UIImage imageNamed:@"choice2"] forState:UIControlStateSelected];
    
    //设置边框
    textViewProfile.layer.borderWidth = 1;
    textViewProfile.layer.borderColor = [UIColor colorWithRed:216/255.0 green:216/255.0 blue:216/255.0 alpha:1].CGColor;
    textViewProfile.text = @"请输入对球队的简介……";
    textViewProfile.textColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1];
    textViewProfile.font = [UIFont fontWithName:@"Arial" size:14];
    //设置代理
    textViewProfile.delegate = self;
    
    //设置view单击事件
    //单击手势
    UITapGestureRecognizer *sinTapGesture5= [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(sinTapView:)];
    [view5 addGestureRecognizer:sinTapGesture5];
    UITapGestureRecognizer *sinTapGesture7= [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(sinTapView:)];
    [view7 addGestureRecognizer:sinTapGesture7];
    UITapGestureRecognizer *sinTapGesture9= [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(sinTapView:)];
    [view9 addGestureRecognizer:sinTapGesture9];
    UITapGestureRecognizer *sinTapGesture11= [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(sinTapView:)];
    [view11 addGestureRecognizer:sinTapGesture11];
    //任何人 需审核
    UITapGestureRecognizer *sinTapGestureEvery= [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(sinTapView:)];
    [viewEveryOne addGestureRecognizer:sinTapGestureEvery];
    UITapGestureRecognizer *sinTapGestureNeed= [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(sinTapView:)];
    [viewNeed addGestureRecognizer:sinTapGestureNeed];
    //球队所在地
    UITapGestureRecognizer *sinTapGestureLocation= [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(sinTapView:)];
    [viewSportLocation addGestureRecognizer:sinTapGestureLocation];
    //点击了设置球队头像
    UITapGestureRecognizer *sinTapGestureHeadImg= [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(sinTapView:)];
    [viewHeadImg addGestureRecognizer:sinTapGestureHeadImg];
    
    
    //设置textField
    textFieldSportName.delegate = self;
    [textFieldSportName setValue:[UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1] forKeyPath:@"_placeholderLabel.textColor"];
}


//按钮执行方法
-(IBAction)clickBtn:(id)sender
{
    UIButton *tmpBtn = (UIButton *)sender;
    
    if (tmpBtn.tag == 10 )
    {
        [self.navigationController popViewControllerAnimated:YES];
    }else if (tmpBtn.tag == 11)
    {
        //点击了提交按钮
        [self postSureButton];
        
    }else if (tmpBtn.tag == 12)
    {
        //点击了5人制
        [button5People setSelected:YES];
        [button7People setSelected:NO];
        [button9People setSelected:NO];
        [button11People setSelected:NO];
        
    }else if (tmpBtn.tag == 13)
    {
        //点击了7人制
        [button5People setSelected:NO];
        [button7People setSelected:YES];
        [button9People setSelected:NO];
        [button11People setSelected:NO];
        
    }else if (tmpBtn.tag == 14)
    {
        //点击了9人制
        [button5People setSelected:NO];
        [button7People setSelected:NO];
        [button9People setSelected:YES];
        [button11People setSelected:NO];
        
    }else if (tmpBtn.tag ==15)
    {
        //点击了11人制
        [button5People setSelected:NO];
        [button7People setSelected:NO];
        [button9People setSelected:NO];
        [button11People setSelected:YES];
        
    }else if (tmpBtn.tag == 16)
    {
        //点击了任意人验证
        [buttonAnybody setSelected:YES];
        [buttonNeedVerify setSelected:NO];
        
    }else if (tmpBtn.tag ==17)
    {
        //点击了需审核
        [buttonAnybody setSelected:NO];
        [buttonNeedVerify setSelected:YES];
    }
    
    
}


//开始编辑的时候
- (void)textViewDidBeginEditing:(UITextView *)textView
{
    //开始编辑的时候，整体视图上移
    self.view.frame = CGRectMake(0, -250, SCREEN_WIDTH, SCREEN_HEIGHT);
    
    //需要判断字
    if ([textViewProfile.text isEqualToString:@"请输入对球队的简介……"]) {
        textViewProfile.text = @"";
        textViewProfile.textColor = [UIColor blackColor];
    }
    
}

// textView回车或者return返回键盘
-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if ([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        
        self.view.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
        
        return NO;
    }
    return YES;
}


//textField隐藏键盘
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    //resign keyboard
    [textFieldSportName resignFirstResponder];
    return YES;
}


//单击事件响应
-(void)sinTapView:(UITapGestureRecognizer *)sender
{
    //1.先判断点击了哪个view
    int viewTag =sender.view.tag;
    switch (viewTag) {
        case 5:
            if (flag5 == 0) {
                //设置flag
                flag5 = 1;
                //button选择状态
                [button5People setSelected:YES];
            }else
            {
                //设置flag
                flag5 = 0;
                //button选择状态
                [button5People setSelected:NO];
            }
            break;
        case 7:
            if (flag7 == 0) {
                //设置flag
                flag7 = 1;
                //button选择状态
                [button7People setSelected:YES];
            }else
            {
                //设置flag
                flag7 = 0;
                //button选择状态
                [button7People setSelected:NO];
            }
            break;
        case 9:
            if (flag9 == 0) {
                //设置flag
                flag9 = 1;
                //button选择状态
                [button9People setSelected:YES];
            }else
            {
                //设置flag
                flag9 = 0;
                //button选择状态
                [button9People setSelected:NO];
            }
            break;
        case 11:
            if (flag11 == 0) {
                //设置flag
                flag11 = 1;
                //button选择状态
                [button11People setSelected:YES];
            }else
            {
                //设置flag
                flag11 = 0;
                //button选择状态
                [button11People setSelected:NO];
            }
            break;
        case 15:
            flagChoice = 0;
            [buttonAnybody setSelected:YES];
            [buttonNeedVerify setSelected:NO];
            break;
        case 16:
            flagChoice = 1;
            [buttonAnybody setSelected:NO];
            [buttonNeedVerify setSelected:YES];
            break;
        case 17:
            [self pushToProvince];
            break;
        case 18:
            [self localPhoto];
            break;
        default:
            break;
    }
    
}

//跳往选择省份页面
-(void) pushToProvince
{
    ChoiceProvinceViewController *choiceProvinceViewController = [[ChoiceProvinceViewController alloc] init];
    choiceProvinceViewController.receiveFlag = 2;
    [self.navigationController pushViewController:choiceProvinceViewController animated:YES];
    
}

//打开本地相册
-(void) localPhoto
{
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    imagePicker.delegate = self;
    [self presentViewController:imagePicker animated:YES completion:^{}];
}

//选取一张图片
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    //关闭相册
    [self dismissViewControllerAnimated:YES completion:nil];
    imageHead = [info  objectForKey:@"UIImagePickerControllerOriginalImage"];
    
    //接着跳往剪切图片页面
    [self performSelector:@selector(toImageCrop:) withObject:self afterDelay:.2];
    
}

- (void)toImageCrop:(id)sender
{
    ImageCropViewController *imageCropViewController = [[ImageCropViewController alloc] init];
    //将图片对象传过去
    imageCropViewController.reveivedImg = imageHead;
    imageCropViewController.delegate = self;
    [self.navigationController pushViewController:imageCropViewController animated:YES];
}

//代理回来
- (void)receveiImageWhenBack:(UIImage *)images
{
    NSLog(@"剪切回来");
    imageViewHeadImg.image = images;
    [imageViewHeadImg setContentMode:UIViewContentModeScaleAspectFit];
    
}

//处理提交按钮
-(void) postSureButton
{
    //组json字符串数据
    NSMutableDictionary *postData = [[NSMutableDictionary alloc] init];
    if (textFieldSportName.text.length > 15) {
        //创建球队
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示" message:@"球队名称不能超过15个字，谢谢！" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
        [alert show];
        return;
    }
    
    [postData setValue:textFieldSportName.text forKey:@"teamname"];
    [postData setValue:[UserData getUserData].loginAccount forKey:@"teamleaderusrrnm"];
    [postData setValue:@"510100" forKey:@"oftencity"];
    [postData setValue:@"510122" forKey:@"oftendistinct"];
    
    //人数类型:5 7 9 11
    NSString *flagActivity = @"";
    if (flag5 == 1) {
        flagActivity = [flagActivity stringByAppendingString:@"5"];
    }
    if (flag7 == 1)
    {
        flagActivity = [flagActivity stringByAppendingString:@"7"];
    }
    if (flag9 == 1)
    {
        flagActivity = [flagActivity stringByAppendingString:@"9"];
    }
    if (flag11 == 1)
    {
        flagActivity = [flagActivity stringByAppendingString:@"11"];
    }
    [postData setValue:flagActivity forKey:@"oftensoccerpernum"];
    
    //0:任何人  1:需要认证
    NSString *flagCheck = @"";
    if (flagChoice == 0) {
        flagCheck = @"0";
    }else
    {
        flagCheck = @"1";
    }
    [postData setValue:flagCheck forKey:@"joinconfig"];
    [postData setValue:textViewProfile.text forKey:@"sumary"];
    
    //取系统时间
    NSString *sysTime = [Common getSystemTime];
    NSLog(@"取到的系统时间:%@",sysTime);
    [postData setValue:sysTime forKey:@"establishdate"];
    //先提交头像，成功后会返回一个地址，填写在这里
    [postData setValue:@"www.baidu.com" forKey:@"teamlogo"];
    
    //发送请求
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [manager.requestSerializer setValue:@"application/json; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [manager POST:WEB_SERVICE_CREATETEAM parameters:postData success:^(AFHTTPRequestOperation *operation,id responseObject){
        
        NSLog(@"JSON:%@",responseObject);
        if (operation.response.statusCode == 201) {
            NSLog(@"创建成功");
            //创建成功跳往我的球队首页
            MyTeamViewController *myTeamViewController = [[MyTeamViewController alloc] init];
            [self.navigationController pushViewController:myTeamViewController animated:YES];
        }else
        {
            //创建失败
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示" message:@"创建失败" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
            [alert show];
            return;
        }
        
    }failure:^(AFHTTPRequestOperation *operation, NSError *error)
     {
         NSDictionary *dic2 = operation.responseObject;
         NSString *showMessage = [dic2 objectForKey:@"customMessage"];
         
         if (operation.response.statusCode == 404) {
             //认证失败
             UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示" message:showMessage delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
             [alert show];
         }else if (operation.response.statusCode == 500)
         {
             //服务器内部错误
             UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示" message:showMessage delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
             [alert show];
         }else
         {
             //默认错误
             UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示" message:showMessage delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
             [alert show];
         }
     }
     ];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
