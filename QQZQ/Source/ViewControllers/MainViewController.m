//
//  MainViewController.m
//  QQZQ
//
//  Created by cafuc on 15/8/25.
//  Copyright (c) 2015年 cafuc. All rights reserved.
//

#import "MainViewController.h"
#import "MyUtils.h"
#import "MyTeamViewController.h"
#import "ChatViewController.h"
#import "HomePageViewController.h"
#import "MeViewController.h"


@interface MainViewController ()<UITabBarControllerDelegate>
{
    //我的球队、聊天、首页、我
    MyTeamViewController *myTeamVC;
    ChatViewController *chatVC;
    HomePageViewController *homePageVC;
    MeViewController *meVC;
    
}

@end

@implementation MainViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSLog(@"初始化进来");
    
    //设置UITabBarControllerDelegate
    self.delegate = self;
    
    //tabBar装子视图
    [self setUpSubViews];
    
    //初始化时显示第0页
    self.selectedIndex = 0;
    
}

//装子视图
-(void) setUpSubViews
{
    //我的球队
    myTeamVC = [[MyTeamViewController alloc] init];
    myTeamVC.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"我的球队" image:[[UIImage imageNamed: @"tab1"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed: @"tab2"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [self unSelectedTapTabBarItems:myTeamVC.tabBarItem];
    [self selectedTapTabBarItems:myTeamVC.tabBarItem];
    
    
    //聊天
    chatVC = [[ChatViewController alloc] init];
    chatVC.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"聊天" image:[[UIImage imageNamed: @"tab3"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed: @"tab4"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [self unSelectedTapTabBarItems:chatVC.tabBarItem];
    [self selectedTapTabBarItems:chatVC.tabBarItem];
    
    
    //首页
    homePageVC = [[HomePageViewController alloc] init];
    homePageVC.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"发现" image:[[UIImage imageNamed: @"tab5"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed: @"tab6"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [self unSelectedTapTabBarItems:homePageVC.tabBarItem];
    [self selectedTapTabBarItems:homePageVC.tabBarItem];
    
    
    //我
    meVC = [[MeViewController alloc] init];
    meVC.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"我" image:[[UIImage imageNamed: @"tab7"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed: @"tab8"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [self unSelectedTapTabBarItems:meVC.tabBarItem];
    [self selectedTapTabBarItems:meVC.tabBarItem];

    //将四个controller装进tabbar
    self.viewControllers = @[myTeamVC,chatVC,homePageVC,meVC];
    
    //这里设置tag值
    myTeamVC.tabBarItem.tag = 0;
    chatVC.tabBarItem.tag = 1;
    homePageVC.tabBarItem.tag = 2;
    meVC.tabBarItem.tag = 3;

    
}


#pragma mark - UITabBarDelegate
//点击首页下面的按钮切换
-(void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
    if (item.tag == 0) {
        NSLog(@"111");

    }else if (item.tag == 1)
    {
        //先判断状态是不是已登录
        NSLog(@"222");
    }else if (item.tag == 2)
    {
        //先判断状态是不是已登录
        NSLog(@"333");
    }else if (item.tag == 3)
    {
        //先判断状态是不是已登录
        NSLog(@"444");
    }
}


//改变选中和没选中的颜色
-(void)unSelectedTapTabBarItems:(UITabBarItem *)tabBarItem
{
    [tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                        [UIFont systemFontOfSize:14], NSFontAttributeName,[UIColor colorWithRed:140/255.0 green:140/255.0 blue:140/255.0 alpha:(1)],NSForegroundColorAttributeName,
                                        nil] forState:UIControlStateNormal];
}

-(void)selectedTapTabBarItems:(UITabBarItem *)tabBarItem
{
    [tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                        [UIFont systemFontOfSize:14],
                                        NSFontAttributeName,[UIColor colorWithRed:7/255.0 green:31/255.0 blue:67/255.0 alpha:(1)],NSForegroundColorAttributeName,
                                        nil] forState:UIControlStateSelected];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
