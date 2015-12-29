//
//  TeamMemberViewController.m
//  QQZQ
//
//  Created by cafuc on 15/10/20.
//  Copyright (c) 2015年 cafuc. All rights reserved.
//

#import "TeamMemberViewController.h"
#import "MemberData.h"
#import "TeamMemberTableViewCell.h"
#import "TeamMemberDatumViewController.h"

@interface TeamMemberViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    NSMutableArray *arrayData;
}


@property NSString *imageUrl;
@property NSString *memberName;
@property NSString *attendanceTimes;
@property NSString *scores;
@property NSString *time;



@end

@implementation TeamMemberViewController

@synthesize tableViewMember;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //初始化数组
    arrayData = [[NSMutableArray alloc] init];
    //测试
    MemberData *memberData = [[MemberData alloc] init];
    memberData.imageUrl = @"www.baidu.com";
    memberData.memberName = @"李师兄";
    memberData.attendanceTimes = @"38次";
    memberData.scores = @"900";
    memberData.time = @"2015年10月25日";
    [arrayData addObject:memberData];
    
    
    //tableView设置代理
    tableViewMember.delegate = self;
    tableViewMember.dataSource = self;
    
}

//装值的个数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return arrayData.count;
}

//行高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 85;
}

//装值
- (UITableViewCell *)tableView:(UITableView *)tableViews
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"进来没");
    static NSString *identifier = @"TeamMemberTableViewCell";
    
    TeamMemberTableViewCell *cell = (TeamMemberTableViewCell *)[tableViews dequeueReusableCellWithIdentifier:identifier];
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
    
    TeamMemberDatumViewController *teamMemberDatumViewController = [[TeamMemberDatumViewController alloc] init];
    [self.navigationController pushViewController:teamMemberDatumViewController animated:YES];
    
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
    }else if (tmpBtn.tag == 11)
    {
        NSLog(@"点击了踢出按钮");
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
