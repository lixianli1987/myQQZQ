//
//  ChoiceSportTeamViewController.m
//  QQZQ
//
//  Created by cafuc on 15/10/2.
//  Copyright (c) 2015年 cafuc. All rights reserved.
//

#import "ChoiceSportTeamViewController.h"
#import "FindViewTableViewCell.h"
#import "FindViewData.h"
#import "InitiateViewController.h"
#import "AFNetworking.h"
#import "WebServiceHost.h"
#import "UserData.h"
#import "MyTeamData.h"
#import "MyUtils.h"
#import "Common.h"


@interface ChoiceSportTeamViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    //请求到的所有的数据
     NSMutableArray *arrayAllData;
    //装进加载数组的数据
    NSMutableArray *arrayData;
}

@end

@implementation ChoiceSportTeamViewController

//@synthesize buttonBack;
@synthesize tableViewSports;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //请求数据
    [self getMyTeamData];
    
    //tableView设置代理
    tableViewSports.delegate = self;
    tableViewSports.dataSource = self;
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
    static NSString *identifier = @"FindViewTableViewCell";
    
    FindViewTableViewCell *cell = (FindViewTableViewCell *)[tableViews dequeueReusableCellWithIdentifier:identifier];
    if (cell==nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:identifier owner:self options:nil]objectAtIndex:0];
    }
    
    [cell initCellData:[arrayData objectAtIndex:indexPath.row]];
    
    return cell;
    
}

//选中哪一行
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"选中第%ld行",(long)indexPath.row);
    
    
    //如果是直辖市，则直接返回注册页面
    InitiateViewController *initiateViewController = [self.navigationController.viewControllers objectAtIndex:self.navigationController.viewControllers.count - 2];
    
    //创建一个label 显示在view2上
    initiateViewController.labelSportName.text = ((FindViewData *)(arrayData[indexPath.row])).teamName;
    [initiateViewController.labelSportName setHidden:NO];
    
    [self.navigationController popToViewController:initiateViewController animated:YES];
    
    
}


//请求球队管理数据
-(void) getMyTeamData
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [manager.requestSerializer setValue:@"application/json; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [manager GET:WEB_SERVICE_GETMYSPORTTEAM([UserData getUserData].loginAccount) parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         if (operation.response.statusCode == 200)
         {
             arrayAllData = [[NSMutableArray alloc] init];
             NSArray *arrayDataRespose = operation.responseObject;
             
             //循环取数据
             for (int i = 0; i < arrayDataRespose.count; i++) {
                 
                 NSDictionary *tmpDic = [[NSDictionary alloc] init];
                 tmpDic = [arrayDataRespose objectAtIndex:i];
                 
                 MyTeamData *teamDta = [[MyTeamData alloc] init];
                 
                 NSString *tmpId = [tmpDic objectForKey:@"id"];
                 teamDta.numId = [NSString stringWithFormat:@"%@",tmpId];
                 teamDta.teamname = [tmpDic objectForKey:@"teamname"];
                 teamDta.teamno = [tmpDic objectForKey:@"teamno"];
                 teamDta.oftencity = [tmpDic objectForKey:@"oftencity"];
                 teamDta.oftendistinct = [tmpDic objectForKey:@"oftendistinct"];
                 teamDta.oftensoccerpernum = [tmpDic objectForKey:@"oftensoccerpernum"];
                 teamDta.joinconfig = [tmpDic objectForKey:@"joinconfig"];
                 teamDta.sumary = [tmpDic objectForKey:@"sumary"];
                 //获取创建时间
                 NSString *time = [tmpDic objectForKey:@"establishdate"];
                 long long timeLong = [time longLongValue];
                 NSString *changeTime = [Common changeTimeIntervalToSysTime:timeLong];
                 teamDta.establishdate = changeTime;
                 
                 teamDta.teamleadernm = [tmpDic objectForKey:@"teamleadernm"];
                 teamDta.teamleaderusrrnm = [tmpDic objectForKey:@"teamleaderusrrnm"];
                 teamDta.teamleaderqqid = [tmpDic objectForKey:@"teamleaderqqid"];
                 teamDta.teamlogo = [tmpDic objectForKey:@"teamlogo"];
                 teamDta.actcount = [tmpDic objectForKey:@"actcount"];
                 teamDta.teamscore = [tmpDic objectForKey:@"teamscore"];
                 teamDta.stat = [tmpDic objectForKey:@"stat"];
                 teamDta.flag = [tmpDic objectForKey:@"flag"];
                 teamDta.createdate = [tmpDic objectForKey:@"createdate"];
                 teamDta.updatedate = [tmpDic objectForKey:@"updatedate"];
                 teamDta.teambalance = [tmpDic objectForKey:@"teambalance"];
                 teamDta.teamrule = [tmpDic objectForKey:@"teamrule"];
                 
                 [arrayAllData addObject:teamDta];
             }
             
             //转换数据
             [self turnToData];
             
             //请求完数据后，在加载tableview
             [tableViewSports reloadData];
             
             
         }else
         {
             UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示" message:NO_MORE_DATA delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
             [alert show];
         }
         
     }failure:^(AFHTTPRequestOperation *operation, NSError *error)
     {
         NSDictionary *dic = operation.responseObject;
         NSString *showMessage = [dic objectForKey:@"customMessage"];
         
         //显示失败信息
         UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示" message:showMessage delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
         [alert show];
     }
     ];
    
}


//转换数据到需要的数组
-(void) turnToData
{
    //初始化cell数组
    arrayData = [[NSMutableArray alloc] init];
    
    for (int i = 0 ; i < arrayAllData.count; i++) {
        
        FindViewData *findViewData = [[FindViewData alloc] init];
        findViewData.imageUrl = ((MyTeamData *)arrayAllData[i]).teamlogo;
        findViewData.teamName = ((MyTeamData *)arrayAllData[i]).teamname;
        findViewData.teamLeader = ((MyTeamData *)arrayAllData[i]).teamleaderusrrnm;
        findViewData.teamNumber = ((MyTeamData *)arrayAllData[i]).numId;
        findViewData.establishTime = ((MyTeamData *)arrayAllData[i]).establishdate;
        [arrayData addObject:findViewData];
    }
    
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
