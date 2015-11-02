//
//  TeamMemberDatumViewController.m
//  QQZQ
//
//  Created by cafuc on 15/10/29.
//  Copyright © 2015年 cafuc. All rights reserved.
//

#import "TeamMemberDatumViewController.h"
#import "MyUtils.h"
#import "UIImageView+AFNetworking.h"


@interface TeamMemberDatumViewController ()<UIScrollViewDelegate>
{
    //选中基本信息时的下划线
    UIView *viewH2;
    
    //
}

@end

@implementation TeamMemberDatumViewController

@synthesize buttonBaseInfo;
@synthesize buttonPhoto;
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
    [buttonBaseInfo setSelected:YES];
    [buttonBaseInfo setTitleColor:[UIColor colorWithRed:0/255.0 green:175/255.0 blue:0/255.0 alpha:1] forState:UIControlStateSelected];
    
    [buttonPhoto setSelected:NO];
    [buttonPhoto setTitleColor:[UIColor colorWithRed:0/255.0 green:175/255.0 blue:0/255.0 alpha:1] forState:UIControlStateSelected];
    
    /*****************************横线*****************************/
    //初始化进来设置
    viewH2 = [[UIView alloc] initWithFrame:CGRectMake(0, 108, SCREEN_WIDTH/2, 2)];
    viewH2.backgroundColor = [UIColor colorWithRed:0/255.0 green:175/255.0 blue:0/255.0 alpha:1];
    [self.view addSubview:viewH2];
    
    /*************************请求数据************************************/
    
    
    /*********************基本信息************************/
    //无值调用
    //[self sportManage];
    //有值调用
    [self baseInfoView];
    /*****************************相册*****************************/
    //无值调用
    //[self sportInnerActivity];
    //有值调用
    [self phoneView];
    
}

//基本信息
-(void) baseInfoView
{
    //基本信息view
    UIView *viewBaseInfo = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-110)];
    viewBaseInfo.backgroundColor = [UIColor clearColor];
    [scrollViewAll addSubview:viewBaseInfo];
    
    //用户头像
    UIImageView *imageUser = [[UIImageView alloc] initWithFrame:CGRectMake(20, 15, 60, 60)];
    [imageUser setImageWithURL:[NSURL URLWithString:@"www.baidu.com"] placeholderImage:[UIImage imageNamed:@"example1"]];
    [viewBaseInfo addSubview:imageUser];
    
    //姓名
    UILabel *labelName = [[UILabel alloc] initWithFrame:CGRectMake(80+10, 10, 100, 21)];
    labelName.text = @"肖爱凤";
    labelName.font = [UIFont systemFontOfSize:14];
    [viewBaseInfo addSubview:labelName];
    
    //年龄
    UILabel *labelAge = [[UILabel alloc] initWithFrame:CGRectMake(80+10, 15+15, 40, 21)];
    //labelAge.backgroundColor = [UIColor redColor];
    labelAge.text = @"24岁";
    labelAge.font = [UIFont systemFontOfSize:14];
    [viewBaseInfo addSubview:labelAge];
    
    //省份、城市
    UILabel *labelLocation = [[UILabel alloc] initWithFrame:CGRectMake(90+40, 15+15, 60, 21)];
    //labelLocation.backgroundColor = [UIColor redColor];
    labelLocation.text = @"四川 成都";
    labelLocation.font = [UIFont systemFontOfSize:14];
    [viewBaseInfo addSubview:labelLocation];
    
    //擅长位置
    UILabel *labelGoodPosition = [[UILabel alloc] initWithFrame:CGRectMake(80+10, 30+20, 60, 21)];
    //labelGoodPosition.backgroundColor = [UIColor redColor];
    labelGoodPosition.text = @"擅长位置：";
    labelGoodPosition.textColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1];
    labelGoodPosition.font = [UIFont systemFontOfSize:12];
    [viewBaseInfo addSubview:labelGoodPosition];
    
    //前锋
    UILabel *labelForward = [[UILabel alloc] initWithFrame:CGRectMake(150, 30+20, 30, 21)];
    //labelForward.backgroundColor = [UIColor yellowColor];
    labelForward.text = @"前锋";
    labelForward.textColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1];
    labelForward.font = [UIFont systemFontOfSize:12];
    [viewBaseInfo addSubview:labelForward];
    
    //竖线
    UIView *viewS1 = [[UILabel alloc] initWithFrame:CGRectMake(180+5, 30+20+3, 1, 15)];
    viewS1.backgroundColor = [UIColor colorWithRed:216/255.0 green:216/255.0 blue:216/255.0 alpha:1];
    [viewBaseInfo addSubview:viewS1];
    
    //圈圈号
    UILabel *labelQQnumber = [[UILabel alloc] initWithFrame:CGRectMake(190, 30+20, 50, 21)];
    //labelQQnumber.backgroundColor = [UIColor redColor];
    labelQQnumber.text = @"圈圈号：";
    labelQQnumber.textColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1];
    labelQQnumber.font = [UIFont systemFontOfSize:12];
    [viewBaseInfo addSubview:labelQQnumber];
    
    //圈圈号数据
    UILabel *labelQQnumberData = [[UILabel alloc] initWithFrame:CGRectMake(190+50, 30+20, 50, 21)];
    //labelQQnumber.backgroundColor = [UIColor redColor];
    labelQQnumberData.text = @"yangzi";
    labelQQnumberData.textColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1];
    labelQQnumberData.font = [UIFont systemFontOfSize:12];
    [viewBaseInfo addSubview:labelQQnumberData];
    
    //横线1
    UIView *viewH1 = [[UILabel alloc] initWithFrame:CGRectMake(0, 90, SCREEN_WIDTH, 1)];
    viewH1.backgroundColor = [UIColor colorWithRed:216/255.0 green:216/255.0 blue:216/255.0 alpha:1];
    [viewBaseInfo addSubview:viewH1];
    
    //参加活动次数
    UILabel *labelAddTimes = [[UILabel alloc] initWithFrame:CGRectMake(0, 91, SCREEN_WIDTH/3, 21)];
    //labelAddTimes.backgroundColor = [UIColor redColor];
    labelAddTimes.text = @"参加活动次数";
    labelAddTimes.textAlignment = NSTextAlignmentCenter;
    labelAddTimes.textColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1];
    labelAddTimes.font = [UIFont systemFontOfSize:12];
    [viewBaseInfo addSubview:labelAddTimes];
    //参加活动次数值
    UILabel *labelAddTimesValue = [[UILabel alloc] initWithFrame:CGRectMake(0, 91+21, SCREEN_WIDTH/3, 21)];
    //labelAddTimesValue.backgroundColor = [UIColor redColor];
    labelAddTimesValue.text = @"180";
    labelAddTimesValue.textAlignment = NSTextAlignmentCenter;
    labelAddTimesValue.textColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1];
    labelAddTimesValue.font = [UIFont systemFontOfSize:12];
    [viewBaseInfo addSubview:labelAddTimesValue];
    
    //竖线2
    UIView *viewS2 = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/3, 91+7, 1, 30)];
    viewS2.backgroundColor = [UIColor colorWithRed:216/255.0 green:216/255.0 blue:216/255.0 alpha:1];
    [viewBaseInfo addSubview:viewS2];
    
    //积分
    UILabel *labelScore = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/3, 91, SCREEN_WIDTH/3, 21)];
    //labelAddTimes.backgroundColor = [UIColor redColor];
    labelScore.text = @"积分";
    labelScore.textAlignment = NSTextAlignmentCenter;
    labelScore.textColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1];
    labelScore.font = [UIFont systemFontOfSize:12];
    [viewBaseInfo addSubview:labelScore];
    //积分值
    UILabel *labelScoreValue = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/3, 91+21, SCREEN_WIDTH/3, 21)];
    //labelScoreValue.backgroundColor = [UIColor redColor];
    labelScoreValue.text = @"13000";
    labelScoreValue.textAlignment = NSTextAlignmentCenter;
    labelScoreValue.textColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1];
    labelScoreValue.font = [UIFont systemFontOfSize:12];
    [viewBaseInfo addSubview:labelScoreValue];
    
    //竖线3
    UIView *viewS3 = [[UILabel alloc] initWithFrame:CGRectMake((SCREEN_WIDTH/3)*2, 91+7, 1, 30)];
    viewS3.backgroundColor = [UIColor colorWithRed:216/255.0 green:216/255.0 blue:216/255.0 alpha:1];
    [viewBaseInfo addSubview:viewS3];
    
    //球队数量
    UILabel *labelTeamNumber = [[UILabel alloc] initWithFrame:CGRectMake((SCREEN_WIDTH/3)*2, 91, SCREEN_WIDTH/3, 21)];
    //labelAddTimes.backgroundColor = [UIColor redColor];
    labelTeamNumber.text = @"球队数量";
    labelTeamNumber.textAlignment = NSTextAlignmentCenter;
    labelTeamNumber.textColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1];
    labelTeamNumber.font = [UIFont systemFontOfSize:12];
    [viewBaseInfo addSubview:labelTeamNumber];
    //积分值
    UILabel *labelTeamNumberValue = [[UILabel alloc] initWithFrame:CGRectMake((SCREEN_WIDTH/3)*2, 91+21, SCREEN_WIDTH/3, 21)];
    //labelScoreValue.backgroundColor = [UIColor redColor];
    labelTeamNumberValue.text = @"2";
    labelTeamNumberValue.textAlignment = NSTextAlignmentCenter;
    labelTeamNumberValue.textColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1];
    labelTeamNumberValue.font = [UIFont systemFontOfSize:12];
    [viewBaseInfo addSubview:labelTeamNumberValue];
    
    //横线2
    UIView *viewH22 = [[UILabel alloc] initWithFrame:CGRectMake(0, 90+45, SCREEN_WIDTH, 1)];
    viewH22.backgroundColor = [UIColor colorWithRed:216/255.0 green:216/255.0 blue:216/255.0 alpha:1];
    [viewBaseInfo addSubview:viewH22];
    
}

//相册
-(void) phoneView
{
    //相册view
    UIView *viewPhone = [[UIView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH, 0, SCREEN_WIDTH, SCREEN_HEIGHT-110)];
    viewPhone.backgroundColor = [UIColor clearColor];
    [scrollViewAll addSubview:viewPhone];
    
    //相册名称
    UILabel *phoneName = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 120, 21)];
    phoneName.text = @"球队相册";
    phoneName.font = [UIFont systemFontOfSize:14];
    [viewPhone addSubview:phoneName];
    
}



int lastContentOffsetBase;
int xxBase;
-(void)scrollViewWillBeginDragging:(UIScrollView*)scrollView{
    lastContentOffsetBase = scrollView.contentOffset.y;
}
-( void )scrollViewDidScroll:( UIScrollView *)scrollView {
    NSLog(@"移动量:%f",scrollView.contentOffset.x);
}

//按钮执行方法
-(IBAction)clickBtn:(id)sender
{
    UIButton *tmpBtn = (UIButton *)sender;
    //int tmpTag = tmpBtn.tag;
    
    switch (tmpBtn.tag) {
        case 10:
            NSLog(@"点击了返回按钮");
            break;
        case 11:
            NSLog(@"点击了基本信息");
            [buttonBaseInfo setSelected:YES];
            [buttonPhoto setSelected:NO];
            viewH2.frame = CGRectMake(0, 108, SCREEN_WIDTH/2, 2);
            //设置显示哪个view
            [scrollViewAll setContentOffset:CGPointMake(0, 0) animated:YES];
            break;
        case 12:
            NSLog(@"点击了相册");
            [buttonBaseInfo setSelected:NO];
            [buttonPhoto setSelected:YES];
            viewH2.frame = CGRectMake(SCREEN_WIDTH/2, 108, SCREEN_WIDTH/2, 2);
            //设置显示哪个view
            [scrollViewAll setContentOffset:CGPointMake(SCREEN_WIDTH, 0) animated:YES];
            break;
            
        default:
            break;
    }
    
}

@end
