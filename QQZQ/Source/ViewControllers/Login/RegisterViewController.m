//
//  RegisterViewController.m
//  QQZQ
//
//  Created by cafuc on 15/8/26.
//  Copyright (c) 2015年 cafuc. All rights reserved.
//

#import "RegisterViewController.h"
#import <SMS_SDK/SMS_SDK.h>
#import "AFNetworking.h"
#import "WebServiceHost.h"
#import "ChoiceProvinceViewController.h"
#import "HomePageViewController.h"


@interface RegisterViewController ()<UITextFieldDelegate>

@end

@implementation RegisterViewController

@synthesize buttonBack;
@synthesize labelCity;
@synthesize viewCity;
@synthesize textFieldTelephone;
@synthesize textFieldYZM;
@synthesize buttonYZM;
@synthesize textFieldPassword;
@synthesize textFieldPasswordTwo;
@synthesize buttonProtocol;
@synthesize viewRegister;
@synthesize buttonRegister;



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //选择地区上加个手势
    UITapGestureRecognizer *sinTapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(sinTapView:)];
    [viewCity addGestureRecognizer:sinTapGesture];
    
    //注册view设置边角
    //设置边角
    viewRegister.layer.cornerRadius = 6;
    viewRegister.layer.masksToBounds = YES;
    viewRegister.layer.borderWidth = 1;
    viewRegister.layer.borderColor = [UIColor colorWithRed:26/255.0 green:178/255.0 blue:10/255.0 alpha:1.0].CGColor;
    
    //设置代理
    textFieldTelephone.delegate = self;
    //这里有个隐藏的bug，软键盘会报错
    textFieldTelephone.keyboardType = UIKeyboardTypeNumberPad;
    textFieldYZM.delegate = self;
    textFieldYZM.keyboardType = UIKeyboardTypeNumberPad;
    textFieldPassword.delegate = self;
    textFieldPassword.keyboardType = UIKeyboardTypeDefault;
    textFieldPasswordTwo.delegate = self;
    textFieldPasswordTwo.keyboardType = UIKeyboardTypeDefault;
    
}

//响应按钮方法
-(IBAction)clickBtn:(id)sender
{
    UIButton *tmpBtn = (UIButton *)sender;
    
    if (tmpBtn.tag == 10) {
        NSLog(@"点击了返回按钮");
        [self.navigationController popViewControllerAnimated:YES];
    }else if (tmpBtn.tag == 11){
        NSLog(@"点击了获取验证码");
        if (textFieldTelephone.text.length != 11) {
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示" message:@"请输入11位的手机号码" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
            [alert show];
        }else{
            //发送手机号码去拿到验证码
            [self sendYZM];
        }
    }else if (tmpBtn.tag == 12){
        NSLog(@"点击了圈圈足球协议");
    }else if (tmpBtn.tag == 13){
        
        NSLog(@"点击了注册按钮");
        [self doRegister];
    }
    
}


//发送验证码
-(void)sendYZM
{
    //手机号码
    NSString *tmpTel = textFieldTelephone.text;
    NSLog(@"发送的手机号码:%@",tmpTel);
    //发送验证码
    [SMS_SDK getVerificationCodeBySMSWithPhone:tmpTel zone:@"86" result:^(SMS_SDKError *error){
        if (!error) {
            NSLog(@"验证码发送成功");
        }else{
            UIAlertView* alert = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"codesenderrtitle", nil)
                                                            message:[NSString stringWithFormat:@"状态码：%zi ,错误描述：%@",error.errorCode,error.errorDescription]
                                                           delegate:self
                                                  cancelButtonTitle:NSLocalizedString(@"sure", nil)
                                                  otherButtonTitles:nil, nil];
            [alert show];
        }
    }];
}

//注册
-(void)doRegister
{
    //1.判断密码范围在6到18位
    if (textFieldPassword.text.length < 6 ||
        textFieldPassword.text.length >18) {
        //1.判断下密码位数的长度，6到18位
        //2.两次输入的密码不一致
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示" message:@"请输入6到18位的密码" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
        [alert show];
        return;
    }else if ((textFieldPassword.text.length == 0 || (!([textFieldPassword.text isEqualToString:textFieldPasswordTwo.text]))))
    {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示" message:@"您两次输入的密码不一致" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
        [alert show];
        return;
    }else if(([labelCity.text isEqualToString:@"请选择地区"]))
    {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示" message:@"请选择地区" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
        [alert show];
        return;
    }else
    {
        //这里判断直辖市和省份
        NSString *tmpProvince = @"";
        NSString *tmpCity     = @"";
        NSLog(@"城市的长度为:%lu",labelCity.text.length);
        if (labelCity.text.length > 2)
        {
            //省份和市都有
            tmpProvince = [labelCity.text substringToIndex:2];
            tmpCity     = [labelCity.text substringFromIndex:3];
        }else
        {
            tmpProvince = @"";
            tmpCity     = [labelCity.text substringToIndex:2];
        }
        NSLog(@"vvv:%@,%@",tmpProvince,tmpCity);
        
        //注册参数
        NSMutableDictionary *mulDic = [[NSMutableDictionary alloc] init];
        [mulDic setValue:textFieldTelephone.text forKey:@"username"];
        [mulDic setValue:textFieldPassword.text forKey:@"password"];
        [mulDic setValue:textFieldYZM.text forKey:@"verifyCode"];
        [mulDic setValue:@"510100" forKey:@"city"];
        [mulDic setValue:@"510000" forKey:@"province"];
        
        //发起请求
        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
        manager.requestSerializer = [AFJSONRequestSerializer serializer];
        manager.responseSerializer = [AFJSONResponseSerializer serializer];
        [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
        [manager.requestSerializer setValue:@"application/json; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
        [manager POST:WEB_SERVICE_GEGISTER parameters:mulDic success:^(AFHTTPRequestOperation *operation,id responseObject){
            NSLog(@"JSON:%@",responseObject);
            if (operation.response.statusCode == 200)
            {
                //登陆成功跳往首页
                HomePageViewController *homePageViewController = [[HomePageViewController alloc] init];
                [self.navigationController pushViewController:homePageViewController animated:YES];
            }else
            {
                NSString *resultMessage = [responseObject objectForKey:@"customMessage"];
                UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示" message:resultMessage delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
                [alert show];
                
            }
//            NSString *resultCode = [responseObject objectForKey:@"code"];
//            
//            NSString *resultMessage = [responseObject objectForKey:@"customMessage"];
//            NSString *tmp;
//            tmp = [resultMessage stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
//            NSLog(@"aaa:%@",tmp);
        } failure:^(AFHTTPRequestOperation *operation, NSError *error)
         {
             NSLog(@"Error:%@",error);
             NSDictionary *dic = operation.responseObject;
             NSString *showMessage = [dic objectForKey:@"customMessage"];
             
             if (operation.response.statusCode == 500)
             {
                 //服务器内部错误
                 UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示" message:showMessage delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
                 [alert show];
             }
         }
         ];
    }
    
}



//单击手势
-(void)sinTapView:(UITapGestureRecognizer *)sender
{
    //跳往选择省会页面
    ChoiceProvinceViewController *choiceProvinceViewController = [[ChoiceProvinceViewController alloc] init];
    choiceProvinceViewController.receiveFlag = 1;
    [self.navigationController pushViewController:choiceProvinceViewController animated:YES];
}

//textField隐藏键盘
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    //resign keyboard
    [textFieldTelephone resignFirstResponder];
    [textFieldYZM resignFirstResponder];
    [textFieldPassword resignFirstResponder];
    [textFieldPasswordTwo resignFirstResponder];
    return YES;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
