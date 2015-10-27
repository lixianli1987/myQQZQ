//
//  ChatViewController.m
//  QQZQ
//
//  Created by cafuc on 15/8/25.
//  Copyright (c) 2015年 cafuc. All rights reserved.
//

#import "ChatViewController.h"
#import "MailListViewController.h"

@interface ChatViewController ()

@end

@implementation ChatViewController

@synthesize viewMailList;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //选择地区上加个手势
    UITapGestureRecognizer *sinTapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(sinTapView:)];
    [viewMailList addGestureRecognizer:sinTapGesture];
}


//单击手势
-(void)sinTapView:(UITapGestureRecognizer *)sender
{
    //跳往选择省会页面
    MailListViewController *mailListViewController = [[MailListViewController alloc] init];
    [self.navigationController pushViewController:mailListViewController animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
