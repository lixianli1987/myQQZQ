//
//  SportDatumViewController.m
//  QQZQ
//
//  Created by cafuc on 15/10/4.
//  Copyright (c) 2015年 cafuc. All rights reserved.
//

#import "SportDatumViewController.h"
#import "MyUtils.h"
#import "TeamConstitutionViewController.h"
#import "CashConsumptionRecordViewController.h"
#import "TeamActivityListViewController.h"
#import "TeamMemberViewController.h"
#import "MemberFeeManageViewController.h"
#import "TeamAttendanceViewController.h"


@interface SportDatumViewController ()<UIScrollViewDelegate>

@end

@implementation SportDatumViewController

@synthesize buttonBack;
@synthesize buttonInvite;
@synthesize buttonShare;
@synthesize scrollViewAll;



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //设置代理
    scrollViewAll.delegate = self;
    //设置内容大小
    scrollViewAll.contentSize = CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT * 1.5);
    //初始化scrollviewAll
    [self initScrollViewAll];
    
}

-(void) initScrollViewAll
{
    /*********************************view1模块*********************************************/
    
    //放置一个uiview，用于放 球队名称、队长、球队活动次数、球队积分、常活动地点、成立时间
    UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 150)];
    view1.backgroundColor = [UIColor whiteColor];
    
    //球队名称lable
    UILabel *labelName = [[UILabel alloc] initWithFrame:CGRectMake(15, 3, 65, 21)];
    //labelName.backgroundColor = [UIColor redColor];
    labelName.text = @"球队名称:";
    labelName.font = [UIFont systemFontOfSize:14];
    //[labelName setFont:[UIFont fontWithName:@"Helvetica-Bold" size:15]];
    [view1 addSubview:labelName];
    //球队名称显示
    UILabel *labelNameShow = [[UILabel alloc] initWithFrame:CGRectMake(15+65, 3, 200, 21)];
    labelNameShow.text = @"成都老曼联";
    labelNameShow.font = [UIFont systemFontOfSize:14];
    [view1 addSubview:labelNameShow];
    
    //队长lable
    UILabel *labelLeader = [[UILabel alloc] initWithFrame:CGRectMake(15, 6+21, 35, 21)];
    labelLeader.text = @"队长:";
    labelLeader.font = [UIFont systemFontOfSize:14];
    [view1 addSubview:labelLeader];
    //队长显示
    UILabel *labelLeaderShow = [[UILabel alloc] initWithFrame:CGRectMake(15+35, 6+21, 200, 21)];
    labelLeaderShow.text = @"老吉他";
    labelLeaderShow.font = [UIFont systemFontOfSize:14];
    [view1 addSubview:labelLeaderShow];
    
    //球队活动次数lable
    UILabel *labelTimerNum = [[UILabel alloc] initWithFrame:CGRectMake(15, 21+21+9, 80, 21)];
    labelTimerNum.text = @"球队活动次数:";
    labelTimerNum.textColor = [UIColor colorWithRed:216/255.0 green:216/255.0 blue:216/255.0 alpha:1];
    labelTimerNum.font = [UIFont systemFontOfSize:12];
    [view1 addSubview:labelTimerNum];
    //队长显示
    UILabel *labelTimerNumShow = [[UILabel alloc] initWithFrame:CGRectMake(15+80, 21+21+9, 50, 21)];
    labelTimerNumShow.text = @"1000";
    labelTimerNumShow.textColor = [UIColor colorWithRed:216/255.0 green:216/255.0 blue:216/255.0 alpha:1];
    labelTimerNumShow.font = [UIFont systemFontOfSize:12];
    [view1 addSubview:labelTimerNumShow];
    
    //球队积分lable
    UILabel *labelScore = [[UILabel alloc] initWithFrame:CGRectMake(15, 63+12, 55, 21)];
    labelScore.text = @"球队积分:";
    labelScore.textColor = [UIColor colorWithRed:216/255.0 green:216/255.0 blue:216/255.0 alpha:1];
    labelScore.font = [UIFont systemFontOfSize:12];
    [view1 addSubview:labelScore];
    //队长显示
    UILabel *labelScoreShow = [[UILabel alloc] initWithFrame:CGRectMake(15+55, 63+12, 70, 21)];
    labelScoreShow.text = @"98765";
    labelScoreShow.textColor = [UIColor colorWithRed:216/255.0 green:216/255.0 blue:216/255.0 alpha:1];
    labelScoreShow.font = [UIFont systemFontOfSize:12];
    [view1 addSubview:labelScoreShow];
    
    //常活动地点lable
    UILabel *labelLocation = [[UILabel alloc] initWithFrame:CGRectMake(15, 84+15, 70, 21)];
    labelLocation.text = @"常活动地点";
    labelLocation.textColor = [UIColor colorWithRed:216/255.0 green:216/255.0 blue:216/255.0 alpha:1];
    labelLocation.font = [UIFont systemFontOfSize:12];
    [view1 addSubview:labelLocation];
    //队长显示
    UILabel *labelLocationShow = [[UILabel alloc] initWithFrame:CGRectMake(15+70, 84+15, 200, 21)];
    labelLocationShow.text = @"成都双流";
    labelLocationShow.textColor = [UIColor colorWithRed:216/255.0 green:216/255.0 blue:216/255.0 alpha:1];
    labelLocationShow.font = [UIFont systemFontOfSize:12];
    [view1 addSubview:labelLocationShow];
    
    //成立时间lable
    UILabel *labelEStalishTime = [[UILabel alloc] initWithFrame:CGRectMake(15, 105+18, 55, 21)];
    labelEStalishTime.text = @"成立时间:";
    labelEStalishTime.textColor = [UIColor colorWithRed:216/255.0 green:216/255.0 blue:216/255.0 alpha:1];
    labelEStalishTime.font = [UIFont systemFontOfSize:12];
    [view1 addSubview:labelEStalishTime];
    //队长显示
    UILabel *labelEStalishTimeShow = [[UILabel alloc] initWithFrame:CGRectMake(15+55, 105+18, 150, 21)];
    labelEStalishTimeShow.text = @"2015年10月04日";
    labelEStalishTimeShow.textColor = [UIColor colorWithRed:216/255.0 green:216/255.0 blue:216/255.0 alpha:1];
    labelEStalishTimeShow.font = [UIFont systemFontOfSize:12];
    [view1 addSubview:labelEStalishTimeShow];
    
    
     /*********************************view2模块*********************************************/
    //从160开始
    UIView *view2 = [[UIView alloc] initWithFrame:CGRectMake(0, 160, SCREEN_WIDTH, 185)];
    view2.backgroundColor = [UIColor whiteColor];
    
    //球队成员
    //view上面加背景图片
    UIView *viewA = [[UIView alloc] initWithFrame:CGRectMake(15, 10, 60, 60)];
    viewA.layer.contents = (id)[UIImage imageNamed:@"teamMember"].CGImage;
    [view2 addSubview:viewA];
    viewA.tag = 10;
    //在这个view上加手势,点击进入球队相册
    UITapGestureRecognizer *sinTapGestureA= [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(sinTapView:)];
    [viewA addGestureRecognizer:sinTapGestureA];
    
    UILabel *labelA = [[UILabel alloc] initWithFrame:CGRectMake(18, 70, 60, 21)];
    labelA.text = @"球队成员";
    labelA.font = [UIFont systemFontOfSize:12];
    [view2 addSubview:labelA];
    
    UIView *viewB = [[UIView alloc] initWithFrame:CGRectMake(15+60+18, 10, 60, 60)];
    viewB.layer.contents = (id)[UIImage imageNamed:@"teamActivityList"].CGImage;
    [view2 addSubview:viewB];
    viewB.tag = 11;
    //在这个view上加手势,点击进入球队相册
    UITapGestureRecognizer *sinTapGestureB= [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(sinTapView:)];
    [viewB addGestureRecognizer:sinTapGestureB];
    
    UILabel *labelB = [[UILabel alloc] initWithFrame:CGRectMake(75+12, 70, 80, 21)];
    labelB.text = @"球队活动列表";
    labelB.font = [UIFont systemFontOfSize:12];
    [view2 addSubview:labelB];
    
    UIView *viewC = [[UIView alloc] initWithFrame:CGRectMake(15+120+36, 10, 60, 60)];
    viewC.layer.contents = (id)[UIImage imageNamed:@"cashConsumptionRecord"].CGImage;
    [view2 addSubview:viewC];
    viewC.tag = 12;
    //在这个view上加手势,点击进入球队相册
    UITapGestureRecognizer *sinTapGestureC = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(sinTapView:)];
    [viewC addGestureRecognizer:sinTapGestureC];
    
    UILabel *labelC = [[UILabel alloc] initWithFrame:CGRectMake(150+16, 70, 80, 21)];
    labelC.text = @"现金消费记录";
    labelC.font = [UIFont systemFontOfSize:12];
    [view2 addSubview:labelC];
    
    UIView *viewD = [[UIView alloc] initWithFrame:CGRectMake(15+180+54, 10, 60, 60)];
    viewD.layer.contents = (id)[UIImage imageNamed:@"memberCostManagement"].CGImage;
    [view2 addSubview:viewD];
    viewD.tag = 13;
    //在这个view上加手势,点击进入球队相册
    UITapGestureRecognizer *sinTapGestureD = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(sinTapView:)];
    [viewD addGestureRecognizer:sinTapGestureD];
    
    UILabel *labelD = [[UILabel alloc] initWithFrame:CGRectMake(225+22, 70, 80, 21)];
    labelD.text = @"会员费管理";
    labelD.font = [UIFont systemFontOfSize:12];
    [view2 addSubview:labelD];
    
    UIView *viewE = [[UIView alloc] initWithFrame:CGRectMake(15, 96, 60, 60)];
    //这种方式添加图片不变形
    viewE.layer.contents = (id)[UIImage imageNamed:@"attendanceManagement"].CGImage;
    [view2 addSubview:viewE];
    viewE.tag = 14;
    //在这个view上加手势,点击进入球队相册
    UITapGestureRecognizer *sinTapGestureE = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(sinTapView:)];
    [viewE addGestureRecognizer:sinTapGestureE];
    
    UILabel *labelE = [[UILabel alloc] initWithFrame:CGRectMake(18, 156, 60, 21)];
    labelE.text = @"出勤管理";
    labelE.font = [UIFont systemFontOfSize:12];
    [view2 addSubview:labelE];
    
    /*********************************view3模块*********************************************/
    //从355开始
    UIView *view3 = [[UIView alloc] initWithFrame:CGRectMake(0, 355, SCREEN_WIDTH, 40)];
    view3.backgroundColor = [UIColor whiteColor];
    view3.tag = 15;
    //在这个view上加手势,点击进入球队相册
    UITapGestureRecognizer *sinTapGestureZC = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(sinTapView:)];
    [view3 addGestureRecognizer:sinTapGestureZC];
    //球队章程
    UILabel *labelTeamConstitution = [[UILabel alloc] initWithFrame:CGRectMake(15, 9, 100, 21)];
    labelTeamConstitution.text = @"球队管理章程";
    labelTeamConstitution.font = [UIFont systemFontOfSize:14];
    [view3 addSubview:labelTeamConstitution];
    //放置右箭头
    UIImageView *imageView1 = [[UIImageView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH-17, 12, 7, 14)];
    [imageView1 setImage:[UIImage imageNamed:@"right2"]];
    [view3 addSubview:imageView1];
    
    /*********************************view4模块*********************************************/
    //从405开始
    UIView *view4 = [[UIView alloc] initWithFrame:CGRectMake(0, 405, SCREEN_WIDTH, 120)];
    view4.backgroundColor = [UIColor whiteColor];
    view4.tag = 16;
    //球队相册
    UILabel *labelTeamImg = [[UILabel alloc] initWithFrame:CGRectMake(15, 5, 80, 21)];
    labelTeamImg.text = @"球队相册";
    labelTeamImg.font = [UIFont systemFontOfSize:14];
    [view4 addSubview:labelTeamImg];
    //放置右箭头
    UIImageView *imageView2 = [[UIImageView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH-17, 8, 7, 14)];
    [imageView2 setImage:[UIImage imageNamed:@"right2"]];
    [view4 addSubview:imageView2];
    //横线1
    UIView *viewHenXian1 = [[UIView alloc] initWithFrame:CGRectMake(20, 31, SCREEN_WIDTH-20, 1)];
    viewHenXian1.backgroundColor = [UIColor colorWithRed:216/255.0 green:216/255.0 blue:216/255.0 alpha:1];
    [view4 addSubview:viewHenXian1];
    
    UIImageView *imageViewA = [[UIImageView alloc] initWithFrame:CGRectMake(15, 31+10, 65, 65)];
    [imageViewA setImage:[UIImage imageNamed:@"teamMember"]];
    [view4 addSubview:imageViewA];
    
    UIImageView *imageViewB = [[UIImageView alloc] initWithFrame:CGRectMake(15+65+10, 31+10, 65, 65)];
    [imageViewB setImage:[UIImage imageNamed:@"teamMember"]];
    [view4 addSubview:imageViewB];
    
    UIImageView *imageViewC = [[UIImageView alloc] initWithFrame:CGRectMake(15+130+20, 31+10, 65, 65)];
    [imageViewC setImage:[UIImage imageNamed:@"teamMember"]];
    [view4 addSubview:imageViewC];
    
    UIImageView *imageViewD = [[UIImageView alloc] initWithFrame:CGRectMake(15+195+30, 31+10, 65, 65)];
    [imageViewD setImage:[UIImage imageNamed:@"teamMember"]];
    [view4 addSubview:imageViewD];
    
    //在这个view上加手势,点击进入球队相册
    UITapGestureRecognizer *sinTapGestureImg= [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(sinTapView:)];
    [view4 addGestureRecognizer:sinTapGestureImg];
    
    
    /*********************************view5模块*********************************************/
    //从535开始
    UIView *view5 = [[UIView alloc] initWithFrame:CGRectMake(0, 535, SCREEN_WIDTH, 90)];
    view5.backgroundColor = [UIColor whiteColor];
    
    //球队简介
    UILabel *labelTeamProfile = [[UILabel alloc] initWithFrame:CGRectMake(15, 5, 80, 21)];
    labelTeamProfile.text = @"球队简介";
    labelTeamProfile.font = [UIFont systemFontOfSize:14];
    [view5 addSubview:labelTeamProfile];
    //横线1
    UIView *viewHenXian2 = [[UIView alloc] initWithFrame:CGRectMake(20, 31, SCREEN_WIDTH-20, 1)];
    viewHenXian2.backgroundColor = [UIColor colorWithRed:216/255.0 green:216/255.0 blue:216/255.0 alpha:1];
    [view5 addSubview:viewHenXian2];
    //显示球队简介
    UITextView *textViewProfile = [[UITextView alloc] initWithFrame:CGRectMake(17, 32, SCREEN_WIDTH-34, 50)];
    textViewProfile.userInteractionEnabled = NO;
    //textViewProfile.delegate = self;
    textViewProfile.text = @"的施工图撒回家用人人人人人人人人人人的撒的供热固特异按个人认同阿尔特让他热国考订房快快快热热热热热热热热热热热日日日本";
    textViewProfile.font = [UIFont fontWithName:@"Arial" size:12];
    [view5 addSubview:textViewProfile];
    
      /*********************************view6模块*********************************************/
    //从635开始
    UIView *view6 = [[UIView alloc] initWithFrame:CGRectMake(0, 635, SCREEN_WIDTH, 30)];
    view6.backgroundColor = [UIColor clearColor];
    
    //退出球队
    UIButton *buttonCancel = [[UIButton alloc] initWithFrame:CGRectMake(10, 0, SCREEN_WIDTH-20, 30)];
    buttonCancel.backgroundColor = [UIColor colorWithRed:26/255.0 green:178/255.0 blue:10/255.0 alpha:1];
    [buttonCancel.layer setMasksToBounds:YES];
    [buttonCancel.layer setCornerRadius:2];
    [buttonCancel.titleLabel setFont:[UIFont boldSystemFontOfSize:12]];
    [buttonCancel setTitle:@"退出球队" forState:UIControlStateNormal];
    [buttonCancel setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [buttonCancel addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
    buttonCancel.tag = 13;
    [view6 addSubview:buttonCancel];
    
    
    
    [scrollViewAll addSubview:view1];
    [scrollViewAll addSubview:view2];
    [scrollViewAll addSubview:view3];
    [scrollViewAll addSubview:view4];
    [scrollViewAll addSubview:view5];
    [scrollViewAll addSubview:view6];
}


-(void)sinTapView:(UITapGestureRecognizer *)sender
{
    //1.先判断点击了哪个view
    int viewTag =sender.view.tag;
    switch (viewTag) {
        case 10:
            NSLog(@"点击了球队成员");
            [self viewToTeamMember];
            break;
        case 11:
            NSLog(@"点击了球队活动列表");
            [self viewToTeamActivityList];
            break;
        case 12:
            NSLog(@"点击了现金消费记录");
            [self viewToCashConsumptionRecord];
            break;
        case 13:
            NSLog(@"点击了会员费管理");
            [self viewToMemberFeeManage];
            break;
        case 14:
            NSLog(@"点击了出勤管理");
            [self viewToTeamAttendance];
            break;
        case 15:
            NSLog(@"点击了球队章程管理");
            [self viewToTeamConstitution];
            break;
        case 16:
            NSLog(@"点击了球队相册");
            break;
            
        default:
            break;
    }
}

//跳往现金消费记录
-(void) viewToCashConsumptionRecord
{
    CashConsumptionRecordViewController *cashConsumptionRecordViewController = [[CashConsumptionRecordViewController alloc] init];
    [self.navigationController pushViewController:cashConsumptionRecordViewController animated:YES];
}

//跳往球队章程管理
-(void) viewToTeamConstitution
{
    TeamConstitutionViewController *teamConstitutionViewController = [[TeamConstitutionViewController alloc] init];
    [self.navigationController pushViewController:teamConstitutionViewController animated:YES];
}

//跳往球队活动列表页面
-(void) viewToTeamActivityList
{
    TeamActivityListViewController *teamActivityListViewController = [[TeamActivityListViewController alloc] init];
    [self.navigationController pushViewController:teamActivityListViewController animated:YES];
}

//跳往球队成员页面
-(void) viewToTeamMember
{
    TeamMemberViewController *teamMemberViewController = [[TeamMemberViewController alloc] init];
    [self.navigationController pushViewController:teamMemberViewController animated:YES];
    
}

//跳往球队会员管理
-(void) viewToMemberFeeManage
{
    MemberFeeManageViewController *memberFeeManageViewController= [[MemberFeeManageViewController alloc] init];
    [self.navigationController pushViewController:memberFeeManageViewController animated:YES];
    
}

//跳往球队出勤管理
-(void) viewToTeamAttendance
{
    TeamAttendanceViewController *teamAttendanceViewController= [[TeamAttendanceViewController alloc] init];
    [self.navigationController pushViewController:teamAttendanceViewController animated:YES];
    
}



//按钮执行方法
-(IBAction)clickBtn:(id)sender
{
    UIButton *tmpBtn = (UIButton *)sender;
    switch (tmpBtn.tag) {
        case 10:
            NSLog(@"点击了返回按钮");
            [self.navigationController popViewControllerAnimated:YES];
        case 11:
            NSLog(@"点击了邀请按钮");
        case 12:
            NSLog(@"点击了分享按钮");
            break;
        case 13:
            NSLog(@"点击了退出球队按钮");
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
