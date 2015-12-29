//
//  FindViewController.m
//  QQZQ
//
//  Created by cafuc on 15/9/5.
//  Copyright (c) 2015年 cafuc. All rights reserved.
//

#import "FindViewController.h"
#import "FindViewTableViewCell.h"
#import "FindViewData.h"
#import "AFNetworking.h"
#import "WebServiceHost.h"
#import "UserData.h"
#import "MyTeamData.h"
#import "MyUtils.h"
#import "Common.h"


@interface FindViewController ()<UISearchBarDelegate,UITableViewDelegate,UITableViewDataSource>
{
    //服务器请求回来的数据
    NSMutableArray *arrayAllMyData;
    
    //需要加载的数据
    NSMutableArray *arrayData;
    
    //查询球队数组
    NSMutableArray *arraySearchData;
}

@end

@implementation FindViewController

@synthesize searchBarMy;
@synthesize tableView;



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self getTeamData];
    
    //设置代理
    tableView.delegate = self;
    tableView.dataSource = self;
    searchBarMy.delegate = self;
    
}

//请求球队管理数据
-(void) getTeamData
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [manager.requestSerializer setValue:@"application/json; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    NSLog(@"地址:%@",WEB_SERVICE_GETMYSPORTTEAM([UserData getUserData].loginAccount));
    [manager GET:WEB_SERVICE_GETMYSPORTTEAM([UserData getUserData].loginAccount) parameters:nil success:^(AFHTTPRequestOperation *operation,id responseObject)
     {
         NSLog(@"eee");
         if (operation.response.statusCode == 200)
         {
             NSLog(@"hhh");
             arrayAllMyData = [[NSMutableArray alloc] init];
             
            NSArray *arrayDataTmp = operation.responseObject;
             for (int i = 0; i < arrayDataTmp.count; i++)
             {
                 NSDictionary *tmpDic = [[NSDictionary alloc] init];
                 tmpDic = [arrayDataTmp objectAtIndex:i];
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
                 
                 [arrayAllMyData addObject:teamDta];
             }
             
             [self turnToData];
             //重新加载数据
             [tableView reloadData];
             
         }
         
     }failure:^(AFHTTPRequestOperation *operation,NSError *error)
     {
         NSLog(@"dddddd");
         
     }];
}


//转换数据到需要的数组
-(void) turnToData
{
    //初始化cell数组
    arrayData = [[NSMutableArray alloc] init];
    
    for (int i = 0 ; i < arrayAllMyData.count; i++) {
        
        FindViewData *findViewData = [[FindViewData alloc] init];
        findViewData.imageUrl = ((MyTeamData *)arrayAllMyData[i]).teamlogo;
        findViewData.teamName = ((MyTeamData *)arrayAllMyData[i]).teamname;
        findViewData.teamLeader = ((MyTeamData *)arrayAllMyData[i]).teamleaderusrrnm;
        findViewData.teamNumber = ((MyTeamData *)arrayAllMyData[i]).numId;
        findViewData.establishTime = ((MyTeamData *)arrayAllMyData[i]).establishdate;
        [arrayData addObject:findViewData];
    }
    
}

//转换数据到需要的数组
-(void) turnToData2
{
    //初始化cell数组
    arrayData = [[NSMutableArray alloc] init];
    
    for (int i = 0 ; i < arraySearchData.count; i++) {
        
        FindViewData *findViewData = [[FindViewData alloc] init];
        findViewData.imageUrl = ((MyTeamData *)arrayAllMyData[i]).teamlogo;
        findViewData.teamName = ((MyTeamData *)arrayAllMyData[i]).teamname;
        findViewData.teamLeader = ((MyTeamData *)arrayAllMyData[i]).teamleaderusrrnm;
        findViewData.teamNumber = ((MyTeamData *)arrayAllMyData[i]).numId;
        findViewData.establishTime = ((MyTeamData *)arrayAllMyData[i]).establishdate;
        [arrayData addObject:findViewData];
    }
    
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
    NSLog(@"选中第%d行",indexPath.row);
    
//    //如果是直辖市，则直接返回注册页面
//    RegisterViewController *registerViewController = [self.navigationController.viewControllers objectAtIndex:self.navigationController.viewControllers.count - 3];
//    //传参数
//    registerViewController.labelCity.text = proAndCity;
//    registerViewController.labelCity.textColor = [UIColor blackColor];
//    [self.navigationController popToViewController:registerViewController animated:YES];
    
}


//点击了search按钮搜索
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    NSLog(@"cc:%@",searchBarMy.text);
    [self searchTeamData:searchBarMy.text];
    [self textFieldShouldReturn:searchBarMy];
}

//查询结果
//请求球队管理数据
-(void) searchTeamData:(NSString *)searchContent
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [manager.requestSerializer setValue:@"application/json; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    NSLog(@"查询球队地址:%@",WEB_SERVICE_FIND_SPORTTEAM([UserData getUserData].loginAccount,searchContent));
    [manager GET:WEB_SERVICE_FIND_SPORTTEAM([UserData getUserData].loginAccount,searchContent) parameters:nil success:^(AFHTTPRequestOperation *operation,id responseObject)
     {
         NSLog(@"eee");
         if (operation.response.statusCode == 200)
         {
             NSLog(@"hhh");
             arraySearchData = [[NSMutableArray alloc] init];
             
             NSArray *arrayDataTmp = operation.responseObject;
             for (int i = 0; i < arrayDataTmp.count; i++)
             {
                 NSDictionary *tmpDic = [[NSDictionary alloc] init];
                 tmpDic = [arrayDataTmp objectAtIndex:i];
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
                 
                 [arraySearchData addObject:teamDta];
             }
             
             [self turnToData2];
             //重新加载数据
             [tableView reloadData];
             
         }else
         {
             NSLog(@"测试");
         }
         
     }failure:^(AFHTTPRequestOperation *operation,NSError *error)
     {
         NSLog(@"dddddd");
         
     }];
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


//点击了空白处将键盘隐藏
- (BOOL)textFieldShouldReturn:(UISearchBar *)textField
{
    //resign keyboard
    NSLog(@"wwww");
    [searchBarMy resignFirstResponder];
    
    return YES;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
