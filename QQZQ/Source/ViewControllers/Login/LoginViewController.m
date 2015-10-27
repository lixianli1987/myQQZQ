//
//  LoginViewController.m
//  QQZQ
//
//  Created by cafuc on 15/8/26.
//  Copyright (c) 2015年 cafuc. All rights reserved.
//

#import "LoginViewController.h"
#import "AFNetworking.h"
#import "WebServiceHost.h"
#import "RegisterViewController.h"
#import "MainViewController.h"


@interface LoginViewController ()<UITextFieldDelegate>

@end

@implementation LoginViewController


@synthesize textFieldTelephone;
@synthesize textFieldPassword;
@synthesize buttonForgot;
@synthesize buttonLogin;
@synthesize viewLogin;
@synthesize buttonregister;
@synthesize viewregister;



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //登陆边框
    viewLogin.layer.cornerRadius = 6;
    viewLogin.layer.masksToBounds = YES;
    viewLogin.layer.borderWidth = 1;
    viewLogin.layer.borderColor = [UIColor colorWithRed:26/255.0 green:178/255.0 blue:10/255.0 alpha:1.0].CGColor;
    
    //注册边框
    viewregister.layer.cornerRadius = 6;
    viewregister.layer.masksToBounds = YES;
    viewregister.layer.borderWidth = 1;
    viewregister.layer.borderColor = [UIColor colorWithRed:26/255.0 green:178/255.0 blue:10/255.0 alpha:1.0].CGColor;
    
    //代理
    textFieldTelephone.delegate = self;
    textFieldPassword.delegate  = self; 
    
}


//获取信息
-(void) getLoginInfo
{
    //http://my.oschina.net/bingshanguxue/blog/360440
    
    //组json字符串数据
    NSMutableDictionary *mulDic = [[NSMutableDictionary alloc] init];
    [mulDic setValue:textFieldTelephone.text forKey:@"username"];
    [mulDic setValue:textFieldPassword.text forKey:@"password"];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [manager.requestSerializer setValue:@"application/json; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [manager POST:WEB_SERVICE_LOGIN parameters:mulDic success:^(AFHTTPRequestOperation *operation,id responseObject){
        
        NSLog(@"JSON:%@",responseObject);
        NSDictionary *dic = operation.response.allHeaderFields;
        //取token
        NSString *token = [dic objectForKey:@"token"];
        NSLog(@"token值:%@",token);
        if (operation.response.statusCode == 200) {
            NSLog(@"登陆成功");
            
            //登陆成功加载main
            MainViewController *mainViewController = [[MainViewController alloc] init];
            [self.navigationController pushViewController:mainViewController animated:YES];
            
        }else
        {
            //登陆失败
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示" message:@"用户名或密码不正确！" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
            [alert show];
            return;
        }
        
    }failure:^(AFHTTPRequestOperation *operation, NSError *error)
     {
         //NSLog(@"error:%@",error);
         //NSDictionary *dic = operation.response.allHeaderFields;
         NSDictionary *dic2 = operation.responseObject;
         NSLog(@"body里面消息:%@",dic2);
         
         if (operation.response.statusCode == 404) {
             
             NSString *showMessage = [dic2 objectForKey:@"customMessage"];
             
             //认证失败
             UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示" message:showMessage delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
             [alert show];
         }else if (operation.response.statusCode == 500)
         {
             NSString *showMessage = [dic2 objectForKey:@"customMessage"];
             
             //服务器内部错误
             UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示" message:showMessage delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
             [alert show];
         }else
         {
             NSString *showMessage = [dic2 objectForKey:@"customMessage"];
             
             //默认错误
             UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示" message:showMessage delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
             [alert show];
         }
     }
     ];
}


//点击按钮执行方法
-(IBAction)clickBtn:(id)sender
{
    UIButton *tmpBtn = (UIButton *)sender;
    
    //点击了返回按钮
    if (tmpBtn.tag == 11)
    {
        NSLog(@"点击了忘记密码");
    }else if (tmpBtn.tag == 12)
    {
        if (textFieldTelephone.text.length == 0 || textFieldPassword.text.length == 0)
        {
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示" message:@"请输入用户名或密码！" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
            [alert show];
        }else
        {
            [self getLoginInfo];
            
        }
    }else if (tmpBtn.tag == 13)
    {
        NSLog(@"点击了注册按钮");
        RegisterViewController *registerViewController = [[RegisterViewController alloc] init];
        [self.navigationController pushViewController:registerViewController animated:YES];
    }
    
}


//textField隐藏键盘
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    //resign keyboard
    [textFieldTelephone resignFirstResponder];
    [textFieldPassword resignFirstResponder];
    return YES;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
