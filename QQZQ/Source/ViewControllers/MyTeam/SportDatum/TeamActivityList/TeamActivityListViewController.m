//
//  TeamActivityListViewController.m
//  QQZQ
//
//  Created by cafuc on 15/10/23.
//  Copyright © 2015年 cafuc. All rights reserved.
//

#import "TeamActivityListViewController.h"
#import "SportInnerData.h"
#import "TeamActivityListTableViewCell.h"

@interface TeamActivityListViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    NSMutableArray *arrayData;
}

@end

@implementation TeamActivityListViewController

@synthesize labelTeamName;
@synthesize tableViewTeam;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //初始化数组
    arrayData = [[NSMutableArray alloc] init];
    //测试
    SportInnerData *sportInnerData = [[SportInnerData alloc] init];
    sportInnerData.imageUrl = @"www.baidu.com";
    sportInnerData.activityName = @"今晚带队砸场";
    sportInnerData.activityLocation = @"华阳中和镇";
    sportInnerData.activityTime = @"11月20日 周五 18：00";
    sportInnerData.activityType = @"11人场";
    [arrayData addObject:sportInnerData];
    
    //tableView设置代理
    tableViewTeam.delegate = self;
    tableViewTeam.dataSource = self;
    
}

//装值的个数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return arrayData.count;
}

//行高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}

//装值
- (UITableViewCell *)tableView:(UITableView *)tableViews
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"进来没");
    static NSString *identifier = @"TeamActivityListTableViewCell";
    
    TeamActivityListTableViewCell *cell = (TeamActivityListTableViewCell *)[tableViews dequeueReusableCellWithIdentifier:identifier];
    if (cell==nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:identifier owner:self options:nil]objectAtIndex:0];
    }
    
    [cell initCellData:[arrayData objectAtIndex:indexPath.row]];
    
    return cell;
    
}

//选中哪一行
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"选中第%d行",indexPath.row);
    
    //    //如果是直辖市，则直接返回注册页面
    //    RegisterViewController *registerViewController = [self.navigationController.viewControllers objectAtIndex:self.navigationController.viewControllers.count - 3];
    //    //传参数
    //    registerViewController.labelCity.text = proAndCity;
    //    registerViewController.labelCity.textColor = [UIColor blackColor];
    //    [self.navigationController popToViewController:registerViewController animated:YES];
    
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
