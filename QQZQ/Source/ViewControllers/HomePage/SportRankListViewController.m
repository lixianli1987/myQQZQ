//
//  SportRankListViewController.m
//  QQZQ
//
//  Created by cafuc on 15/9/5.
//  Copyright (c) 2015年 cafuc. All rights reserved.
//

#import "SportRankListViewController.h"

@interface SportRankListViewController ()

@end

@implementation SportRankListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

//按钮执行方法
-(IBAction)clickBtn:(id)sender
{
    UIButton *tmpBtn = (UIButton *)sender;
    
    //tag = 10
    //点击了返回按钮
    if (tmpBtn.tag == 10) {
        NSLog(@"点击了返回按钮");
        [self.navigationController popViewControllerAnimated:YES];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
