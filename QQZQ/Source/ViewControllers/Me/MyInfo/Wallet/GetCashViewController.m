//
//  GetCashViewController.m
//  QQZQ
//
//  Created by cafuc on 15/12/16.
//  Copyright © 2015年 cafuc. All rights reserved.
//

#import "GetCashViewController.h"
#import "RuleViewController.h"
#import "AccountViewController.h"


@interface GetCashViewController ()

@end

@implementation GetCashViewController

@synthesize labelMoney;
@synthesize textFieldMoney;
@synthesize viewAccount;
@synthesize viewRule;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //设置提现账户
    UITapGestureRecognizer *sinTapviewAccount= [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(sinTapView:)];
    [viewAccount addGestureRecognizer:sinTapviewAccount];
    //提现说明
    UITapGestureRecognizer *sinTapviewRule = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(sinTapView:)];
    [viewRule addGestureRecognizer:sinTapviewRule];
}

//单击手势
-(void)sinTapView:(UITapGestureRecognizer *)sender
{
    int viewTag =sender.view.tag;
    NSLog(@"点击了%d",viewTag);
    
    switch (viewTag) {
        case 10:
            NSLog(@"点击了设置提现账户");
            [self jumpviewAccount];
            break;
        case 11:
            NSLog(@"点击了提现账户规则说明");
            [self jumpviewRule];
            break;
        default:
            break;
    }
}

//设置提现账户
-(void) jumpviewAccount
{
    AccountViewController *accountViewController = [[AccountViewController alloc] init];
    [self.navigationController pushViewController:accountViewController animated:YES];
}

//规则说明
-(void) jumpviewRule
{
    RuleViewController *ruleViewController = [[RuleViewController alloc] init];
    [self.navigationController pushViewController:ruleViewController animated:YES];
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
    }else
    {
        NSLog(@"点击了提现按钮");
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
