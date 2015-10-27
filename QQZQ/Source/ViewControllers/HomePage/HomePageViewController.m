//
//  HomePageViewController.m
//  QQZQ
//
//  Created by cafuc on 15/8/25.
//  Copyright (c) 2015年 cafuc. All rights reserved.
//

#import "HomePageViewController.h"
#import "ProvinceLocationViewController.h"
#import "PublicActivityViewController.h"
#import "LookForFootballCourtViewController.h"
#import "SportRankListViewController.h"



@interface HomePageViewController ()

@end

@implementation HomePageViewController

@synthesize buttonLocation;
@synthesize buttonPublicActivity;
@synthesize buttonLookForFootballCourt;
@synthesize buttonSportRankList;


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
        NSLog(@"点击了选择城市");
        ProvinceLocationViewController *provinceLocationViewController = [[ProvinceLocationViewController alloc] init];
        [self.navigationController pushViewController:provinceLocationViewController animated:YES];
    }else if (tmpBtn.tag == 12) {
        NSLog(@"点击了公开活动");
        PublicActivityViewController *publicActivityViewController = [[PublicActivityViewController alloc] init];
        [self.navigationController pushViewController:publicActivityViewController animated:YES];
    }else if (tmpBtn.tag == 13) {
        NSLog(@"点击了找球队");
        LookForFootballCourtViewController *lookForFootballCourtViewController = [[LookForFootballCourtViewController alloc] init];
        [self.navigationController pushViewController:lookForFootballCourtViewController animated:YES];
    }else if (tmpBtn.tag == 14) {
        NSLog(@"点击了球队排行榜");
        SportRankListViewController *sportRankListViewController = [[SportRankListViewController alloc] init];
        [self.navigationController pushViewController:sportRankListViewController animated:YES];
    }

    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
