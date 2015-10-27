//
//  TeamConstitutionViewController.m
//  QQZQ
//
//  Created by cafuc on 15/10/7.
//  Copyright (c) 2015年 cafuc. All rights reserved.
//

#import "TeamConstitutionViewController.h"

@interface TeamConstitutionViewController ()

@end

@implementation TeamConstitutionViewController

@synthesize buttonBack;
@synthesize buttonInvite;
@synthesize textViewZC;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //装值
    textViewZC.text = @"是大法官会尽快尽快了是大法官好久考试的风格好久卡上的法规和健康是大法官货架上的法规和健康是地方刚回家啊只是地方刚回家啥地方干活就卡死的法规和卷卡式带法国红酒阿斯顿法国航空路维尔体育I型吃饭刚回家看书的分工会尽快";
    textViewZC.userInteractionEnabled = NO;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//按钮执行方法
-(IBAction)clickBtn:(id)sender
{
    UIButton *tmpBtn = (UIButton *)sender;
    switch (tmpBtn.tag) {
        case 10:
            NSLog(@"点击了返回按钮");
            [self.navigationController popViewControllerAnimated:YES];
            break;
        case 11:
            NSLog(@"点击了发布按钮");
            break;
        default:
            break;
    }
}


@end
