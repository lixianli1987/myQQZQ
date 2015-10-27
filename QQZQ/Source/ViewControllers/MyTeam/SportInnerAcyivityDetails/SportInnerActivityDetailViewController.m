//
//  SportInnerActivityDetailViewController.m
//  QQZQ
//
//  Created by cafuc on 15/10/6.
//  Copyright (c) 2015年 cafuc. All rights reserved.
//

#import "SportInnerActivityDetailViewController.h"
#import "MyUtils.h"


@interface SportInnerActivityDetailViewController ()<UIScrollViewDelegate>

@end

@implementation SportInnerActivityDetailViewController

@synthesize buttonBack;
@synthesize buttonShare;
@synthesize scrollViewAll;
@synthesize viewLeft;
@synthesize viewRight;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //设置代理
    scrollViewAll.delegate = self;
    //设置内容大小
    scrollViewAll.contentSize = CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT * 1.3);
    
    //初始化scrollview数据
    [self initScrollViewData];
    
    //给左右view加手势
    UITapGestureRecognizer *sinTapGestureLeft= [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(sinTapView:)];
    [viewLeft addGestureRecognizer:sinTapGestureLeft];
    UITapGestureRecognizer *sinTapGestureRight= [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(sinTapView:)];
    [viewRight addGestureRecognizer:sinTapGestureRight];
    
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


//初始化scrollview数据
-(void) initScrollViewData
{
    /*********************************view1模块*********************************************/
    //放置一个uiview，用于放 活动头像、球队名称、活动名称、发起人、报名状态、横线、已报名人数、剩余人数
    UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 120)];
    view1.backgroundColor = [UIColor whiteColor];
    [scrollViewAll addSubview:view1];
    
    //头像
    UIImageView *imageHeader = [[UIImageView alloc] initWithFrame:CGRectMake(15, 10, 60, 60)];
    [imageHeader setImage:[UIImage imageNamed:@"example1"]];
    [view1 addSubview:imageHeader];
    //放置球队名称
    UILabel *labelSportName = [[UILabel alloc] initWithFrame:CGRectMake(15+60+5, 10, 60, 21)];
    labelSportName.text = @"球队名称:";
    labelSportName.font = [UIFont systemFontOfSize:12];
    [view1 addSubview:labelSportName];
    //球队名称显示
    UILabel *labelSportNameShow = [[UILabel alloc] initWithFrame:CGRectMake(80+60, 10, 150, 21)];
    labelSportNameShow.text = @"成都老曼联成都老曼联";
    labelSportNameShow.textColor = [UIColor colorWithRed:62/255.0 green:199/255.0 blue:139/255.0 alpha:1];
    labelSportNameShow.font = [UIFont systemFontOfSize:12];
    [view1 addSubview:labelSportNameShow];
    //活动名称
    UILabel *labelActivityName = [[UILabel alloc] initWithFrame:CGRectMake(15+60+5, 10+21, 60, 21)];
    labelActivityName.text = @"活动名称:";
    labelActivityName.font = [UIFont systemFontOfSize:12];
    [view1 addSubview:labelActivityName];
    //活动名称显示
    UILabel *labelActivityNameShow = [[UILabel alloc] initWithFrame:CGRectMake(80+60, 10+21, 150, 21)];
    labelActivityNameShow.text = @"快来报名哦哦哦哦哦哦哦哦哦哦哦哦";
    labelActivityNameShow.font = [UIFont systemFontOfSize:12];
    [view1 addSubview:labelActivityNameShow];
    //发起人
    UILabel *labelFQRName = [[UILabel alloc] initWithFrame:CGRectMake(15+60+5, 10+21+21, 50, 21)];
    labelFQRName.text = @"发起人:";
    labelFQRName.font = [UIFont systemFontOfSize:12];
    [view1 addSubview:labelFQRName];
    //发起人显示
    UILabel *labelFQRNameShow = [[UILabel alloc] initWithFrame:CGRectMake(80+50, 10+21+21, 80, 21)];
    labelFQRNameShow.text = @"小鱼儿师弟";
    labelFQRNameShow.textColor = [UIColor colorWithRed:62/255.0 green:199/255.0 blue:139/255.0 alpha:1];
    labelFQRNameShow.font = [UIFont systemFontOfSize:12];
    [view1 addSubview:labelFQRNameShow];
    //报名状态
    UIButton *buttonActivityStatus = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH-70, 48, 50, 25)];
    [buttonActivityStatus setTitle:@"点击报名" forState:UIControlStateNormal];
    [buttonActivityStatus setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    buttonActivityStatus.titleLabel.font = [UIFont systemFontOfSize:10];
    buttonActivityStatus.layer.masksToBounds = YES;
    buttonActivityStatus.layer.cornerRadius = 2;
    buttonActivityStatus.layer.borderWidth = 1;
    buttonActivityStatus.layer.borderColor = [UIColor redColor].CGColor;
    //button加个监测事件
    [view1 addSubview:buttonActivityStatus];
    //加一条横线
    UIView *viewHengxian1 = [[UIView alloc] initWithFrame:CGRectMake(20, 80, SCREEN_WIDTH-20, 1)];
    viewHengxian1.backgroundColor = [UIColor colorWithRed: 216/255.0 green: 216/255.0 blue: 216/255.0 alpha:1];
    [view1 addSubview:viewHengxian1];
    //加一个view，这一行都可以点击
    UIView *viewPeopleList = [[UIView alloc] initWithFrame:CGRectMake(0, 82, SCREEN_WIDTH, 40)];
    //viewPeopleList.backgroundColor = [UIColor redColor];
    //加跳转手势
    [view1 addSubview:viewPeopleList];
    //已报名头像
    UIImageView *imageRegisted = [[UIImageView alloc] initWithFrame:CGRectMake(20, 10, 15, 15)];
    [imageRegisted setImage:[UIImage imageNamed:@"registeredNum"]];
    [viewPeopleList addSubview:imageRegisted];
    //已报名人数
    UILabel *labelRegistedNum= [[UILabel alloc] initWithFrame:CGRectMake(38, 7, 45, 21)];
    labelRegistedNum.text = @"已报名:";
    labelRegistedNum.font = [UIFont systemFontOfSize:12];
    [viewPeopleList addSubview:labelRegistedNum];
    //已报名人数显示
    UILabel *labelRegistedNumShow= [[UILabel alloc] initWithFrame:CGRectMake(80, 7, 30, 21)];
    labelRegistedNumShow.text = @"5人";
    labelRegistedNumShow.font = [UIFont systemFontOfSize:12];
    [viewPeopleList addSubview:labelRegistedNumShow];
    //加一条横线
    UIView *viewShuxian1 = [[UIView alloc] initWithFrame:CGRectMake(111, 10, 1, 20)];
    viewShuxian1.backgroundColor = [UIColor colorWithRed: 216/255.0 green: 216/255.0 blue: 216/255.0 alpha:1];
    [viewPeopleList addSubview:viewShuxian1];
    //剩余人数
    UILabel *labelRSurplusdNum= [[UILabel alloc] initWithFrame:CGRectMake(121, 7, 60, 21)];
    labelRSurplusdNum.text = @"剩余名额:";
    labelRSurplusdNum.font = [UIFont systemFontOfSize:12];
    [viewPeopleList addSubview:labelRSurplusdNum];
    //剩余人数显示
    UILabel *labelSurplusNumShow= [[UILabel alloc] initWithFrame:CGRectMake(181, 7, 30, 21)];
    labelSurplusNumShow.text = @"8人";
    labelSurplusNumShow.font = [UIFont systemFontOfSize:12];
    [viewPeopleList addSubview:labelSurplusNumShow];
    //右箭头
    UIImageView *imageRight = [[UIImageView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH-26-15, 10, 9, 17)];
    [imageRight setImage:[UIImage imageNamed:@"right2"]];
    [viewPeopleList addSubview:imageRight];
    
    
    /*********************************view2模块*********************************************/
    //view2从130开始
    UIView *view2 = [[UIView alloc] initWithFrame:CGRectMake(0, 130, SCREEN_WIDTH, 120)];
    view2.backgroundColor = [UIColor whiteColor];
    [scrollViewAll addSubview:view2];
    
    //活动地点图像
    UIImageView *imageLocation = [[UIImageView alloc] initWithFrame:CGRectMake(20, 12, 15, 15)];
    [imageLocation setImage:[UIImage imageNamed:@"activityLocation"]];
    [view2 addSubview:imageLocation];
    //活动地点名称
    UILabel *labelLocation= [[UILabel alloc] initWithFrame:CGRectMake(38, 10, 60, 21)];
    labelLocation.text = @"活动地点:";
    labelLocation.font = [UIFont systemFontOfSize:12];
    [view2 addSubview:labelLocation];
    //活动地点名称显示
    UILabel *labelLocationShow= [[UILabel alloc] initWithFrame:CGRectMake(98, 10, 200, 21)];
    labelLocationShow.text = @"高新区瑞博足球公园";
    labelLocationShow.font = [UIFont systemFontOfSize:12];
    [view2 addSubview:labelLocationShow];
    //加一条横线
    UIView *viewHengxianLocation = [[UIView alloc] initWithFrame:CGRectMake(20, 40, SCREEN_WIDTH-20, 1)];
    viewHengxianLocation.backgroundColor = [UIColor colorWithRed: 216/255.0 green: 216/255.0 blue: 216/255.0 alpha:1];
    [view2 addSubview:viewHengxianLocation];
    //活动类型图像
    UIImageView *imageType = [[UIImageView alloc] initWithFrame:CGRectMake(20, 12+40, 15, 15)];
    [imageType setImage:[UIImage imageNamed:@"activityType"]];
    [view2 addSubview:imageType];
    //活动地点名称
    UILabel *labelType= [[UILabel alloc] initWithFrame:CGRectMake(38, 10+40, 60, 21)];
    labelType.text = @"活动类型:";
    labelType.font = [UIFont systemFontOfSize:12];
    [view2 addSubview:labelType];
    //活动地点名称显示
    UILabel *labelTypeShow= [[UILabel alloc] initWithFrame:CGRectMake(98, 10+40, 50, 21)];
    labelTypeShow.text = @"5人场";
    labelTypeShow.font = [UIFont systemFontOfSize:12];
    [view2 addSubview:labelTypeShow];
    //加一条横线
    UIView *viewHengxianType = [[UIView alloc] initWithFrame:CGRectMake(20, 40+40, SCREEN_WIDTH-20, 1)];
    viewHengxianType.backgroundColor = [UIColor colorWithRed: 216/255.0 green: 216/255.0 blue: 216/255.0 alpha:1];
    [view2 addSubview:viewHengxianType];
    //活动时间图像
    UIImageView *imageTime = [[UIImageView alloc] initWithFrame:CGRectMake(20, 12+80, 15, 15)];
    [imageTime setImage:[UIImage imageNamed:@"activityTime"]];
    [view2 addSubview:imageTime];
    //活动地点名称
    UILabel *labelTime= [[UILabel alloc] initWithFrame:CGRectMake(38, 10+80, 80, 21)];
    labelTime.text = @"活动开始时间:";
    labelTime.font = [UIFont systemFontOfSize:12];
    [view2 addSubview:labelTime];
    //活动地点名称显示
    UILabel *labelTimeShow= [[UILabel alloc] initWithFrame:CGRectMake(118, 10+80, 200, 21)];
    labelTimeShow.text = @"2015年10月6日 周二 18：00";
    labelTimeShow.font = [UIFont systemFontOfSize:12];
    [view2 addSubview:labelTimeShow];
    
    /*********************************view3模块*********************************************/
    //view3从260开始
    UIView *view3 = [[UIView alloc] initWithFrame:CGRectMake(0, 260, SCREEN_WIDTH, 110)];
    view3.backgroundColor = [UIColor whiteColor];
    [scrollViewAll addSubview:view3];
    //活动费用图像
    UIImageView *imageFee = [[UIImageView alloc] initWithFrame:CGRectMake(20, 12, 15, 15)];
    [imageFee setImage:[UIImage imageNamed:@"activityFee"]];
    [view3 addSubview:imageFee];
    //活动地点名称
    UILabel *labelFee= [[UILabel alloc] initWithFrame:CGRectMake(38, 10, 60, 21)];
    labelFee.text = @"活动费用:";
    labelFee.font = [UIFont systemFontOfSize:12];
    [view3 addSubview:labelFee];
    //活动地点名称显示
    UILabel *labelFeeShow= [[UILabel alloc] initWithFrame:CGRectMake(98, 10, 100, 21)];
    labelFeeShow.text = @"360元/场";
    labelFeeShow.font = [UIFont systemFontOfSize:12];
    [view3 addSubview:labelFeeShow];
    //加一条横线
    UIView *viewHengxianFee = [[UIView alloc] initWithFrame:CGRectMake(20, 40, SCREEN_WIDTH-20, 1)];
    viewHengxianFee.backgroundColor = [UIColor colorWithRed: 216/255.0 green: 216/255.0 blue: 216/255.0 alpha:1];
    [view3 addSubview:viewHengxianFee];
    //活动说明
    UIImageView *imageInstrction = [[UIImageView alloc] initWithFrame:CGRectMake(20, 12+40, 15, 15)];
    [imageInstrction setImage:[UIImage imageNamed:@"activityInstruction"]];
    [view3 addSubview:imageInstrction];
    //活动地点名称
    UILabel *labelInstrction= [[UILabel alloc] initWithFrame:CGRectMake(38, 10+40, 60, 21)];
    labelInstrction.text = @"活动说明:";
    labelInstrction.font = [UIFont systemFontOfSize:12];
    [view3 addSubview:labelInstrction];
    //说明内容
    UITextView *textViewInstruction = [[UITextView alloc] initWithFrame:CGRectMake(20, 50, SCREEN_WIDTH-40, 50)];
    textViewInstruction.font = [UIFont systemFontOfSize:12];
    textViewInstruction.text = @"是大法官好久考试的风格好久卡上的法规和健康是大法官货架上的法规和健康是地方刚回家地方刚回家的法规和解释道飞规划局";
    textViewInstruction.editable = NO;
    [view3 addSubview:textViewInstruction];
    
    /*********************************view4模块*********************************************/
    //view4从380开始
    UIView *view4 = [[UIView alloc] initWithFrame:CGRectMake(0, 380, SCREEN_WIDTH, 170)];
    view4.backgroundColor = [UIColor whiteColor];
    [scrollViewAll addSubview:view4];
    
    //活动费用方式
    UIImageView *imageFeeType = [[UIImageView alloc] initWithFrame:CGRectMake(20, 12, 15, 15)];
    [imageFeeType setImage:[UIImage imageNamed:@"activityFeeType"]];
    [view4 addSubview:imageFeeType];
    //活动地点名称
    UILabel *labelFeeType= [[UILabel alloc] initWithFrame:CGRectMake(38, 10, 60, 21)];
    labelFeeType.text = @"计费方式:";
    labelFeeType.font = [UIFont systemFontOfSize:12];
    [view4 addSubview:labelFeeType];
    //活动地点名称显示
    UILabel *labelFeeTypeShow= [[UILabel alloc] initWithFrame:CGRectMake(98, 10, 100, 21)];
    labelFeeTypeShow.text = @"总价分摊";
    labelFeeTypeShow.font = [UIFont systemFontOfSize:12];
    [view4 addSubview:labelFeeTypeShow];
    //加一条横线
    UIView *viewHengxianFeeType = [[UIView alloc] initWithFrame:CGRectMake(20, 40, SCREEN_WIDTH-20, 1)];
    viewHengxianFeeType.backgroundColor = [UIColor colorWithRed: 216/255.0 green: 216/255.0 blue: 216/255.0 alpha:1];
    [view4 addSubview:viewHengxianFeeType];
    //计费说明
    UIImageView *imageInstrctionType = [[UIImageView alloc] initWithFrame:CGRectMake(20, 12+40, 15, 15)];
    [imageInstrctionType setImage:[UIImage imageNamed:@"activityTypeInstruction"]];
    [view4 addSubview:imageInstrctionType];
    //活动地点名称
    UILabel *labelInstrctionType= [[UILabel alloc] initWithFrame:CGRectMake(38, 10+40, 200, 21)];
    labelInstrctionType.text = @"总价分摊代收费说明:";
    labelInstrctionType.font = [UIFont systemFontOfSize:12];
    [view4 addSubview:labelInstrctionType];
    //说明内容
    UITextView *textViewInstructionType = [[UITextView alloc] initWithFrame:CGRectMake(20, 75, SCREEN_WIDTH-40, 80)];
    //textViewInstructionType.backgroundColor = [UIColor redColor];
    textViewInstructionType.font = [UIFont systemFontOfSize:12];
    textViewInstructionType.text = @"是大法官好久考试的风格好久卡上的法规和健康是大法官货架上的法规和健康是地方刚回家地方刚回家的法规和解释道飞规划局是大法官好久考试的风格好久卡上的法规和健康是大法官货架上的法规和健康是地方刚回家地方刚回家的法规和解释道飞规划局";
    textViewInstructionType.editable = NO;
    [view4 addSubview:textViewInstructionType];

    /*********************************view5模块*********************************************/
    //view5从560开始
    UIView *view5 = [[UIView alloc] initWithFrame:CGRectMake(0, 560, SCREEN_WIDTH, 130)];
    view5.backgroundColor = [UIColor whiteColor];
    [scrollViewAll addSubview:view5];
    
    //活动介绍
    UIImageView *imageInstrctionProfile = [[UIImageView alloc] initWithFrame:CGRectMake(20, 12, 15, 15)];
    [imageInstrctionProfile setImage:[UIImage imageNamed:@"activityProfile"]];
    [view5 addSubview:imageInstrctionProfile];
    //活动地点名称
    UILabel *labelInstrctionProfile= [[UILabel alloc] initWithFrame:CGRectMake(38, 10, 60, 21)];
    labelInstrctionProfile.text = @"活动介绍";
    labelInstrctionProfile.font = [UIFont systemFontOfSize:12];
    [view5 addSubview:labelInstrctionProfile];
    //说明内容
    UITextView *textViewInstructionProfile = [[UITextView alloc] initWithFrame:CGRectMake(20, 35, SCREEN_WIDTH-40, 80)];
    //textViewInstructionType.backgroundColor = [UIColor redColor];
    textViewInstructionProfile.font = [UIFont systemFontOfSize:12];
    textViewInstructionProfile.text = @"是大法官好久考试的风格好久卡上的法规和健康是大法官货架上的法规和健康是地方刚回家地方刚回家的法规和解释道飞规划局是大法官好久考试的风格好久卡上的法规和健康是大法官货架上的法规和健康是地方刚回家地方刚回家的法规和解释道飞规划局";
    textViewInstructionProfile.editable = NO;
    [view5 addSubview:textViewInstructionProfile];
}


//检测手势
-(void)sinTapView:(UITapGestureRecognizer *)sender
{

    //1.先判断点击了哪个view
    int viewTag =sender.view.tag;
    NSLog(@"点击了%d",viewTag);
    
    if (viewTag == 10) {
        //1.改变scrollView的高度
        //2.产生一个view
        //3.加在最后位置上
        /******view*******/
        //view从690开始
        
        
    }
    

}



//按钮执行方法
-(IBAction)clickBtn:(id)sender
{
    UIButton *tmpBtn = (UIButton *)sender;
    
    //tag = 10
    //点击了返回按钮
    switch (tmpBtn.tag) {
        case 10:
            NSLog(@"点击了返回按钮");
            [self.navigationController popViewControllerAnimated:YES];
            break;
        case 11:
            NSLog(@"点击了发布按钮");
            //提交数据
            
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
