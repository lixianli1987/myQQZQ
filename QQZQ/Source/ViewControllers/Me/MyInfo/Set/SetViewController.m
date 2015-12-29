//
//  SetViewController.m
//  QQZQ
//
//  Created by cafuc on 15/12/19.
//  Copyright © 2015年 cafuc. All rights reserved.
//

#import "SetViewController.h"

@interface SetViewController ()

@end

@implementation SetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

//按钮执行方法
-(IBAction)clickBtn:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
