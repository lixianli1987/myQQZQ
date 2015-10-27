//
//  SportNewsViewController.m
//  QQZQ
//
//  Created by cafuc on 15/10/5.
//  Copyright (c) 2015年 cafuc. All rights reserved.
//

#import "SportNewsViewController.h"

@interface SportNewsViewController ()<UITextViewDelegate>

@end

@implementation SportNewsViewController

@synthesize buttonBack;
@synthesize textViewShow;
@synthesize labelSportName;
@synthesize labelSportTime;
@synthesize receicedName;
@synthesize receivedTime;
@synthesize receivedContent;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    textViewShow.delegate = self;
    textViewShow.userInteractionEnabled = NO;
    NSLog(@"%@,%@,%@",receicedName,receivedTime,receivedContent);
    labelSportName.text = receicedName;
    labelSportTime.text = receivedTime;
    textViewShow.text = receivedContent;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//按钮执行方法
-(IBAction)clickBtn:(id)sender
{

    //返回上一级页面
    [self.navigationController popViewControllerAnimated:YES];
    
}

@end
