//
//  AccountViewController.m
//  QQZQ
//
//  Created by cafuc on 15/12/17.
//  Copyright © 2015年 cafuc. All rights reserved.
//

#import "AccountViewController.h"
#import "SetZFBViewController.h"
#import "SetYHViewController.h"


@interface AccountViewController ()

@end

@implementation AccountViewController

@synthesize viewZFB;
@synthesize viewYH;
@synthesize viewZ;
@synthesize viewY;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //支付宝账户
    UITapGestureRecognizer *sinTapviewZFB= [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(sinTapView:)];
    [viewZFB addGestureRecognizer:sinTapviewZFB];
    //银行卡账户
    UITapGestureRecognizer *sinTapviewYH= [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(sinTapView:)];
    [viewYH addGestureRecognizer:sinTapviewYH];
    //支
    UITapGestureRecognizer *sinTapviewZ= [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(sinTapView:)];
    [viewZ addGestureRecognizer:sinTapviewZ];
    //银行卡账户
    UITapGestureRecognizer *sinTapviewY= [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(sinTapView:)];
    [viewY addGestureRecognizer:sinTapviewY];
}


//单击手势
-(void)sinTapView:(UITapGestureRecognizer *)sender
{
    int viewTag =sender.view.tag;
    NSLog(@"点击了%d",viewTag);
    
    switch (viewTag) {
        case 10:
            NSLog(@"点击了支付宝账户");
            [self jumpviewZFB];
            break;
        case 11:
            NSLog(@"点击了银行卡账户");
            [self jumpviewYH];
            break;
        case 12:
            NSLog(@"点击了支");
            //[self jumpGetCash];
            break;
        case 13:
            NSLog(@"点击了银");
            //[self jumpGetCash];
            break;
        default:
            break;
    }
}


//点击了支付宝账户
-(void) jumpviewZFB
{
    SetZFBViewController *setZFBViewController = [[SetZFBViewController alloc] init];
    [self.navigationController pushViewController:setZFBViewController animated:YES];
}

//点击了银行卡账户
-(void) jumpviewYH
{
    SetYHViewController *setYHViewController = [[SetYHViewController alloc] init];
    [self.navigationController pushViewController:setYHViewController animated:YES];
}

//点击了支
-(void) jumpviewZ
{
    
}

//点击了银
-(void) jumpviewY
{
    
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
