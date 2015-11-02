//
//  MyTeamViewController.m
//  QQZQ
//
//  Created by cafuc on 15/8/25.
//  Copyright (c) 2015年 cafuc. All rights reserved.
//

#import "MyTeamViewController.h"
#import "InitiateViewController.h"
#import "CreateViewController.h"
#import "FindViewController.h"
#import "MyUtils.h"
#import "AFNetworking.h"
#import "WebServiceHost.h"
#import "SportData.h"
#import "UIImageView+AFNetworking.h"
#import "MyTeamTableViewCell.h"
#import "SportDataCell.h"
#import "SportNewsViewController.h"
#import "SportDatumViewController.h"
#import "SportInnerData.h"
#import "SportInnerAcyivityTableViewCell.h"
#import "SportInnerActivityDetailViewController.h"



@interface MyTeamViewController ()<UIScrollViewDelegate,UITableViewDelegate,UITableViewDataSource,UIGestureRecognizerDelegate>
{
    //选中球队管理的下划线
    UIView *viewH2;
    
    //点击右上角加号时，弹出view
    UIView *viewChoice;
    
    //弹出view标志
    int flagChoice;
    
    //cell 数组
    NSMutableArray *cellInitDtatArray;
    
   //cell数组
    NSMutableArray *cellDataArray;
    
    /*************球队最新动态***************/
    //横线1
    UIView *viewHenXian1;
    //img
    UIImageView *imageViewSportNews;
    //球队最新动态
    UILabel *labelSportNews;
    //横线2
    UIView *viewHenXian2;
    //tableView
    UITableView *tableViewShow;
    
    //球队内部活动数组
    NSMutableArray *cellSportInnerArray;
    //球队内部tableView
    UITableView *tableViewInner;
    
    //页码
    int pageIndex;
    
    //设置三个标志位
    //初始值都设成0
    //一旦检测到发生改变了，立马变成1
    //相与，结果为0，左右滑动，结果为1,上下滑动
    int flagUp;
    int flagDown;
    int flagLeft;
    
    
}

@end

@implementation MyTeamViewController


@synthesize buttonAddSportTeam;
@synthesize buttonTeamManage;
@synthesize buttonTeamInnerActivity;

@synthesize scrollViewAll;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

    
    //初始值都设成0
    flagUp = 0;
    flagDown = 0;
    flagLeft = 0;
    
    
    //设置初始值
    flagChoice = 0;
    
    //设置代理
    scrollViewAll.delegate = self;
    //翻页
    scrollViewAll.pagingEnabled = YES;
    //设置内容大小
    scrollViewAll.contentSize = CGSizeMake(SCREEN_WIDTH*2, SCREEN_HEIGHT-110);

     NSLog(@"初始化:%f",scrollViewAll.contentOffset.x);
    
    UITapGestureRecognizer *sinTapGesture= [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(sinTapView:)];
    sinTapGesture.delegate = self;
    [scrollViewAll addGestureRecognizer:sinTapGesture];
    
    
    /*************初始化球队管理颜色*****/
     [buttonTeamManage setSelected:YES];
     [buttonTeamManage setTitleColor:[UIColor colorWithRed:0/255.0 green:175/255.0 blue:0/255.0 alpha:1] forState:UIControlStateSelected];
     
     [buttonTeamInnerActivity setSelected:NO];
     [buttonTeamInnerActivity setTitleColor:[UIColor colorWithRed:0/255.0 green:175/255.0 blue:0/255.0 alpha:1] forState:UIControlStateSelected];
    
    /*****************************横线*****************************/
    //初始化进来设置
    viewH2 = [[UIView alloc] initWithFrame:CGRectMake(0, 108, SCREEN_WIDTH/2, 2)];
    viewH2.backgroundColor = [UIColor colorWithRed:0/255.0 green:175/255.0 blue:0/255.0 alpha:1];
    [self.view addSubview:viewH2];
    
    
    /*************************请求数据************************************/
    //根据请求到的数据，决定显示哪些view
    
    
    /*********************球队管理************************/
    //无值调用
    //[self sportManage];
    //有值调用
    [self sportManageValue];
    /*****************************球队内部活动*****************************/
    //无值调用
    //[self sportInnerActivity];
    //有值调用
    [self sportInnerActivityValue];
    
}

//改写手势代理
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    //输出点击的view的类名
    NSLog(@"%@",NSStringFromClass([touch.view class]));
    if ([NSStringFromClass([touch.view class]) isEqualToString:@"UITableViewCellContentView"]) {
        return NO;
    }
    
    return YES;
}


//初始进入我的球队页面，没有球队时
-(void) sportManage
{
    //球队管理view
    UIView *viewSportManage = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-110)];
    viewSportManage.backgroundColor = [UIColor clearColor];
    [scrollViewAll addSubview:viewSportManage];
    
    //还没加入球队?
    UILabel *labelName = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 120, 21)];
    labelName.text = @"还没有加入球队？";
    labelName.font = [UIFont systemFontOfSize:14];
    [viewSportManage addSubview:labelName];
    //请先
    UILabel *labelPlease = [[UILabel alloc] initWithFrame:CGRectMake(100, 121+15, 30, 21)];
    labelPlease.text = @"请先";
    labelPlease.font = [UIFont systemFontOfSize:14];
    [viewSportManage addSubview:labelPlease];
    //创建球队
    UIButton *buttonCreateSportTeam = [[UIButton alloc] initWithFrame:CGRectMake(130, 121+15, 80, 18)];
    buttonCreateSportTeam.backgroundColor = [UIColor whiteColor];
    [buttonCreateSportTeam setTitle:@"创建球队" forState:UIControlStateNormal];
    [buttonCreateSportTeam setTitleColor:[UIColor colorWithRed:9/255.0 green:187/255.0 blue:7/255.0 alpha:1] forState:UIControlStateNormal];
    buttonCreateSportTeam.titleLabel.font = [UIFont systemFontOfSize:14];
    buttonCreateSportTeam.tag = 11;
    [buttonCreateSportTeam addTarget:self action:@selector(clickSureBtn:) forControlEvents:UIControlEventTouchUpInside];
    [viewSportManage addSubview:buttonCreateSportTeam];
    //或
    UILabel *labelOr = [[UILabel alloc] initWithFrame:CGRectMake(215, 121+15, 30, 21)];
    labelOr.text = @"或";
    labelOr.font = [UIFont systemFontOfSize:14];
    [viewSportManage addSubview:labelOr];
    //通过
    UILabel *labelAccess = [[UILabel alloc] initWithFrame:CGRectMake(100, 121+15+15+21, 30, 21)];
    labelAccess.text = @"通过";
    labelAccess.font = [UIFont systemFontOfSize:14];
    [viewSportManage addSubview:labelAccess];
    //查找球队
    UIButton *buttonFindSportTeam = [[UIButton alloc] initWithFrame:CGRectMake(130, 121+15+15+21, 80, 18)];
    buttonFindSportTeam.backgroundColor = [UIColor whiteColor];
    [buttonFindSportTeam setTitle:@"查找球队" forState:UIControlStateNormal];
    [buttonFindSportTeam setTitleColor:[UIColor colorWithRed:9/255.0 green:187/255.0 blue:7/255.0 alpha:1] forState:UIControlStateNormal];
    buttonFindSportTeam.titleLabel.font = [UIFont systemFontOfSize:14];
    buttonFindSportTeam.tag = 12;
    [buttonFindSportTeam addTarget:self action:@selector(clickSureBtn:) forControlEvents:UIControlEventTouchUpInside];
    [viewSportManage addSubview:buttonFindSportTeam];
    //选择加入一支球队
    UILabel *labelJoin = [[UILabel alloc] initWithFrame:CGRectMake(215, 121+15+15+21, 60, 21)];
    labelJoin.text = @"选择加入";
    labelJoin.font = [UIFont systemFontOfSize:14];
    [viewSportManage addSubview:labelJoin];
    //一支球队
    UILabel *labelOne = [[UILabel alloc] initWithFrame:CGRectMake(100, 121+15+15+21+15+21, 60, 21)];
    labelOne.text = @"一个球队";
    labelOne.font = [UIFont systemFontOfSize:14];
    [viewSportManage addSubview:labelOne];
    
}

//没有球队内部活动时
-(void) sportInnerActivity
{
    //球队内部活动
    UIView *viewSportInnerActivity = [[UIView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH, 0, SCREEN_WIDTH, SCREEN_HEIGHT-110)];
    viewSportInnerActivity.backgroundColor = [UIColor clearColor];
    [scrollViewAll addSubview:viewSportInnerActivity];
    //还没有球队内部活动
    UILabel *labelInner = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 120, 21)];

    labelInner.text = @"还没有加入球队？";
    labelInner.font = [UIFont systemFontOfSize:14];
    [viewSportInnerActivity addSubview:labelInner];
    //请先
    UILabel *labelPlease2 = [[UILabel alloc] initWithFrame:CGRectMake(100, 121+15, 30, 21)];
    labelPlease2.text = @"请";
    labelPlease2.font = [UIFont systemFontOfSize:14];
    [viewSportInnerActivity addSubview:labelPlease2];
    //发起活动
    UIButton *buttonInitiateActivityTeam = [[UIButton alloc] initWithFrame:CGRectMake(120, 121+15, 80, 18)];
    buttonInitiateActivityTeam.backgroundColor = [UIColor whiteColor];
    [buttonInitiateActivityTeam setTitle:@"发起活动" forState:UIControlStateNormal];
    [buttonInitiateActivityTeam setTitleColor:[UIColor colorWithRed:9/255.0 green:187/255.0 blue:7/255.0 alpha:1] forState:UIControlStateNormal];
    buttonInitiateActivityTeam.titleLabel.font = [UIFont systemFontOfSize:14];
    buttonInitiateActivityTeam.tag = 10;
    [buttonInitiateActivityTeam addTarget:self action:@selector(clickSureBtn:) forControlEvents:UIControlEventTouchUpInside];
    [viewSportInnerActivity addSubview:buttonInitiateActivityTeam];
    
}

//初始化进入球队内部活动，有活动时
-(void) sportInnerActivityValue
{

    //球队内部活动数组
    cellSportInnerArray = [[NSMutableArray alloc] init];
    SportInnerData *sportInnerData = [[SportInnerData alloc] init];
    sportInnerData.imageUrl = @"http://img.pconline.com.cn/images/upload/upc/tx/wallpaper/1307/22/c8/23614693_1374477999097_800x600.jpg";
    [cellSportInnerArray addObject:sportInnerData];
    SportInnerData *sportInnerData2 = [[SportInnerData alloc] init];
    sportInnerData2.imageUrl = @"http://img.pconline.com.cn/images/upload/upc/tx/wallpaper/1307/22/c8/23614693_1374477999097_800x600.jpg";
    [cellSportInnerArray addObject:sportInnerData2];
    SportInnerData *sportInnerData3 = [[SportInnerData alloc] init];
    sportInnerData3.imageUrl = @"http://img.pconline.com.cn/images/upload/upc/tx/wallpaper/1307/22/c8/23614693_1374477999097_800x600.jpg";
    [cellSportInnerArray addObject:sportInnerData3];
    SportInnerData *sportInnerData4 = [[SportInnerData alloc] init];
    sportInnerData4.imageUrl = @"http://img.pconline.com.cn/images/upload/upc/tx/wallpaper/1307/22/c8/23614693_1374477999097_800x600.jpg";
    [cellSportInnerArray addObject:sportInnerData4];
    SportInnerData *sportInnerData5 = [[SportInnerData alloc] init];
    sportInnerData5.imageUrl = @"http://img.pconline.com.cn/images/upload/upc/tx/wallpaper/1307/22/c8/23614693_1374477999097_800x600.jpg";
    [cellSportInnerArray addObject:sportInnerData5];
    SportInnerData *sportInnerData6 = [[SportInnerData alloc] init];
    sportInnerData6.imageUrl = @"http://img.pconline.com.cn/images/upload/upc/tx/wallpaper/1307/22/c8/23614693_1374477999097_800x600.jpg";
    [cellSportInnerArray addObject:sportInnerData6];
    
    
    //球队内部活动iew
    UIView *viewSportInnerActivityValue = [[UIView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH, 0, SCREEN_WIDTH, SCREEN_HEIGHT-110)];
    viewSportInnerActivityValue.backgroundColor = [UIColor redColor];
    [scrollViewAll addSubview:viewSportInnerActivityValue];
    
    //用个标志位加以区分是哪个tableView
    //放tableView
    tableViewInner = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-110)];
    //设置代理
    tableViewInner.delegate = self;
    tableViewInner.dataSource = self;
    //去除分割线
    tableViewInner.separatorStyle = UITableViewCellSeparatorStyleNone;
    //不让tableView滑动
    //tableViewInner.scrollEnabled = NO;
    //注册cell
    [tableViewInner registerClass:[SportInnerAcyivityTableViewCell class] forCellReuseIdentifier:@"SportInnerAcyivityTableViewCell"];
    [viewSportInnerActivityValue addSubview:tableViewInner];
    
}


//初始化进入我的页面，有球队时
-(void) sportManageValue
{
    cellInitDtatArray = [[NSMutableArray alloc] init];
    SportData *sportData1 = [[SportData alloc] init];
    sportData1.imageUrl = @"http://img.pconline.com.cn/images/upload/upc/tx/wallpaper/1307/22/c8/23614693_1374477999097_800x600.jpg";
    sportData1.downName = @"测试1";
    
    SportData *sportData2 = [[SportData alloc] init];
    sportData2.imageUrl = @"http://img.pconline.com.cn/images/upload/upc/tx/wallpaper/1307/22/c8/23614693_1374477999097_800x600.jpg";
    sportData2.downName = @"测试2";
    
    SportData *sportData3 = [[SportData alloc] init];
    sportData3.imageUrl = @"http://img.pconline.com.cn/images/upload/upc/tx/wallpaper/1307/22/c8/23614693_1374477999097_800x600.jpg";
    sportData3.downName = @"测试3";
    
    SportData *sportData4 = [[SportData alloc] init];
    sportData4.imageUrl = @"http://img.pconline.com.cn/images/upload/upc/tx/wallpaper/1307/22/c8/23614693_1374477999097_800x600.jpg";
    sportData4.downName = @"测试4";
    
    
    [cellInitDtatArray addObject:sportData1];
    [cellInitDtatArray addObject:sportData2];
    [cellInitDtatArray addObject:sportData3];
    [cellInitDtatArray addObject:sportData4];
    
    //球队管理view
    UIView *viewSportManageValue = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-110)];
    viewSportManageValue.backgroundColor = [UIColor whiteColor];
    scrollViewAll.bounces = FALSE;
    [scrollViewAll addSubview:viewSportManageValue];
    
    
    /**********************************view显示部分*************************************************/
    //view1
    UIView *viewCell1 = [[UIView alloc] initWithFrame:CGRectMake(15, 10, 82, 110)];
    //viewCell1.backgroundColor = [UIColor redColor];
    [viewCell1 setHidden:YES];
    viewCell1.tag = 10;
    [viewSportManageValue addSubview:viewCell1];
    //添加手势
    UITapGestureRecognizer *sinTapGestureCell1= [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(sinTapViewJump:)];
    [viewCell1 addGestureRecognizer:sinTapGestureCell1];
    //背景view
    UIView *viewCell1A = [[UIView alloc] initWithFrame:CGRectMake(1, 1, 80, 80)];
    viewCell1A.backgroundColor = [UIColor clearColor];
    viewCell1A.layer.masksToBounds = YES;
    viewCell1A.layer.cornerRadius = 6;
    viewCell1A.layer.borderWidth = 1;
    viewCell1A.layer.borderColor = [UIColor colorWithRed:154/255.0 green:154/255.0 blue:154/255.0 alpha:1].CGColor;
    [viewCell1 addSubview:viewCell1A];
    //图片
    UIImageView *imageViewCell1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 80, 80)];
    [imageViewCell1 setImageWithURL:[NSURL URLWithString:sportData1.imageUrl] placeholderImage:[UIImage imageNamed:@"example1"]];
    [viewCell1A addSubview:imageViewCell1];
    //文字
    UILabel *labelNameCell1 = [[UILabel alloc] initWithFrame:CGRectMake(4, 85, 73, 21)];
    labelNameCell1.backgroundColor = [UIColor clearColor];
    labelNameCell1.text = @"活动还没开始";
    labelNameCell1.textAlignment = NSTextAlignmentCenter;
    labelNameCell1.font = [UIFont systemFontOfSize:12];
    [viewCell1 addSubview:labelNameCell1];
    
    
    //view2
    UIView *viewCell2 = [[UIView alloc] initWithFrame:CGRectMake(15+80+22, 10, 82, 110)];
    [viewCell2 setHidden:YES];
    viewCell2.tag = 11;
    [viewSportManageValue addSubview:viewCell2];
    //添加手势
    UITapGestureRecognizer *sinTapGestureCell2= [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(sinTapViewJump:)];
    [viewCell2 addGestureRecognizer:sinTapGestureCell2];
    //背景view
    UIView *viewCell2A = [[UIView alloc] initWithFrame:CGRectMake(1, 1, 80, 80)];
    viewCell2A.backgroundColor = [UIColor clearColor];
    viewCell2A.layer.masksToBounds = YES;
    viewCell2A.layer.cornerRadius = 6;
    viewCell2A.layer.borderWidth = 1;
    viewCell2A.layer.borderColor = [UIColor colorWithRed:154/255.0 green:154/255.0 blue:154/255.0 alpha:1].CGColor;
    [viewCell2 addSubview:viewCell2A];
    //图片
    UIImageView *imageViewCell2 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 80, 80)];
    [imageViewCell2 setImageWithURL:[NSURL URLWithString:sportData1.imageUrl] placeholderImage:[UIImage imageNamed:@"example1"]];
    [viewCell2A addSubview:imageViewCell2];
    //文字
    UILabel *labelNameCell2 = [[UILabel alloc] initWithFrame:CGRectMake(4, 85, 73, 21)];
    labelNameCell2.text = @"活动还没开始";
    labelNameCell2.textAlignment = NSTextAlignmentCenter;
    labelNameCell2.font = [UIFont systemFontOfSize:12];
    [viewCell2 addSubview:labelNameCell2];
    
    //view3
    UIView *viewCell3 = [[UIView alloc] initWithFrame:CGRectMake(15+160+44, 10, 82, 110)];
    viewCell3.backgroundColor = [UIColor clearColor];
    [viewCell3 setHidden:YES];
    viewCell3.tag = 12;
    [viewSportManageValue addSubview:viewCell3];
    //添加手势
    UITapGestureRecognizer *sinTapGestureCell3= [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(sinTapViewJump:)];
    [viewCell3 addGestureRecognizer:sinTapGestureCell3];
    //背景view
    UIView *viewCell3A = [[UIView alloc] initWithFrame:CGRectMake(1, 1, 80, 80)];
    viewCell3A.backgroundColor = [UIColor clearColor];
    viewCell3A.layer.masksToBounds = YES;
    viewCell3A.layer.cornerRadius = 6;
    viewCell3A.layer.borderWidth = 1;
    viewCell3A.layer.borderColor = [UIColor colorWithRed:154/255.0 green:154/255.0 blue:154/255.0 alpha:1].CGColor;
    [viewCell3 addSubview:viewCell3A];
    //图片
    UIImageView *imageViewCell3 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 80, 80)];
    [imageViewCell3 setImageWithURL:[NSURL URLWithString:sportData1.imageUrl] placeholderImage:[UIImage imageNamed:@"example1"]];
    [viewCell3A addSubview:imageViewCell3];
    //文字
    UILabel *labelNameCell3 = [[UILabel alloc] initWithFrame:CGRectMake(4, 85, 73, 21)];
    labelNameCell3.text = @"活动还没开始";
    labelNameCell3.textAlignment = NSTextAlignmentCenter;
    labelNameCell3.font = [UIFont systemFontOfSize:12];
    [viewCell3 addSubview:labelNameCell3];
    
    //view4
    UIView *viewCell4 = [[UIView alloc] initWithFrame:CGRectMake(15, 10+110, 82, 110)];
    //viewCell4.backgroundColor = [UIColor yellowColor];
    [viewCell4 setHidden:YES];
    viewCell4.tag = 13;
    [viewSportManageValue addSubview:viewCell4];
    //添加手势
    UITapGestureRecognizer *sinTapGestureCell4= [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(sinTapViewJump:)];
    [viewCell4 addGestureRecognizer:sinTapGestureCell4];
    //背景view
    UIView *viewCell4A = [[UIView alloc] initWithFrame:CGRectMake(1, 1, 80, 80)];
    viewCell4A.backgroundColor = [UIColor clearColor];
    viewCell4A.layer.masksToBounds = YES;
    viewCell4A.layer.cornerRadius = 6;
    viewCell4A.layer.borderWidth = 1;
    viewCell4A.layer.borderColor = [UIColor colorWithRed:154/255.0 green:154/255.0 blue:154/255.0 alpha:1].CGColor;
    [viewCell4 addSubview:viewCell4A];
    //图片
    UIImageView *imageViewCell4 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 80, 80)];
    [imageViewCell4 setImageWithURL:[NSURL URLWithString:sportData1.imageUrl] placeholderImage:[UIImage imageNamed:@"example1"]];
    [viewCell4A addSubview:imageViewCell4];
    //文字
    UILabel *labelNameCell4 = [[UILabel alloc] initWithFrame:CGRectMake(4, 85, 73, 21)];
    labelNameCell4.backgroundColor = [UIColor clearColor];
    labelNameCell4.text = @"活动还没开始";
    labelNameCell4.textAlignment = NSTextAlignmentCenter;
    labelNameCell4.font = [UIFont systemFontOfSize:12];
    [viewCell4 addSubview:labelNameCell4];
    
    //view5
    UIView *viewCell5 = [[UIView alloc] initWithFrame:CGRectMake(15+80+22, 10+110, 82, 110)];
    //viewCell4.backgroundColor = [UIColor yellowColor];
    [viewCell5 setHidden:YES];
    viewCell5.tag = 14;
    [viewSportManageValue addSubview:viewCell5];
    //添加手势
    UITapGestureRecognizer *sinTapGestureCell5= [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(sinTapViewJump:)];
    [viewCell5 addGestureRecognizer:sinTapGestureCell5];
    //背景view
    UIView *viewCell5A = [[UIView alloc] initWithFrame:CGRectMake(1, 1, 80, 80)];
    viewCell5A.backgroundColor = [UIColor clearColor];
    viewCell5A.layer.masksToBounds = YES;
    viewCell5A.layer.cornerRadius = 6;
    viewCell5A.layer.borderWidth = 1;
    viewCell5A.layer.borderColor = [UIColor colorWithRed:154/255.0 green:154/255.0 blue:154/255.0 alpha:1].CGColor;
    [viewCell5 addSubview:viewCell5A];
    //图片
    UIImageView *imageViewCell5 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 80, 80)];
    [imageViewCell5 setImageWithURL:[NSURL URLWithString:sportData1.imageUrl] placeholderImage:[UIImage imageNamed:@"example1"]];
    [viewCell5A addSubview:imageViewCell5];
    //文字
    UILabel *labelNameCell5 = [[UILabel alloc] initWithFrame:CGRectMake(4, 85, 73, 21)];
    labelNameCell5.backgroundColor = [UIColor clearColor];
    labelNameCell5.text = @"活动还没开始";
    labelNameCell5.textAlignment = NSTextAlignmentCenter;
    labelNameCell5.font = [UIFont systemFontOfSize:12];
    [viewCell5 addSubview:labelNameCell5];
    
    //view6
    UIView *viewCell6 = [[UIView alloc] initWithFrame:CGRectMake(15+160+44, 10+110, 82, 110)];
    //viewCell4.backgroundColor = [UIColor yellowColor];
    [viewCell6 setHidden:YES];
    viewCell6.tag = 15;
    [viewSportManageValue addSubview:viewCell6];
    //添加手势
    UITapGestureRecognizer *sinTapGestureCell6= [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(sinTapViewJump:)];
    [viewCell6 addGestureRecognizer:sinTapGestureCell6];
    //背景view
    UIView *viewCell6A = [[UIView alloc] initWithFrame:CGRectMake(1, 1, 80, 80)];
    viewCell6A.backgroundColor = [UIColor clearColor];
    viewCell6A.layer.masksToBounds = YES;
    viewCell6A.layer.cornerRadius = 6;
    viewCell6A.layer.borderWidth = 1;
    viewCell6A.layer.borderColor = [UIColor colorWithRed:154/255.0 green:154/255.0 blue:154/255.0 alpha:1].CGColor;
    [viewCell6 addSubview:viewCell6A];
    //图片
    UIImageView *imageViewCell6 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 80, 80)];
    [imageViewCell6 setImageWithURL:[NSURL URLWithString:sportData1.imageUrl] placeholderImage:[UIImage imageNamed:@"example1"]];
    [viewCell6A addSubview:imageViewCell6];
    //文字
    UILabel *labelNameCell6 = [[UILabel alloc] initWithFrame:CGRectMake(4, 85, 73, 21)];
    labelNameCell6.backgroundColor = [UIColor clearColor];
    labelNameCell6.text = @"活动还没开始";
    labelNameCell6.textAlignment = NSTextAlignmentCenter;
    labelNameCell6.font = [UIFont systemFontOfSize:12];
    [viewCell6 addSubview:labelNameCell6];
    /**********************************view显示部分结束*************************************************/
    
    
    
    /**************************判断部分**************************************/
    //如果请求的数据小于3个，则显示在上面
    if (cellInitDtatArray.count < 4) {
        //显示几个view
        switch (cellInitDtatArray.count) {
            case 1:
                NSLog(@"显示1");
                [viewCell1 setHidden:NO];
                break;
            case 2:
                NSLog(@"显示2");
                [viewCell1 setHidden:NO];
                [viewCell2 setHidden:NO];
                break;
            case 3:
                NSLog(@"显示3");
                [viewCell1 setHidden:NO];
                [viewCell2 setHidden:NO];
                [viewCell3 setHidden:NO];
                break;
                
            default:
                break;
        }
        /****************设置如下线的位置******************/
        viewHenXian1 = [[UIView alloc] initWithFrame:CGRectMake(0, 230-110, SCREEN_WIDTH, 1)];
        imageViewSportNews = [[UIImageView alloc] initWithFrame:CGRectMake(15, 235-110, 16, 16)];
        labelSportNews = [[UILabel alloc] initWithFrame:CGRectMake(35, 233-110, 100, 21)];
        viewHenXian2 = [[UIView alloc] initWithFrame:CGRectMake(0, 255-110, SCREEN_WIDTH, 1)];
        tableViewShow = [[UITableView alloc] initWithFrame:CGRectMake(0, 260-110, SCREEN_WIDTH, SCREEN_HEIGHT-110-255)];
        
    }else
    {
        //显示几个view
        switch (cellInitDtatArray.count) {
            case 4:
                NSLog(@"显示4");
                [viewCell1 setHidden:NO];
                [viewCell2 setHidden:NO];
                [viewCell3 setHidden:NO];
                [viewCell4 setHidden:NO];
                break;
            case 5:
                NSLog(@"显示5");
                [viewCell1 setHidden:NO];
                [viewCell2 setHidden:NO];
                [viewCell3 setHidden:NO];
                [viewCell4 setHidden:NO];
                [viewCell5 setHidden:NO];
                break;
            case 6:
                NSLog(@"显示6");
                [viewCell1 setHidden:NO];
                [viewCell2 setHidden:NO];
                [viewCell3 setHidden:NO];
                [viewCell4 setHidden:NO];
                [viewCell5 setHidden:NO];
                [viewCell6 setHidden:NO];
                break;
                
            default:
                break;
        }
        /****************设置如下线的位置******************/
        viewHenXian1 = [[UIView alloc] initWithFrame:CGRectMake(0, 230, SCREEN_WIDTH, 1)];
        imageViewSportNews = [[UIImageView alloc] initWithFrame:CGRectMake(15, 235, 16, 16)];
        labelSportNews = [[UILabel alloc] initWithFrame:CGRectMake(35, 233, 100, 21)];
        viewHenXian2 = [[UIView alloc] initWithFrame:CGRectMake(0, 255, SCREEN_WIDTH, 1)];
        tableViewShow = [[UITableView alloc] initWithFrame:CGRectMake(0, 260, SCREEN_WIDTH, SCREEN_HEIGHT-110-255)];
        
    }

    
    //大于3个时，显示在下面
    //下面时从10+110+110=230开始显示
    //viewHenXian1 = [[UIView alloc] initWithFrame:CGRectMake(0, 230, SCREEN_WIDTH, 1)];
    viewHenXian1.backgroundColor = [UIColor colorWithRed:216/255.0 green:216/255.0 blue:216/255.0 alpha:1];
    [viewSportManageValue addSubview:viewHenXian1];
    //img
    //imageViewSportNews = [[UIImageView alloc] initWithFrame:CGRectMake(15, 235, 16, 16)];
    [imageViewSportNews setImage:[UIImage imageNamed:@"sportNews"]];
    [viewSportManageValue addSubview:imageViewSportNews];
    //球队最新动态
    //labelSportNews = [[UILabel alloc] initWithFrame:CGRectMake(35, 233, 100, 21)];
    labelSportNews.text = @"球队最新动态";
    labelSportNews.font = [UIFont systemFontOfSize:14];
    [viewSportManageValue addSubview:labelSportNews];
    //横线2
    //viewHenXian2 = [[UIView alloc] initWithFrame:CGRectMake(0, 255, SCREEN_WIDTH, 1)];
    viewHenXian2.backgroundColor = [UIColor colorWithRed:216/255.0 green:216/255.0 blue:216/255.0 alpha:1];
    [viewSportManageValue addSubview:viewHenXian2];
    
    
    //初始化数组数据
    cellDataArray = [[NSMutableArray alloc] init];
    SportDataCell *sportCell = [[SportDataCell alloc] init];
    sportCell.sportName = @"师兄dkdfjfjfj";
    sportCell.sportContent = @"地方刚回家的法规和健康是豆腐地方刚回家的法规和健是豆复";
    sportCell.sportTime = @"2015年10月05日";
    [cellDataArray addObject:sportCell];
    SportDataCell *sportCell2 = [[SportDataCell alloc] init];
    sportCell2.sportName = @"师兄";
    [cellDataArray addObject:sportCell2];
    SportDataCell *sportCell3 = [[SportDataCell alloc] init];
    sportCell3.sportName = @"师兄";
    [cellDataArray addObject:sportCell3];
    
    //放tableView
    //tableViewShow = [[UITableView alloc] initWithFrame:CGRectMake(0, 260, SCREEN_WIDTH, SCREEN_HEIGHT-110-255)];
    //设置代理
    tableViewShow.delegate = self;
    tableViewShow.dataSource = self;
    //去除分割线
    tableViewShow.separatorStyle = UITableViewCellSeparatorStyleNone;
    //设置tag值
    tableViewShow.tag = 10;
    //注册cell
    [tableViewShow registerClass:[MyTeamTableViewCell class] forCellReuseIdentifier:@"MyTeamTableViewCell"];
    [viewSportManageValue addSubview:tableViewShow];
}


//装值的个数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if ([tableView isEqual:tableViewInner]) {
        return cellSportInnerArray.count;
    }else
    {
    return cellDataArray.count;
    }
}

//行高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([tableView isEqual:tableViewInner]) {
        return 80;
    }else
    {
    return 60;
    }
}

//装值
- (UITableViewCell *)tableView:(UITableView *)tableViews
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([tableViews isEqual:tableViewInner]) {
        
        static NSString *identifier = @"SportInnerAcyivityTableViewCell";
        
        SportInnerAcyivityTableViewCell *cell = (SportInnerAcyivityTableViewCell *)[tableViews dequeueReusableCellWithIdentifier:identifier];
        if (cell==nil) {
            cell = [[[NSBundle mainBundle] loadNibNamed:identifier owner:self options:nil]objectAtIndex:0];
        }
        //取消点击cell时显示的背景色
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell initCellDataInner:[cellSportInnerArray objectAtIndex:indexPath.row]];
        return cell;
        
    }else
    {
    static NSString *identifier = @"MyTeamTableViewCell";
    
    MyTeamTableViewCell *cell = (MyTeamTableViewCell *)[tableViews dequeueReusableCellWithIdentifier:identifier];
    if (cell==nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:identifier owner:self options:nil]objectAtIndex:0];
    }
    //取消点击cell时显示的背景色
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell initCellData:[cellDataArray objectAtIndex:indexPath.row]];
    return cell;
    }
}

//选中哪一行
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //先隐藏这个view
    flagChoice = 0;
    [viewChoice setHidden:YES];
    [viewChoice removeFromSuperview];
    viewChoice = nil;
    
    NSLog(@"选中第%d行",indexPath.row);
    
    if ([tableView isEqual:tableViewInner]) {
        SportInnerActivityDetailViewController *sportInnerActivityDetailViewController = [[SportInnerActivityDetailViewController alloc] init];
        [self.navigationController pushViewController:sportInnerActivityDetailViewController animated:YES];
    }else
    {
    //选中了哪行，就将哪行的字变灰色
    MyTeamTableViewCell *cell = (MyTeamTableViewCell *)[tableView cellForRowAtIndexPath:indexPath];
    cell.labelSportName.textColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1];
    cell.labelSportNameShow.textColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1];
    
    //跳往下一个页面
    SportNewsViewController *sportNewsViewController = [[SportNewsViewController alloc] init];
    sportNewsViewController.receicedName = ((SportDataCell *)[cellDataArray objectAtIndex:indexPath.row]).sportName;
    sportNewsViewController.receivedTime = ((SportDataCell *)[cellDataArray objectAtIndex:indexPath.row]).sportTime;
    sportNewsViewController.receivedContent = ((SportDataCell *)[cellDataArray objectAtIndex:indexPath.row]).sportContent;
    [self.navigationController pushViewController:sportNewsViewController animated:NO];
    }
    
}

int lastContentOffset;
int xx;
-(void)scrollViewWillBeginDragging:(UIScrollView*)scrollView{
    lastContentOffset = scrollView.contentOffset.y;
}
-( void )scrollViewDidScroll:( UIScrollView *)scrollView {
    
    //如果滑动的是球队管理页面的tableview
    if (scrollView.tag == 10) {
        NSLog(@"滑动了球队管理tableview");
        return;
    }
    
    if (scrollView.contentOffset.y< lastContentOffset )
    {
        //NSLog(@"向上");
        flagUp = 1;
        
    } else if (scrollView. contentOffset.y >lastContentOffset )
    {
        //NSLog(@"向下");
        flagDown = 1;

    }
    
    
    if (scrollView.contentOffset.x < xx) {
        NSLog(@"向右滑动");
    }else
    {
        //NSLog(@"向左滑动");
        flagLeft = 1;
    }
    
}

- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView
{
    NSLog(@"开始检测");
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    if (scrollView.tag == 10) {
        NSLog(@"滑动了球队管理tableview");
    }
    
    if (flagUp && flagLeft) {
        NSLog(@"上下滑动vvvv");
        [buttonTeamInnerActivity setSelected:YES];
        [buttonTeamManage setSelected:NO];
        viewH2.frame = CGRectMake(SCREEN_WIDTH/2, 108, SCREEN_WIDTH/2, 2);
    }else if(flagDown && flagLeft)
    {
        NSLog(@"上下滑动vvvv");
        [buttonTeamInnerActivity setSelected:YES];
        [buttonTeamManage setSelected:NO];
        viewH2.frame = CGRectMake(SCREEN_WIDTH/2, 108, SCREEN_WIDTH/2, 2);
    }else
    {
        NSLog(@"左右滑动");
        if (scrollView.contentOffset.x < 320) {
            [buttonTeamInnerActivity setSelected:NO];
            [buttonTeamManage setSelected:YES];
            viewH2.frame = CGRectMake(0+scrollView.contentOffset.x/2, 108, SCREEN_WIDTH/2, 2);
        }else
        {
            [buttonTeamInnerActivity setSelected:YES];
            [buttonTeamManage setSelected:NO];
            viewH2.frame = CGRectMake(0+scrollView.contentOffset.x/2, 108, SCREEN_WIDTH/2, 2);
        }
    }
    
    NSLog(@"结束检测");
    NSLog(@"移动值:%f",scrollView.contentOffset.x);
    
    //移动结束清零
    flagUp = 0;
    flagDown = 0;
    flagLeft = 0;
}



//请求我的球队数据
-(void) getMyTeamData
{
    NSString *tmpUserId = @"1000000000";
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [manager.requestSerializer setValue:@"application/json; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [manager GET:WEB_SERVICE_GETMYTEAM(tmpUserId) parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         if (operation.response.statusCode == 200)
         {
             NSDictionary *dic = operation.responseObject;
             NSLog(@"111");
             
         }else
         {
             UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示" message:@"出现异常" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
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


//按钮执行方法
-(IBAction)clickBtn:(id)sender
{
    UIButton *tmpBtn = (UIButton *)sender;
    //int tmpTag = tmpBtn.tag;
    
    //tag = 10
    //点击了返回按钮
    if (tmpBtn.tag == 10) {
        NSLog(@"点击了返回按钮");
    }
    
    //tag = 11
    //点击了发起活动按钮
    if (tmpBtn.tag == 11) {
        NSLog(@"点击了发起活动按钮");
        
        if (flagChoice == 0) {
            flagChoice = 1;
            //弹出一个view
            viewChoice = [[UIView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2-30, 64, 121*1.5, 124*1.5)];
            [self.view addSubview:viewChoice];
            viewChoice.layer.contents = (__bridge id)([UIImage imageNamed:@"bgChoice"].CGImage);
            
            UIButton *buttonInit = [[UIButton alloc] initWithFrame:CGRectMake(0, 20, 180, 35)];
            buttonInit.backgroundColor = [UIColor clearColor];
            [buttonInit setTitle:@"发起活动" forState:UIControlStateNormal];
            [buttonInit setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            buttonInit.titleEdgeInsets = UIEdgeInsetsMake(0, 50, 0, 0);
            buttonInit.tag = 10;
            [buttonInit addTarget:self action:@selector(clickSureBtn:) forControlEvents:UIControlEventTouchUpInside];
            [viewChoice addSubview:buttonInit];
            //发起活动
            UIImageView *imageInit = [[UIImageView alloc] initWithFrame:CGRectMake(20, 0, 30, 35)];
            [imageInit setImage:[UIImage imageNamed:@"initSport"]];
            [buttonInit addSubview:imageInit];
            
            
            UIButton *buttonCreat = [[UIButton alloc] initWithFrame:CGRectMake(0, 60+20, 180, 35)];
            buttonCreat.backgroundColor = [UIColor clearColor];
            [buttonCreat setTitle:@"创建球队" forState:UIControlStateNormal];
            [buttonCreat setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            buttonCreat.titleEdgeInsets = UIEdgeInsetsMake(0, 50, 0, 0);
            buttonCreat.tag = 11;
            [buttonCreat addTarget:self action:@selector(clickSureBtn:) forControlEvents:UIControlEventTouchUpInside];
            [viewChoice addSubview:buttonCreat];
            //创建球队
            UIImageView *imageCreat = [[UIImageView alloc] initWithFrame:CGRectMake(18, 2, 42, 30)];
            [imageCreat setImage:[UIImage imageNamed:@"creatSport"]];
            [buttonCreat addSubview:imageCreat];
            
        
            UIButton *buttonFind = [[UIButton alloc] initWithFrame:CGRectMake(0, 120+20, 180, 35)];
            buttonFind.backgroundColor = [UIColor clearColor];
            [buttonFind setTitle:@"查找球队" forState:UIControlStateNormal];
            [buttonFind setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            buttonFind.titleEdgeInsets = UIEdgeInsetsMake(0, 50, 0, 0);
            buttonFind.tag = 12;
            [buttonFind addTarget:self action:@selector(clickSureBtn:) forControlEvents:UIControlEventTouchUpInside];
            [viewChoice addSubview:buttonFind];
            //查找球队
            UIImageView *imageFind = [[UIImageView alloc] initWithFrame:CGRectMake(20, 2, 30, 30)];
            [imageFind setImage:[UIImage imageNamed:@"findSport"]];
            [buttonFind addSubview:imageFind];
        }else
        {
            flagChoice = 0;
            [viewChoice setHidden:YES];
            [viewChoice removeFromSuperview];
            viewChoice = nil;
        }
        
       
        
    }
    
    //tag = 12
    //点击了球队管理
    if (tmpBtn.tag == 12) {
        NSLog(@"点击了球队管理按钮");
        
        [scrollViewAll setContentOffset:CGPointMake(0, 0) animated:YES];
        [buttonTeamInnerActivity setSelected:NO];
        [buttonTeamManage setSelected:YES];
        viewH2.frame = CGRectMake(0, 108, SCREEN_WIDTH/2, 2);
    }
    
    //tag = 13
    //点击了球队内部活动
    if (tmpBtn.tag == 13) {
        NSLog(@"点击了球队内部活动");
        
        [scrollViewAll setContentOffset:CGPointMake(SCREEN_WIDTH, 0) animated:YES];
        [buttonTeamInnerActivity setSelected:YES];
        [buttonTeamManage setSelected:NO];
        viewH2.frame = CGRectMake(SCREEN_WIDTH/2, 108, SCREEN_WIDTH/2, 2);

    }
    
    //tag = 14
    //点击了创建球队
    if (tmpBtn.tag == 14) {
        NSLog(@"点击了创建球队");
        CreateViewController *createViewController = [[CreateViewController alloc] init];
        [self.navigationController pushViewController:createViewController animated:YES];
    }
    
    //tag = 15
    //点击了查找球队
    if (tmpBtn.tag == 15) {
        NSLog(@"点击了查找球队");
        FindViewController *findViewController = [[FindViewController alloc] init];
        [self.navigationController pushViewController:findViewController animated:YES];
    }
    
    //tag = 16
    //点击了发起活动
    if (tmpBtn.tag == 16) {
        NSLog(@"点击了发起活动");
        InitiateViewController *initiateViewController = [[InitiateViewController alloc] init];
        [self.navigationController pushViewController:initiateViewController animated:YES];
    }
    
}

//响应内部按钮方法
-(void)clickSureBtn:(id) sender
{
    UIButton *btn = sender;
    switch (btn.tag) {
        case 10:
            NSLog(@"跳往发起活动页面");
            [self initSport];
            break;
        case 11:
            NSLog(@"跳往创建活动页面");
            [self creatSport];
            break;
        case 12:
            NSLog(@"跳往查找球队页面");
            [self findSport];
            break;
            
        default:
            break;
    }
    
}

//创建球队
-(void) creatSport
{
    flagChoice = 0;
    [viewChoice setHidden:YES];
    [viewChoice removeFromSuperview];
    viewChoice = nil;
    CreateViewController *createViewController = [[CreateViewController alloc] init];
    [self.navigationController pushViewController:createViewController animated:YES];
}
//发起活动
-(void) initSport
{
    flagChoice = 0;
    [viewChoice setHidden:YES];
    [viewChoice removeFromSuperview];
    viewChoice = nil;
    InitiateViewController *initiateViewController = [[InitiateViewController alloc] init];
    [self.navigationController pushViewController:initiateViewController animated:YES];
}
//查找球队
-(void) findSport
{
    flagChoice = 0;
    [viewChoice setHidden:YES];
    [viewChoice removeFromSuperview];
    viewChoice = nil;
    FindViewController *findViewController = [[FindViewController alloc] init];
    [self.navigationController pushViewController:findViewController animated:YES];
}

//隐藏view
-(void)sinTapView:(UITapGestureRecognizer *)sender
{
    flagChoice = 0;
    [viewChoice setHidden:YES];
    [viewChoice removeFromSuperview];
    viewChoice = nil;
}

//单击手势跳转
//单击手势
-(void)sinTapViewJump:(UITapGestureRecognizer *)sender
{
    //隐藏view
    flagChoice = 0;
    [viewChoice setHidden:YES];
    [viewChoice removeFromSuperview];
    viewChoice = nil;
    
    
    //1.先判断点击了哪个view
    int viewTag =sender.view.tag;
    NSLog(@"点击了%d",viewTag);
    SportDatumViewController *sportDatumViewController = [[SportDatumViewController alloc] init];
    [self.navigationController pushViewController:sportDatumViewController animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
