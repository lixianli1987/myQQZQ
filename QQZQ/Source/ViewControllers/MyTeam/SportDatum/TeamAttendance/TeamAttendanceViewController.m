//
//  TeamAttendanceViewController.m
//  QQZQ
//
//  Created by cafuc on 15/10/24.
//  Copyright © 2015年 cafuc. All rights reserved.
//

#import "TeamAttendanceViewController.h"
#import "MyUtils.h"
#import "AttendanceManageTableViewCell.h"
#import "AttendenceManageData.h"
#import "AttendenceRateTableViewCell.h"
#import "AttendenceStatistics.h"
#import "AttendenceDetailViewController.h"


@interface TeamAttendanceViewController ()<UIScrollViewDelegate,UITableViewDelegate,UITableViewDataSource>
{
    //选中基本信息时的下划线
    UIView *viewH2;
    
    //出勤管理cell的数据
    NSMutableArray *arrayData;
    //出勤统计cell的数据
    NSMutableArray *arrayStaticsData;
    
    //flag 0:表示出勤管理 1：出勤统计
    int flag;
    
    //成员
    UILabel *phoneName;
    //参赛次数
    UILabel *paticipantTimes;
    //出勤率
    UILabel *attendanceRate;
    
}

@end

@implementation TeamAttendanceViewController

@synthesize buttonAttendanceManagement;
@synthesize buttonAttendanceStatistics;
@synthesize scrollViewAll;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //设置代理
    scrollViewAll.delegate = self;
    //翻页
    scrollViewAll.pagingEnabled = YES;
    //设置内容大小
    scrollViewAll.contentSize = CGSizeMake(SCREEN_WIDTH*2, SCREEN_HEIGHT-110);
    NSLog(@"初始化:%f",scrollViewAll.contentOffset.x);
    
    /*************初始化基本信息颜色*****/
    [buttonAttendanceManagement setSelected:YES];
    [buttonAttendanceManagement setTitleColor:[UIColor colorWithRed:0/255.0 green:175/255.0 blue:0/255.0 alpha:1] forState:UIControlStateSelected];
    
    [buttonAttendanceStatistics setSelected:NO];
    [buttonAttendanceStatistics setTitleColor:[UIColor colorWithRed:0/255.0 green:175/255.0 blue:0/255.0 alpha:1] forState:UIControlStateSelected];
    
    /*****************************横线*****************************/
    //初始化进来设置
    viewH2 = [[UIView alloc] initWithFrame:CGRectMake(0, 108, SCREEN_WIDTH/2, 2)];
    viewH2.backgroundColor = [UIColor colorWithRed:0/255.0 green:175/255.0 blue:0/255.0 alpha:1];
    [self.view addSubview:viewH2];
    
    
    /*************************请求数据************************************/
    //初始化数组
    arrayData = [[NSMutableArray alloc] init];
    AttendenceManageData *attendenceManageData = [[AttendenceManageData alloc] init];
    attendenceManageData.attendenceName = @"巴士公交比赛";
    attendenceManageData.attendenceTime = @"2015年11月06日";
    attendenceManageData.attendenceNum = @"11人";
    attendenceManageData.attendenceRealNum = @"10人";
    [arrayData addObject:attendenceManageData];
    
    
    /*********************出勤管理************************/
    [self attendanceManagementView];
    /*****************************出勤统计*****************************/
    //[self attendanceStatisticsView];
}

//出勤管理
-(void) attendanceManagementView
{
    flag = 0;
    //基本信息view
    UIView *viewAttendanceManagement = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-110)];
    viewAttendanceManagement.backgroundColor = [UIColor clearColor];
    [scrollViewAll addSubview:viewAttendanceManagement];
    
    //tableview
    UITableView *tableViewManage = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-110)];
    //设置代理
    tableViewManage.delegate = self;
    tableViewManage.dataSource = self;
    [tableViewManage registerNib:[UINib nibWithNibName:@"AttendanceManageTableViewCell" bundle:nil]forCellReuseIdentifier:@"AttendanceManageTableViewCell"];
    [viewAttendanceManagement addSubview:tableViewManage];
    
}


//出勤统计
-(void) attendanceStatisticsView
{
    //相册view
    UIView *viewAttendanceStatistics = [[UIView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH, 0, SCREEN_WIDTH, SCREEN_HEIGHT-110)];
    viewAttendanceStatistics.backgroundColor = [UIColor clearColor];
    [scrollViewAll addSubview:viewAttendanceStatistics];
    
    //成员
    if (phoneName.frame.size.width != 30) {
    phoneName = [[UILabel alloc] initWithFrame:CGRectMake(15, 10, 30, 21)];
    //phoneName.backgroundColor = [UIColor redColor];
    phoneName.text = @"成员";
    phoneName.font = [UIFont systemFontOfSize:14];
    [viewAttendanceStatistics addSubview:phoneName];
    }
    
    //参赛次数
    if (paticipantTimes.frame.size.width != 60) {
    paticipantTimes = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH*0.55, 10, 60, 21)];
    //phoneName.backgroundColor = [UIColor redColor];
    paticipantTimes.text = @"参赛次数";
    paticipantTimes.font = [UIFont systemFontOfSize:14];
    [viewAttendanceStatistics addSubview:paticipantTimes];
    }

    //出勤率
    if (attendanceRate.frame.size.width != 60) {
    attendanceRate = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH*0.8, 10, 60, 21)];
    //phoneName.backgroundColor = [UIColor redColor];
    attendanceRate.text = @"出勤率";
    attendanceRate.font = [UIFont systemFontOfSize:14];
    [viewAttendanceStatistics addSubview:attendanceRate];
    }
    
    //横线
    UIView *viewHnegxian = [[UIView alloc] initWithFrame:CGRectMake(0, 41, SCREEN_WIDTH, 1)];
    viewHnegxian.backgroundColor = [UIColor colorWithRed:216/255.0 green:216/255.0 blue:216/255.0 alpha:1];
    [viewAttendanceStatistics addSubview:viewHnegxian];
    
    /******加载数据*******/
    //初始化数组
    arrayStaticsData = [[NSMutableArray alloc] init];
    AttendenceStatistics *attendenceStatistics = [[AttendenceStatistics alloc] init];
    attendenceStatistics.imageUrl = @"www.baidu.com";
    attendenceStatistics.name = @"阿峰";
    attendenceStatistics.times = @"85";
    attendenceStatistics.paticipantRate = @"85%";
    [arrayStaticsData addObject:attendenceStatistics];
    
    flag = 1;
    
    //tableview
    UITableView *tableViewStatic = [[UITableView alloc] initWithFrame:CGRectMake(0, 42, SCREEN_WIDTH, SCREEN_HEIGHT-110-42)];
    //设置代理
    tableViewStatic.delegate = self;
    tableViewStatic.dataSource = self;
    [tableViewStatic registerNib:[UINib nibWithNibName:@"AttendenceRateTableViewCell" bundle:nil]forCellReuseIdentifier:@"AttendenceRateTableViewCell"];
    [viewAttendanceStatistics addSubview:tableViewStatic];
    
}

//装值的个数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (flag == 0) {
        return arrayData.count;
    }else
    {
        return arrayStaticsData.count;
    }
}

//行高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (flag == 0) {
        return 100;
    }else
    {
        return 80;
    }
    
}

//装值
- (UITableViewCell *)tableView:(UITableView *)tableViews
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"进来没");
    
    if (flag == 0) {
    static NSString *identifier = @"AttendanceManageTableViewCell";
    
    AttendanceManageTableViewCell *cell = (AttendanceManageTableViewCell *)[tableViews dequeueReusableCellWithIdentifier:identifier];
    if (cell==nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:identifier owner:self options:nil]objectAtIndex:0];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell initCellData:[arrayData objectAtIndex:indexPath.row]];
    
    return cell;
    }else
    {
        static NSString *identifier = @"AttendenceRateTableViewCell";
        
        AttendenceRateTableViewCell *cell = (AttendenceRateTableViewCell *)[tableViews dequeueReusableCellWithIdentifier:identifier];
        if (cell==nil) {
            cell = [[[NSBundle mainBundle] loadNibNamed:identifier owner:self options:nil]objectAtIndex:0];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell initCellData:[arrayStaticsData objectAtIndex:indexPath.row]];
        
        return cell;
    }

}

//选中哪一行
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (flag == 0) {
        
        NSLog(@"选中第%d行",indexPath.row);
        AttendenceDetailViewController *attendenceDetailViewController = [[AttendenceDetailViewController alloc] init];
        [self.navigationController pushViewController:attendenceDetailViewController animated:YES];
        
    }else
    {
        NSLog(@"选中第%d行",indexPath.row);
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    if (scrollView.contentOffset.x < 320) {
        [buttonAttendanceManagement setSelected:YES];
        [buttonAttendanceStatistics setSelected:NO];
        viewH2.frame = CGRectMake(0, 108, SCREEN_WIDTH/2, 2);
        //加载出勤管理
        [self attendanceManagementView];
        //设置显示哪个view
        //[scrollViewAll setContentOffset:CGPointMake(0, 0) animated:YES];
    }else
    {
        [buttonAttendanceManagement setSelected:NO];
        [buttonAttendanceStatistics setSelected:YES];
        viewH2.frame = CGRectMake(SCREEN_WIDTH/2, 108, SCREEN_WIDTH/2, 2);
        //加载出勤统计
        [self attendanceStatisticsView];
        
        //设置显示哪个view
        //[scrollViewAll setContentOffset:CGPointMake(SCREEN_WIDTH, 0) animated:YES];
    }
    
}



-(IBAction)clickBtn:(id)sender
{
    UIButton *tmpBtn = (UIButton *)sender;
    switch (tmpBtn.tag) {
        case 10:
            [self.navigationController popViewControllerAnimated:YES];
            break;
        case 11:
            [buttonAttendanceManagement setSelected:YES];
            [buttonAttendanceStatistics setSelected:NO];
            viewH2.frame = CGRectMake(0, 108, SCREEN_WIDTH/2, 2);
            //设置显示哪个view
            [scrollViewAll setContentOffset:CGPointMake(0, 0) animated:YES];
            //加载出勤管理
            [self attendanceManagementView];
            break;
        case 12:
            [buttonAttendanceManagement setSelected:NO];
            [buttonAttendanceStatistics setSelected:YES];
            viewH2.frame = CGRectMake(SCREEN_WIDTH/2, 108, SCREEN_WIDTH/2, 2);
            //设置显示哪个view
            [scrollViewAll setContentOffset:CGPointMake(SCREEN_WIDTH, 0) animated:YES];
            //加载出勤统计
            [self attendanceStatisticsView];
            break;
            
        default:
            break;
    }
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
