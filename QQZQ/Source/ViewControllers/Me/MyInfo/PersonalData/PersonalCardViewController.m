//
//  PersonalCardViewController.m
//  QQZQ
//
//  Created by cafuc on 15/12/2.
//  Copyright © 2015年 cafuc. All rights reserved.
//

#import "PersonalCardViewController.h"

@interface PersonalCardViewController ()

@end

@implementation PersonalCardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}



//按钮执行方法
-(IBAction)clickBtn:(id)sender
{
    
    //返回上一级页面
    [self.navigationController popViewControllerAnimated:YES];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
