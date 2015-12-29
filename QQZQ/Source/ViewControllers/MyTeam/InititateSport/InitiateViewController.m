//
//  InitiateViewController.m
//  QQZQ
//
//  Created by cafuc on 15/9/5.
//  Copyright (c) 2015年 cafuc. All rights reserved.
//

#import "InitiateViewController.h"
#import "MyUtils.h"
#import "ChoiceSportTeamViewController.h"
#import "Common.h"


@interface InitiateViewController ()<UIScrollViewDelegate,UITextFieldDelegate,UITextViewDelegate>
{
    //选择 球队内部活动和公开活动
    //0:球队内部活动  1:公开活动
    int flagChoice;
    UIButton *buttonInner;
    UIButton *buttonPublic;
    
    //5 7 9 11
    int flagChoice2;
    UIButton *buttonFive;
    UIButton *buttonSeven;
    UIButton *buttonNine;
    UIButton *buttonEleven;
    
    //吃喝玩乐
    int flagChoice3;
    UIButton *buttonCHWL;
    
    //活动费用
    int flagChoice4;
    UIButton *buttonAllPrice;
    UIButton *buttonUnitPrice;
    UIButton *buttonAccount;
    
    //活动介绍
    UITextView *textViewProfile;
    
    //
    int flagAbout;
    UIButton *buttonNotAbout;
    UIButton *buttonAbout;
    
    //
    UIView *viewExtend;
    
    //标志位flag
    //flag为0时，说明没有扩展
    int flag;
    
    //活动时间
    UILabel *labelTime;
    
    //背景view
    UIView *viewDate;
    
    //活动标题
    UITextField *textFieldName;
    //活动地点
    UITextField *textFieldLocation;
    
    //总价/场
    UITextField *textFieldAllPrice;
    
    //单价/人
    UITextField *textFieldUnitPrice;
    
    //总价/场
    UITextField *textFieldAccount;
    
    //说明信息flag
    //0:总价分摊
    //1:固定单价
    //2:记账
    //3.人数下限
    int flagInstruction;
    
}

@end

@implementation InitiateViewController

@synthesize scrollViewAll;
@synthesize view1;
@synthesize view2;
@synthesize view3;
@synthesize view4;
@synthesize view5;
@synthesize view6;
@synthesize labelSportName;
@synthesize datePicker;



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    NSLog(@"进来没");
    
    //设定默认值
    flagChoice = 0;
    flagChoice2 = 5;
    flagChoice3 = 0;
    flagChoice4 = 0;
    //默认显示关联
    flagAbout = 1;
    //默认没有扩展
    flag = 0;
    //设置默认值
    flagInstruction = 0;
    
    //设置代理
    scrollViewAll.delegate = self;
    //设置内容大小
    scrollViewAll.contentSize = CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT * 2);
    //
    [self initScrollView];
    
}


-(void) initScrollView
{
    /*********************************view1模块*********************************************/
    
    //放置一个uiview，用于放 活动标题、活动地点、活动日期、活动时间
    view1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 147)];
    view1.backgroundColor = [UIColor whiteColor];
    
    //放置※
    UIImageView *imageView1 = [[UIImageView alloc] initWithFrame:CGRectMake(17, 15, 17, 17)];
    [imageView1 setImage:[UIImage imageNamed:@"xingHao"]];
    [view1 addSubview:imageView1];
    
    //活动标题lable
    UILabel *labelName = [[UILabel alloc] initWithFrame:CGRectMake(40, 13, 60, 21)];
    labelName.text = @"活动标题";
    //labelName.font = [UIFont systemFontOfSize:15];
    [labelName setFont:[UIFont fontWithName:@"Helvetica-Bold" size:15]];
    [view1 addSubview:labelName];
    
    //活动标题输入textField
    textFieldName = [[UITextField alloc] initWithFrame:CGRectMake(106, 10, 200, 30)];
    textFieldName.placeholder = @"请输入十五字以内……";
    textFieldName.font = [UIFont systemFontOfSize:14];
    textFieldName.delegate = self;
    [view1 addSubview:textFieldName];
    
    //横线1
    UIView *viewHenXian1 = [[UIView alloc] initWithFrame:CGRectMake(20, 49, SCREEN_WIDTH-20, 1)];
    viewHenXian1.backgroundColor = [UIColor colorWithRed:216/255.0 green:216/255.0 blue:216/255.0 alpha:1];
    [view1 addSubview:viewHenXian1];
    
    //活动地点label
    UILabel *labelLocation = [[UILabel alloc] initWithFrame:CGRectMake(40, 49+13, 60, 21)];
    labelLocation.text = @"活动地点";
    //labelLocation.font = [UIFont systemFontOfSize:15];
    [labelLocation setFont:[UIFont fontWithName:@"Helvetica-Bold" size:15]];
    [view1 addSubview:labelLocation];
    
    //活动地点textField
    textFieldLocation = [[UITextField alloc] initWithFrame:CGRectMake(106, 49+10, 200, 30)];
    textFieldLocation.placeholder = @"请输入活动地点";
    textFieldLocation.font = [UIFont systemFontOfSize:14];
    textFieldLocation.delegate = self;
    [view1 addSubview:textFieldLocation];
    
    //横线2
    UIView *viewHenXian2 = [[UIView alloc] initWithFrame:CGRectMake(20, 49+49, SCREEN_WIDTH-20, 1)];
    viewHenXian2.backgroundColor = [UIColor colorWithRed:216/255.0 green:216/255.0 blue:216/255.0 alpha:1];
    [view1 addSubview:viewHenXian2];
    
    //星号
    UIImageView *imageView2 = [[UIImageView alloc] initWithFrame:CGRectMake(17, 49+49+15, 17, 17)];
    [imageView2 setImage:[UIImage imageNamed:@"xingHao"]];
    [view1 addSubview:imageView2];
    
    //活动时间label
    UILabel *labelTimeShow = [[UILabel alloc] initWithFrame:CGRectMake(40, 49+49+13, 60, 21)];
    labelTimeShow.text = @"活动日期";
    //labelTimeShow.font = [UIFont systemFontOfSize:15];
    [labelTimeShow setFont:[UIFont fontWithName:@"Helvetica-Bold" size:15]];
    [view1 addSubview:labelTimeShow];
    
    //活动时间view
    UIView *viewTime = [[UIView alloc] initWithFrame:CGRectMake(106, 49+49+10, 200, 30)];
    viewTime.backgroundColor = [UIColor clearColor];
    viewTime.tag = 10;
    //在这个view上加手势,点击弹出picker
    UITapGestureRecognizer *sinTapGesture= [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(sinTapView:)];
    [viewTime addGestureRecognizer:sinTapGesture];
    
    
    //活动时间label显示
    labelTime = [[UILabel alloc] initWithFrame:CGRectMake(0, 4, 150, 21)];
    labelTime.text = @"请选择活动时间";
    labelTime.font = [UIFont systemFontOfSize:14];
    labelTime.textColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:0.5];
    [viewTime addSubview:labelTime];
    
    [view1 addSubview:viewTime];
    
    
    /*************************view2模块，高度不固定**************************/
    
    //高度从152开始
    view2 = [[UIView alloc] initWithFrame:CGRectMake(0, 152, SCREEN_WIDTH, 147)];
    view2.backgroundColor = [UIColor whiteColor];
    
    //放置※
    UIImageView *imageView3 = [[UIImageView alloc] initWithFrame:CGRectMake(17, 15, 17, 17)];
    [imageView3 setImage:[UIImage imageNamed:@"xingHao"]];
    [view2 addSubview:imageView3];
    
    //活动标题lable
    UILabel *labelType = [[UILabel alloc] initWithFrame:CGRectMake(40, 13, 60, 21)];
    labelType.text = @"活动类型";
    //labelType.font = [UIFont systemFontOfSize:15];
    [labelType setFont:[UIFont fontWithName:@"Helvetica-Bold" size:15]];
    [view2 addSubview:labelType];
    
    //横线3
    UIView *viewHenXian3 = [[UIView alloc] initWithFrame:CGRectMake(20, 49, SCREEN_WIDTH-20, 1)];
    viewHenXian3.backgroundColor = [UIColor colorWithRed:216/255.0 green:216/255.0 blue:216/255.0 alpha:1];
    [view2 addSubview:viewHenXian3];
    
    //球队内部活动view
    UIView *viewInner = [[UIView alloc] initWithFrame:CGRectMake(30, 49+10, 200, 30)];
    viewInner.backgroundColor = [UIColor clearColor];
    viewInner.tag = 11;
    //放置button1
    buttonInner = [[UIButton alloc] initWithFrame:CGRectMake(10, 6, 18, 18)];
    [buttonInner setSelected:NO];
    [buttonInner setBackgroundImage:[UIImage imageNamed:@"choice2Not"] forState:UIControlStateNormal];
    [buttonInner setBackgroundImage:[UIImage imageNamed:@"choice2"] forState:UIControlStateSelected];
    [viewInner addSubview:buttonInner];
    
    //放置球队内部活动label
    UILabel *labelInner = [[UILabel alloc] initWithFrame:CGRectMake(36, 5, 100, 21)];
    labelInner.text = @"球队内部活动";
    labelInner.font = [UIFont systemFontOfSize:14];
    [viewInner addSubview:labelInner];
    
    labelSportName = [[UILabel alloc] initWithFrame:CGRectMake(160, 64, 100, 21)];
    labelSportName.text = @"ggggg";
    labelSportName.font = [UIFont systemFontOfSize:12];
    labelSportName.textColor = [UIColor grayColor];
    labelSportName.layer.borderWidth = 1;
    labelSportName.layer.borderColor = [UIColor grayColor].CGColor;
    [labelSportName setHidden:YES];
    [view2 addSubview:labelSportName];
    
    
    [view2 addSubview:viewInner];
    
    //横线4
    UIView *viewHenXian4 = [[UIView alloc] initWithFrame:CGRectMake(20, 49+49, SCREEN_WIDTH-20, 1)];
    viewHenXian4.backgroundColor = [UIColor colorWithRed:216/255.0 green:216/255.0 blue:216/255.0 alpha:1];
    [view2 addSubview:viewHenXian4];
    
    //公开活动view
    UIView *viewPublic = [[UIView alloc] initWithFrame:CGRectMake(30, 49+49+10, 200, 30)];
    viewPublic.backgroundColor = [UIColor clearColor];
    viewPublic.tag = 12;
    //放置button2
    buttonPublic = [[UIButton alloc] initWithFrame:CGRectMake(10, 6, 18, 18)];
    [buttonPublic setSelected:YES];
    [buttonPublic setBackgroundImage:[UIImage imageNamed:@"choice2Not"] forState:UIControlStateNormal];
    [buttonPublic setBackgroundImage:[UIImage imageNamed:@"choice2"] forState:UIControlStateSelected];
    [viewPublic addSubview:buttonPublic];
    
    //放置球队内部活动label
    UILabel *labelPublic = [[UILabel alloc] initWithFrame:CGRectMake(36, 5, 100, 21)];
    labelPublic.text = @"公开活动";
    labelPublic.font = [UIFont systemFontOfSize:14];
    [viewPublic addSubview:labelPublic];
    
    [view2 addSubview:viewPublic];
    
    //两个view加手势
    UITapGestureRecognizer *sinTapGestureInner= [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(sinTapView:)];
    [viewInner addGestureRecognizer:sinTapGestureInner];
    UITapGestureRecognizer *sinTapGesturePublic= [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(sinTapView:)];
    [viewPublic addGestureRecognizer:sinTapGesturePublic];
    
    
     /*************************view3模块，高度固定**************************/
    //view3从 304开始
    view3 = [[UIView alloc] initWithFrame:CGRectMake(0, 304, SCREEN_WIDTH, 147)];
    view3.backgroundColor = [UIColor whiteColor];
    
    //放置※
    UIImageView *imageView4 = [[UIImageView alloc] initWithFrame:CGRectMake(17, 15, 17, 17)];
    [imageView4 setImage:[UIImage imageNamed:@"xingHao"]];
    [view3 addSubview:imageView4];
    
    //场地类型
    UILabel *labelPlaceType = [[UILabel alloc] initWithFrame:CGRectMake(40, 13, 60, 21)];
    labelPlaceType.text = @"场地类型";
    //labelPlaceType.font = [UIFont systemFontOfSize:15];
    [labelPlaceType setFont:[UIFont fontWithName:@"Helvetica-Bold" size:15]];
    [view3 addSubview:labelPlaceType];
    
    //横线5
    UIView *viewHenXian5 = [[UIView alloc] initWithFrame:CGRectMake(20, 49, SCREEN_WIDTH-20, 1)];
    viewHenXian5.backgroundColor = [UIColor colorWithRed:216/255.0 green:216/255.0 blue:216/255.0 alpha:1];
    [view3 addSubview:viewHenXian5];
    
    //放置4个view
    UIView *viewFive = [[UIView alloc] initWithFrame:CGRectMake(20, 58, 62, 30)];
    viewFive.backgroundColor = [UIColor clearColor];
    viewFive.tag = 13;
    [view3 addSubview:viewFive];
    
    UIView *viewSeven = [[UIView alloc] initWithFrame:CGRectMake(95, 58, 62, 30)];
    viewSeven.backgroundColor = [UIColor clearColor];
    viewSeven.tag = 14;
    [view3 addSubview:viewSeven];
    
    UIView *viewNine = [[UIView alloc] initWithFrame:CGRectMake(170, 58, 62, 30)];
    viewNine.backgroundColor = [UIColor clearColor];
    viewNine.tag = 15;
    [view3 addSubview:viewNine];
    
    UIView *viewEleven = [[UIView alloc] initWithFrame:CGRectMake(247, 58, 62, 30)];
    viewEleven.backgroundColor = [UIColor clearColor];
    viewEleven.tag = 16;
    [view3 addSubview:viewEleven];
    
    //加手势
    UITapGestureRecognizer *sinTapGestureFive= [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(sinTapView:)];
    [viewFive addGestureRecognizer:sinTapGestureFive];
    //加手势
    UITapGestureRecognizer *sinTapGestureSeven= [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(sinTapView:)];
    [viewSeven addGestureRecognizer:sinTapGestureSeven];
    //加手势
    UITapGestureRecognizer *sinTapGestureNine= [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(sinTapView:)];
    [viewNine addGestureRecognizer:sinTapGestureNine];
    //加手势
    UITapGestureRecognizer *sinTapGestureEleven= [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(sinTapView:)];
    [viewEleven addGestureRecognizer:sinTapGestureEleven];
    
    
    //放置4个button
    //放置4个label
    buttonFive = [[UIButton alloc] initWithFrame:CGRectMake(1, 5, 18, 18)];
    [buttonFive setSelected:YES];
    [buttonFive setBackgroundImage:[UIImage imageNamed:@"choice2Not"] forState:UIControlStateNormal];
    [buttonFive setBackgroundImage:[UIImage imageNamed:@"choice2"] forState:UIControlStateSelected];
    [viewFive addSubview:buttonFive];
    UILabel *labelFive = [[UILabel alloc] initWithFrame:CGRectMake(1+18+4, 5, 43, 21)];
    labelFive.text = @"5人制";
    labelFive.font = [UIFont systemFontOfSize:14];
    [viewFive addSubview:labelFive];
    
    buttonSeven = [[UIButton alloc] initWithFrame:CGRectMake(1, 5, 18, 18)];
    [buttonSeven setSelected:NO];
    [buttonSeven setBackgroundImage:[UIImage imageNamed:@"choice2Not"] forState:UIControlStateNormal];
    [buttonSeven setBackgroundImage:[UIImage imageNamed:@"choice2"] forState:UIControlStateSelected];
    [viewSeven addSubview:buttonSeven];
    UILabel *labelSeven = [[UILabel alloc] initWithFrame:CGRectMake(1+18+4, 5, 43, 21)];
    labelSeven.text = @"7人制";
    labelSeven.font = [UIFont systemFontOfSize:14];
    [viewSeven addSubview:labelSeven];
    
    buttonNine = [[UIButton alloc] initWithFrame:CGRectMake(1, 5, 18, 18)];
    [buttonNine setSelected:NO];
    [buttonNine setBackgroundImage:[UIImage imageNamed:@"choice2Not"] forState:UIControlStateNormal];
    [buttonNine setBackgroundImage:[UIImage imageNamed:@"choice2"] forState:UIControlStateSelected];
    [viewNine addSubview:buttonNine];
    UILabel *labelNine = [[UILabel alloc] initWithFrame:CGRectMake(1+18+4, 5, 43, 21)];
    labelNine.text = @"9人制";
    labelNine.font = [UIFont systemFontOfSize:14];
    [viewNine addSubview:labelNine];
    
    buttonEleven = [[UIButton alloc] initWithFrame:CGRectMake(1, 5, 18, 18)];
    [buttonEleven setSelected:NO];
    [buttonEleven setBackgroundImage:[UIImage imageNamed:@"choice2Not"] forState:UIControlStateNormal];
    [buttonEleven setBackgroundImage:[UIImage imageNamed:@"choice2"] forState:UIControlStateSelected];
    [viewEleven addSubview:buttonEleven];
    UILabel *labelEleven = [[UILabel alloc] initWithFrame:CGRectMake(1+18+4, 5, 50, 21)];
    labelEleven.text = @"11人制";
    labelEleven.font = [UIFont systemFontOfSize:14];
    [viewEleven addSubview:labelEleven];
    
    //横线6
    UIView *viewHenXian6 = [[UIView alloc] initWithFrame:CGRectMake(20, 49+49, SCREEN_WIDTH-20, 1)];
    viewHenXian6.backgroundColor = [UIColor colorWithRed:216/255.0 green:216/255.0 blue:216/255.0 alpha:1];
    [view3 addSubview:viewHenXian6];
    
    //吃喝玩乐view
    UIView *viewCHWL = [[UIView alloc] initWithFrame:CGRectMake(16, 49+58, 200, 30)];
    viewCHWL.backgroundColor = [UIColor clearColor];
    viewCHWL.tag = 17;
    [view3 addSubview:viewCHWL];
    
    //加手势
    UITapGestureRecognizer *sinTapGestureCHWL= [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(sinTapView:)];
    [viewCHWL addGestureRecognizer:sinTapGestureCHWL];
    
    
    buttonCHWL = [[UIButton alloc] initWithFrame:CGRectMake(10, 6, 18, 18)];
    [buttonCHWL setSelected:NO];
    [buttonCHWL setBackgroundImage:[UIImage imageNamed:@"choiceNot"] forState:UIControlStateNormal];
    [buttonCHWL setBackgroundImage:[UIImage imageNamed:@"choice"] forState:UIControlStateSelected];
    [viewCHWL addSubview:buttonCHWL];
    UILabel *labelCHWL = [[UILabel alloc] initWithFrame:CGRectMake(10+18+4, 5, 60, 21)];
    labelCHWL.text = @"吃喝玩乐";
    labelCHWL.font = [UIFont systemFontOfSize:14];
    [viewCHWL addSubview:labelCHWL];
    
    
     /*************************view4模块，高度不固定**************************/
    //view4从 456开始
    view4 = [[UIView alloc] initWithFrame:CGRectMake(0, 456, SCREEN_WIDTH, 196)];
    view4.backgroundColor = [UIColor whiteColor];
    
    //放置※
    UIImageView *imageView5 = [[UIImageView alloc] initWithFrame:CGRectMake(17, 15, 17, 17)];
    [imageView5 setImage:[UIImage imageNamed:@"xingHao"]];
    [view4 addSubview:imageView5];
    
    //场地类型
    UILabel *labelMoney = [[UILabel alloc] initWithFrame:CGRectMake(40, 13, 60, 21)];
    labelMoney.text = @"活动费用";
    //labelMoney.font = [UIFont systemFontOfSize:15];
    [labelMoney setFont:[UIFont fontWithName:@"Helvetica-Bold" size:15]];
    [view4 addSubview:labelMoney];
    
    //横线7
    UIView *viewHenXian7 = [[UIView alloc] initWithFrame:CGRectMake(20, 49, SCREEN_WIDTH-20, 1)];
    viewHenXian7.backgroundColor = [UIColor colorWithRed:216/255.0 green:216/255.0 blue:216/255.0 alpha:1];
    [view4 addSubview:viewHenXian7];
    
    //横线8
    UIView *viewHenXian8 = [[UIView alloc] initWithFrame:CGRectMake(20, 49+49, SCREEN_WIDTH-20, 1)];
    viewHenXian8.backgroundColor = [UIColor colorWithRed:216/255.0 green:216/255.0 blue:216/255.0 alpha:1];
    [view4 addSubview:viewHenXian8];
    
    //横线9
    UIView *viewHenXian9 = [[UIView alloc] initWithFrame:CGRectMake(20, 49+49+49, SCREEN_WIDTH-20, 1)];
    viewHenXian9.backgroundColor = [UIColor colorWithRed:216/255.0 green:216/255.0 blue:216/255.0 alpha:1];
    [view4 addSubview:viewHenXian9];
    
    //总价分摊
    UIView *viewAllPrice = [[UIView alloc] initWithFrame:CGRectMake(26, 58, 90, 30)];
    viewAllPrice.backgroundColor = [UIColor clearColor];
    viewAllPrice.tag = 18;
    [view4 addSubview:viewAllPrice];
    
    UIView *viewUnitPrice = [[UIView alloc] initWithFrame:CGRectMake(26, 49+58, 90, 30)];
    viewUnitPrice.backgroundColor = [UIColor clearColor];
    viewUnitPrice.tag = 19;
    [view4 addSubview:viewUnitPrice];
    
    UIView *viewAccount = [[UIView alloc] initWithFrame:CGRectMake(26, 49+49+58, 120, 30)];
    viewAccount.backgroundColor = [UIColor clearColor];
    viewAccount.tag = 20;
    [view4 addSubview:viewAccount];
    
    //加手势
    UITapGestureRecognizer *sinTapGestureAllPrice= [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(sinTapView:)];
    [viewAllPrice addGestureRecognizer:sinTapGestureAllPrice];
    UITapGestureRecognizer *sinTapGestureUnitPrice= [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(sinTapView:)];
    [viewUnitPrice addGestureRecognizer:sinTapGestureUnitPrice];
    UITapGestureRecognizer *sinTapGestureAccount= [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(sinTapView:)];
    [viewAccount addGestureRecognizer:sinTapGestureAccount];
    
    //总价分摊
    buttonAllPrice = [[UIButton alloc] initWithFrame:CGRectMake(1, 5, 18, 18)];
    [buttonAllPrice setSelected:YES];
    [buttonAllPrice setBackgroundImage:[UIImage imageNamed:@"choice2Not"] forState:UIControlStateNormal];
    [buttonAllPrice setBackgroundImage:[UIImage imageNamed:@"choice2"] forState:UIControlStateSelected];
    [viewAllPrice addSubview:buttonAllPrice];
    UILabel *labelAllPrice = [[UILabel alloc] initWithFrame:CGRectMake(1+18+4, 5, 60, 21)];
    labelAllPrice.text = @"总价分摊";
    labelAllPrice.font = [UIFont systemFontOfSize:14];
    [viewAllPrice addSubview:labelAllPrice];
    
    //总价/场
    textFieldAllPrice = [[UITextField alloc] initWithFrame:CGRectMake(1+18+4+60+2+20+20, 59, 100, 30)];
    textFieldAllPrice.placeholder = @"总价/场";
    textFieldAllPrice.font = [UIFont systemFontOfSize:14];
    textFieldAllPrice.delegate = self;
    [view4 addSubview:textFieldAllPrice];
    
    //计费说明
    UIView *viewInstructionAllPrice = [[UIView alloc] initWithFrame:CGRectMake(230, 58, 100, 30)];
    viewInstructionAllPrice.backgroundColor = [UIColor clearColor];
    viewInstructionAllPrice.tag = 21;
    [view4 addSubview:viewInstructionAllPrice];
    UITapGestureRecognizer *sinTapGestureInstructionAllPrice= [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(sinTapView:)];
    [viewInstructionAllPrice addGestureRecognizer:sinTapGestureInstructionAllPrice];
    UIImageView *imageViewIT1 = [[UIImageView alloc] initWithFrame:CGRectMake(5, 3, 23, 23)];
    [imageViewIT1 setImage:[UIImage imageNamed:@"instruction"]];
    [viewInstructionAllPrice addSubview:imageViewIT1];
    UILabel *labelIT1 = [[UILabel alloc] initWithFrame:CGRectMake(30, 5, 50, 21)];
    labelIT1.text = @"计费说明";
    labelIT1.font = [UIFont systemFontOfSize:12];
    labelIT1.textColor = [UIColor colorWithRed: 30/255.0 green: 111/255.0 blue: 249/255.0 alpha:1];
    [viewInstructionAllPrice addSubview:labelIT1];
    
    
    //固定单价
    buttonUnitPrice = [[UIButton alloc] initWithFrame:CGRectMake(1, 5, 18, 18)];
    [buttonUnitPrice setSelected:NO];
    [buttonUnitPrice setBackgroundImage:[UIImage imageNamed:@"choice2Not"] forState:UIControlStateNormal];
    [buttonUnitPrice setBackgroundImage:[UIImage imageNamed:@"choice2"] forState:UIControlStateSelected];
    [viewUnitPrice addSubview:buttonUnitPrice];
    UILabel *labelUnitPrice = [[UILabel alloc] initWithFrame:CGRectMake(1+18+4, 5, 60, 21)];
    labelUnitPrice.text = @"固定单价";
    labelUnitPrice.font = [UIFont systemFontOfSize:14];
    [viewUnitPrice addSubview:labelUnitPrice];
    //单价/人
    textFieldUnitPrice = [[UITextField alloc] initWithFrame:CGRectMake(1+18+4+60+2+20+20, 49+59, 100, 30)];
    textFieldUnitPrice.placeholder = @"单价/人";
    textFieldUnitPrice.font = [UIFont systemFontOfSize:14];
    textFieldUnitPrice.delegate = self;
    [view4 addSubview:textFieldUnitPrice];
    //计费说明
    UIView *viewInstructionUnitPrice = [[UIView alloc] initWithFrame:CGRectMake(230, 49+58, 100, 30)];
    viewInstructionUnitPrice.backgroundColor = [UIColor clearColor];
    viewInstructionUnitPrice.tag = 22;
    [view4 addSubview:viewInstructionUnitPrice];
    UITapGestureRecognizer *sinTapGestureInstructionUnitPrice= [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(sinTapView:)];
    [viewInstructionUnitPrice addGestureRecognizer:sinTapGestureInstructionUnitPrice];
    UIImageView *imageViewIT2 = [[UIImageView alloc] initWithFrame:CGRectMake(5, 3, 23, 23)];
    [imageViewIT2 setImage:[UIImage imageNamed:@"instruction"]];
    [viewInstructionUnitPrice addSubview:imageViewIT2];
    UILabel *labelIT2 = [[UILabel alloc] initWithFrame:CGRectMake(30, 5, 50, 21)];
    labelIT2.text = @"计费说明";
    labelIT2.font = [UIFont systemFontOfSize:12];
    labelIT2.textColor = [UIColor colorWithRed: 30/255.0 green: 111/255.0 blue: 249/255.0 alpha:1];
    [viewInstructionUnitPrice addSubview:labelIT2];
    
    //会员记账
    buttonAccount = [[UIButton alloc] initWithFrame:CGRectMake(1, 5, 18, 18)];
    [buttonAccount setSelected:NO];
    [buttonAccount setBackgroundImage:[UIImage imageNamed:@"choice2Not"] forState:UIControlStateNormal];
    [buttonAccount setBackgroundImage:[UIImage imageNamed:@"choice2"] forState:UIControlStateSelected];
    [viewAccount addSubview:buttonAccount];
    UILabel *labelAccount = [[UILabel alloc] initWithFrame:CGRectMake(1+18+4, 5, 100, 21)];
    labelAccount.text = @"会员费记账支付";
    labelAccount.font = [UIFont systemFontOfSize:14];
    [viewAccount addSubview:labelAccount];
    
    //总价/场
    textFieldAccount = [[UITextField alloc] initWithFrame:CGRectMake(1+18+4+100+2+20+20, 49+49+60, 60, 30)];
    textFieldAccount.placeholder = @"总价/场";
    textFieldAccount.font = [UIFont systemFontOfSize:14];
    textFieldAccount.delegate = self;
    [view4 addSubview:textFieldAccount];
    
    //计费说明
    UIView *viewInstructionAccount= [[UIView alloc] initWithFrame:CGRectMake(230, 49+49+58, 100, 30)];
    viewInstructionAccount.backgroundColor = [UIColor clearColor];
    viewInstructionAccount.tag = 23;
    [view4 addSubview:viewInstructionAccount];
    UITapGestureRecognizer *sinTapGestureInstructionAccount= [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(sinTapView:)];
    [viewInstructionAccount addGestureRecognizer:sinTapGestureInstructionAccount];
    UIImageView *imageViewIT3 = [[UIImageView alloc] initWithFrame:CGRectMake(5, 3, 23, 23)];
    [imageViewIT3 setImage:[UIImage imageNamed:@"instruction"]];
    [viewInstructionAccount addSubview:imageViewIT3];
    UILabel *labelIT3 = [[UILabel alloc] initWithFrame:CGRectMake(30, 5, 50, 21)];
    labelIT3.text = @"计费说明";
    labelIT3.font = [UIFont systemFontOfSize:12];
    labelIT3.textColor = [UIColor colorWithRed: 30/255.0 green: 111/255.0 blue: 249/255.0 alpha:1];
    [viewInstructionAccount addSubview:labelIT3];
    
    
    /*************************view5模块，高度固定**************************/
    //从657开始
    view5 = [[UIView alloc] initWithFrame:CGRectMake(0, 657, SCREEN_WIDTH, 98)];
    view5.backgroundColor = [UIColor whiteColor];
    
    //放置※
    UIImageView *imageView6 = [[UIImageView alloc] initWithFrame:CGRectMake(17, 15, 17, 17)];
    [imageView6 setImage:[UIImage imageNamed:@"xingHao"]];
    [view5 addSubview:imageView6];
    
    //人数下限
    UILabel *labelLower = [[UILabel alloc] initWithFrame:CGRectMake(40, 13, 60, 21)];
    labelLower.text = @"人数下限";
    //labelLower.font = [UIFont systemFontOfSize:15];
    [labelLower setFont:[UIFont fontWithName:@"Helvetica-Bold" size:15]];
    [view5 addSubview:labelLower];
    
    //下限输入
    //活动标题输入textField
    UITextField *textFieldLower = [[UITextField alloc] initWithFrame:CGRectMake(106, 10, 120, 30)];
    textFieldLower.placeholder = @"填写报名人数下限";
    textFieldLower.font = [UIFont systemFontOfSize:14];
    textFieldLower.delegate = self;
    [view5 addSubview:textFieldLower];
    //下限说明
    //计费说明
    UIView *viewLower= [[UIView alloc] initWithFrame:CGRectMake(250, 9, 100, 30)];
    viewLower.backgroundColor = [UIColor clearColor];
    viewLower.tag = 24;
    [view5 addSubview:viewLower];
    UITapGestureRecognizer *sinTapGestureLower= [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(sinTapView:)];
    [viewLower addGestureRecognizer:sinTapGestureLower];
    UIImageView *imageViewIT4 = [[UIImageView alloc] initWithFrame:CGRectMake(5, 3, 23, 23)];
    [imageViewIT4 setImage:[UIImage imageNamed:@"instruction"]];
    [viewLower addSubview:imageViewIT4];
    UILabel *labelLowerIT = [[UILabel alloc] initWithFrame:CGRectMake(30, 5, 30, 21)];
    labelLowerIT.text = @"说明";
    labelLowerIT.font = [UIFont systemFontOfSize:12];
    labelLowerIT.textColor = [UIColor colorWithRed: 30/255.0 green: 111/255.0 blue: 249/255.0 alpha:1];
    [viewLower addSubview:labelLowerIT];
    
    //横线7
    UIView *viewHenXian10 = [[UIView alloc] initWithFrame:CGRectMake(20, 49, SCREEN_WIDTH-20, 1)];
    viewHenXian10.backgroundColor = [UIColor colorWithRed:216/255.0 green:216/255.0 blue:216/255.0 alpha:1];
    [view5 addSubview:viewHenXian10];
    
    //人数下限
    UILabel *labelHjgh = [[UILabel alloc] initWithFrame:CGRectMake(40, 49+13, 60, 21)];
    labelHjgh.text = @"人数上限";
    labelHjgh.font = [UIFont systemFontOfSize:15];
    [view5 addSubview:labelHjgh];
    
    //上限输入
    //活动标题输入textField
    UITextField *textFieldHigh = [[UITextField alloc] initWithFrame:CGRectMake(106, 49+10, 200, 30)];
    textFieldHigh.placeholder = @"默认为报名人数下限+5";
    textFieldHigh.font = [UIFont systemFontOfSize:14];
    textFieldHigh.delegate = self;
    [view5 addSubview:textFieldHigh];
    
    
    /*************************view6模块，高度固定**************************/
    //从760开始
    view6 = [[UIView alloc] initWithFrame:CGRectMake(0, 760, SCREEN_WIDTH, 170)];
    view6.backgroundColor = [UIColor whiteColor];
    
    //放置※
    UIImageView *imageView7 = [[UIImageView alloc] initWithFrame:CGRectMake(17, 15, 17, 17)];
    [imageView7 setImage:[UIImage imageNamed:@"xingHao"]];
    [view6 addSubview:imageView7];
    
    //活动介绍
    UILabel *labelProfile = [[UILabel alloc] initWithFrame:CGRectMake(40, 13, 60, 21)];
    labelProfile.text = @"活动介绍";
    //labelProfile.font = [UIFont systemFontOfSize:15];
    [labelProfile setFont:[UIFont fontWithName:@"Helvetica-Bold" size:15]];
    [view6 addSubview:labelProfile];
    
    textViewProfile = [[UITextView alloc] initWithFrame:CGRectMake(17, 40, SCREEN_WIDTH-34, 120)];
    textViewProfile.delegate = self;
    //设置边框
    textViewProfile.layer.borderWidth = 1;
    textViewProfile.layer.borderColor = [UIColor colorWithRed:216/255.0 green:216/255.0 blue:216/255.0 alpha:1].CGColor;
    textViewProfile.text = @"请输入活动介绍……";
    textViewProfile.textColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1];
    textViewProfile.font = [UIFont fontWithName:@"Arial" size:14];
    [view6 addSubview:textViewProfile];
    
    [scrollViewAll addSubview:view1];
    [scrollViewAll addSubview:view2];
    [scrollViewAll addSubview:view3];
    [scrollViewAll addSubview:view4];
    [scrollViewAll addSubview:view5];
    [scrollViewAll addSubview:view6];
    
}


//开始编辑的时候
- (void)textViewDidBeginEditing:(UITextView *)textView
{
    NSLog(@"开始编辑");
    //开始编辑的时候，整体视图上移
    //scoview设置成2倍，键盘不需要上移
    //self.view.frame = CGRectMake(0, -130, SCREEN_WIDTH, SCREEN_HEIGHT);
    //self.scrollViewAll.frame = CGRectMake(0, -1000, SCREEN_WIDTH, SCREEN_HEIGHT);
    //需要判断字
    if ([textViewProfile.text isEqualToString:@"请输入活动介绍……"]) {
        textViewProfile.text = @"";
        textViewProfile.textColor = [UIColor blackColor];
    }
    
}

// textView回车或者return返回键盘
-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if ([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        
        //self.view.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
        
        return NO;
    }
    return YES;
}

//textField结束键盘
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

//单击手势
-(void)sinTapView:(UITapGestureRecognizer *)sender
{
    //1.先判断点击了哪个view
    int viewTag =sender.view.tag;
    NSLog(@"点击了%d",viewTag);
    
    switch (viewTag) {
        case 10:
            NSLog(@"点击了选择活动时间");
            [self dateView];
            break;
        case 11:
            NSLog(@"点击了球队内部活动");
            [buttonInner setSelected:YES];
            [buttonPublic setSelected:NO];
            flagChoice = 0;
            
            //点击了球队内部活动，跳页面去选择球队
            [self pushToChoiceSport];
            
            break;
        case 12:
            NSLog(@"点击了公开活动");
            [buttonInner setSelected:NO];
            [buttonPublic setSelected:YES];
            flagChoice = 1;
            
            //隐藏点击的球队内部活动label
             [labelSportName setHidden:YES];
            break;
            
        case 13:
            NSLog(@"点击了viewFive");
            [buttonFive setSelected:YES];
            [buttonSeven setSelected:NO];
            [buttonNine setSelected:NO];
            [buttonEleven setSelected:NO];
            flagChoice2 = 5;
            break;
        case 14:
            NSLog(@"点击了viewSeven");
            [buttonFive setSelected:NO];
            [buttonSeven setSelected:YES];
            [buttonNine setSelected:NO];
            [buttonEleven setSelected:NO];
            flagChoice2 = 7;
            break;
        case 15:
            [buttonFive setSelected:NO];
            [buttonSeven setSelected:NO];
            [buttonNine setSelected:YES];
            [buttonEleven setSelected:NO];
            flagChoice2 = 9;
            break;
        case 16:
            [buttonFive setSelected:NO];
            [buttonSeven setSelected:NO];
            [buttonNine setSelected:NO];
            [buttonEleven setSelected:YES];
            flagChoice2 = 11;
            break;
        case 17:
            
            if (flagChoice3 == 0) {
                
                flagChoice3 = 1;
                [buttonCHWL setSelected:YES];
            }else
            {
                flagChoice3 = 0;
                [buttonCHWL setSelected:NO];
                
            }
            break;
        case 18:
            NSLog(@"点击了总价分摊");
            
            //禁止 单价/人点击
            //禁止 总价/场点击
            textFieldAllPrice.userInteractionEnabled = YES;
            textFieldUnitPrice.userInteractionEnabled = NO;
            textFieldUnitPrice.text = @"";
            textFieldAccount.userInteractionEnabled = NO;
            textFieldAccount.text = @"";
            
            [buttonAllPrice setSelected:YES];
            [buttonUnitPrice setSelected:NO];
            [buttonAccount setSelected:NO];
            flagChoice4 = 0;
            
            [self keepView4];
            break;
        case 19:
            NSLog(@"点击了固定单价");
            
            textFieldAllPrice.userInteractionEnabled = NO;
            textFieldAllPrice.text = @"";
            textFieldUnitPrice.userInteractionEnabled = YES;
            textFieldAccount.userInteractionEnabled = NO;
            textFieldAccount.text = @"";
            
            
            [buttonAllPrice setSelected:NO];
            [buttonUnitPrice setSelected:YES];
            [buttonAccount setSelected:NO];
            flagChoice4 = 1;
            
            [self keepView4];
            break;
        case 20:
            NSLog(@"点击了记账支付");
            
            if (flagChoice4 == 2) {
                return;
            }
            
            textFieldAllPrice.userInteractionEnabled = NO;
            textFieldAllPrice.text = @"";
            textFieldUnitPrice.userInteractionEnabled = NO;
            textFieldUnitPrice.text = @"";
            textFieldAccount.userInteractionEnabled = YES;
            
            [buttonAllPrice setSelected:NO];
            [buttonUnitPrice setSelected:NO];
            [buttonAccount setSelected:YES];
            flagChoice4 = 2;
            
            //延伸view4
            [self extendView];
            
            break;
        case 21:
            NSLog(@"点击了总价分摊计费说明");
            flagInstruction = 0;
            [self showIns];
            break;
        case 22:
            NSLog(@"点击了固定单价计费说明");
            flagInstruction = 1;
            [self showIns];
            break;
        case 23:
            NSLog(@"点击了会员支付费说明");
            flagInstruction = 2;
            [self showIns];
            break;
        case 24:
            NSLog(@"点击了人数下限说明");
            flagInstruction = 3;
            [self showIns];
            break;
        case 25:
            NSLog(@"点击了不关联");
            flagAbout = 0;
            [buttonNotAbout setSelected:YES];
            [buttonAbout setSelected:NO];
            break;
        case 26:
            NSLog(@"点击了关联");
            flagAbout = 1;
            [buttonNotAbout setSelected:NO];
            [buttonAbout setSelected:YES];
            break;
            
        default:
            break;
    }
    
}

//总价分摊显示
-(void) showIns
{
    NSString *showHeader = @"";
    NSString *showBody = @"";
    
    switch (flagInstruction) {
        case 0:
            showHeader = @"总价分摊模式计费（代收费）说明";
            showBody = @"活动发起人需设置报名人数下限和报名人数上限。1、为保证活动顺利进行、防止放鸽子，影响大家活动的心情和热情，在报名时 报名人 即需要预缴报名保证金，由圈圈足球代收，在活动开始两小时内圈圈足球按照实际报名人数把活动费用平均分摊每一个报名人，然后划拨到活动发起人钱包，如果报名人报名缴费后未参加活动（放鸽子），实际消费金额不予退还。如果报名人数大于设定人数下限，则报名人多缴纳的保证金部分会自动退还到报名人钱包。2、如果活动报名人数未达到活动设定的人数下限，则活动自动取消，所有报名保证金退还到报名人钱包。预缴报名保证金=活动总费用/活动设定人数下限；实际扣费金额=活动总费用/活动实际报名人数；退还多余保证金金额=预缴报名保证金-实际扣费金额。";
            break;
        case 1:
            showHeader = @"固定单价模式计费说明";
            showBody = @"活动发起人需设置报名人数下限和报名人数上限。1、活动发起人设置一个固定单价。报名人在报名时即缴纳活动发起人设置的报名费，由圈圈足球代收，活动报名人数达到活动发起人设定的报名人数下限，则默认活动可成功举行，报名费将不予退还，在活动成功开始后两小时内圈圈足球把报名费划拨到活动发起人钱包。2、如果活动报名人数未达到发起人设定人数下限，则活动取消，报名费自动退还到报名人钱包。";
            break;
        case 2:
            showHeader = @"会员费记账支付说明";
            showBody = @"适用于预缴会员费制的球队，只有球队内部活动可以采用此支付方式，圈圈足球提供球队记账等财务管理功能，根据总金额和报名人数自动计算）";
            break;
        case 3:
            showHeader = @"人数下限说明";
            showBody = @"在活动开始前报名人数达不到设定人数下限，则活动取消，报名费（报名保证金）退还到报名人钱包";
            break;
            
        default:
            break;
    }
    
    //显示计费说明
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:showHeader message:showBody delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
    [alert show];
}


//点击了活动日期
-(void) dateView
{
    //收回键盘
    [textFieldName resignFirstResponder];
    [textFieldLocation resignFirstResponder];
    
    //设置一个uiview，整体背景
    viewDate = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    viewDate.backgroundColor = [UIColor colorWithRed:103/255.0 green:103/255.0 blue:103/255.0 alpha:0.5];
    [self.view addSubview:viewDate];
    
    //设置date
    datePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT-200, SCREEN_WIDTH, 230)];
    datePicker.backgroundColor = [UIColor whiteColor];
    //datePicker.backgroundColor = [UIColor groupTableViewBackgroundColor];
    //设置模式
    datePicker.datePickerMode = UIDatePickerModeDateAndTime;
    datePicker.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
    //设置picker最小时间
    datePicker.minimumDate = [NSDate date];
    [viewDate addSubview:datePicker];
    
    //取消确定view
    UIView *viewSure = [[UIView alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT-220, SCREEN_WIDTH, 30)];
    viewSure.backgroundColor = [UIColor whiteColor];
    [viewDate addSubview:viewSure];
    
    //确认按钮
    UIButton *buttonSure = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH-80, 7, 60, 20)];
    buttonSure.backgroundColor = [UIColor clearColor];
    [buttonSure setTitle:@"确定" forState:UIControlStateNormal];
    [buttonSure setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    buttonSure.tag = 10;
    [buttonSure addTarget:self action:@selector(clickSureBtn:) forControlEvents:UIControlEventTouchUpInside];
    [viewSure addSubview:buttonSure];
    
    //取消按钮
    UIButton *buttonCancle = [[UIButton alloc] initWithFrame:CGRectMake(20, 7, 60, 20)];
    buttonCancle.backgroundColor = [UIColor clearColor];
    [buttonCancle setTitle:@"取消" forState:UIControlStateNormal];
    [buttonCancle setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    buttonCancle.tag = 11;
    [buttonCancle addTarget:self action:@selector(clickSureBtn:) forControlEvents:UIControlEventTouchUpInside];
    [viewSure addSubview:buttonCancle];
    
}

-(void)clickSureBtn:(id) sender
{
    UIButton *btn = sender;
    if (btn.tag == 10) {
          NSLog(@"点击了确定按钮");
        //显示时间
        NSDate *date = [datePicker date];
        NSLog(@"时间是:%@",date);
        
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"];
        NSString *dateString = [dateFormatter stringFromDate:date];
        NSLog(@"转换后的时间:%@",dateString);
        labelTime.text = dateString;
        labelTime.font = [UIFont systemFontOfSize:14];
        labelTime.textColor = [UIColor blackColor];
        
        //2.隐藏view
        [viewDate setHidden:YES];
        
        
    }else
    {
        NSLog(@"点击了取消按钮");
        //2.隐藏view
        [viewDate setHidden:YES];
        [viewDate removeFromSuperview];
    }
    
}



//点击了记账支付
-(void) extendView
{
    flag = 1;
    
    //1.扩展view4
    //2.改变view5 view6的位置
    view4.frame = CGRectMake(0, 456, SCREEN_WIDTH, 196+98);
    [view5 setCenter:CGPointMake(view5.center.x, view5.center.y+98)];
    [view6 setCenter:CGPointMake(view6.center.x, view6.center.y+98)];
    
    viewExtend = [[UIView alloc] initWithFrame:CGRectMake(40, 190, SCREEN_WIDTH-50, 90)];
    viewExtend.layer.masksToBounds = YES;
    viewExtend.layer.cornerRadius = 8;
    viewExtend.layer.borderWidth = 1;
    viewExtend.layer.borderColor = [UIColor colorWithRed:216/255.0 green:216/255.0 blue:216/255.0 alpha:1].CGColor;
    [view4 addSubview:viewExtend];
    
    UIView *viewUp = [[UIView alloc] initWithFrame:CGRectMake(10, 10, 280, 30)];
    viewUp.tag = 25;
    viewUp.backgroundColor = [UIColor clearColor];
    [viewExtend addSubview:viewUp];
    
    
    buttonNotAbout = [[UIButton alloc] initWithFrame:CGRectMake(1, 7, 18, 18)];
    [buttonNotAbout setSelected:NO];
    [buttonNotAbout setBackgroundImage:[UIImage imageNamed:@"choice2Not"] forState:UIControlStateNormal];
    [buttonNotAbout setBackgroundImage:[UIImage imageNamed:@"choice2"] forState:UIControlStateSelected];
    [viewUp addSubview:buttonNotAbout];
    //不关联报名球单
    UILabel *labelNotAbout = [[UILabel alloc] initWithFrame:CGRectMake(20, 6, 100, 21)];
    labelNotAbout.text = @"不关联报名球单";
    labelNotAbout.font = [UIFont systemFontOfSize:13];
    [viewUp addSubview:labelNotAbout];
    //总费用平摊
    UILabel *labelFee = [[UILabel alloc] initWithFrame:CGRectMake(115, 4, 150, 21)];
    labelFee.text = @"(总费用平摊到所有成员扣除)";
    labelFee.font = [UIFont systemFontOfSize:11];
    labelFee.textColor =[UIColor colorWithRed:216/255.0 green:216/255.0 blue:216/255.0 alpha:1];
    [viewUp addSubview:labelFee];
    
    UIView *vieeDown = [[UIView alloc] initWithFrame:CGRectMake(10, 50, 280, 30)];
    vieeDown.backgroundColor = [UIColor clearColor];
    vieeDown.tag = 26;
    [viewExtend addSubview:vieeDown];
    
    buttonAbout = [[UIButton alloc] initWithFrame:CGRectMake(1, 7, 18, 18)];
    [buttonAbout setSelected:YES];
    [buttonAbout setBackgroundImage:[UIImage imageNamed:@"choice2Not"] forState:UIControlStateNormal];
    [buttonAbout setBackgroundImage:[UIImage imageNamed:@"choice2"] forState:UIControlStateSelected];
    [vieeDown addSubview:buttonAbout];
    //关联报名球单
    UILabel *labelbout = [[UILabel alloc] initWithFrame:CGRectMake(20, 6, 100, 21)];
    labelbout.text = @"关联报名球单";
    labelbout.font = [UIFont systemFontOfSize:13];
    [vieeDown addSubview:labelbout];
    
    UITapGestureRecognizer *sinTapGestureUp= [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(sinTapView:)];
    [viewUp addGestureRecognizer:sinTapGestureUp];
    UITapGestureRecognizer *sinTapGestureDown= [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(sinTapView:)];
    [vieeDown addGestureRecognizer:sinTapGestureDown];
    
}

//点击了总价分摊和固定单价
-(void) keepView4
{
    if (flag == 1) {
        
        view4.frame = CGRectMake(0, 456, SCREEN_WIDTH, 196);
        
        [viewExtend setHidden:YES];
        [viewExtend removeFromSuperview];
        viewExtend = nil;
        
        if (view4.center.y == 554) {
            view5.frame = CGRectMake(0, 657, SCREEN_WIDTH, 98);
            view6.frame = CGRectMake(0, 760, SCREEN_WIDTH, 170);
        }
    }
    

}



//跳往选择球队页面
-(void) pushToChoiceSport
{
    
    //选择完了回来显示出来
    ChoiceSportTeamViewController *choiceSportTeamViewController = [[ChoiceSportTeamViewController alloc] init];
    [self.navigationController pushViewController:choiceSportTeamViewController animated:YES];
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
            [self message];
            
            break;
            
        default:
            break;
    }
    
}

-(void) message
{
    //活动日期
    NSString *dateActivity = @"";

    
    //判断活动标题不为空且字数小于15
    if ([textFieldName.text isEqualToString:@""]) {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示" message:@"请输入活动标题" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
        [alert show];
        return;
    }else if (textFieldName.text.length > 15)
    {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示" message:@"活动标题的字数最大为15" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
        [alert show];
        return;
    }
    
    //活动地点，不能为空
    if ([textFieldLocation.text isEqualToString:@""]) {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示" message:@"请输入活动地点" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
        [alert show];
        return;
    }
    
    //活动日期
    if ([datePicker date] == nil) {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示" message:@"请选择活动日期" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
        [alert show];
        return;
    }else
    {
        dateActivity = [Common getChangeTime:[datePicker date]];
    }
    
    //球队内部外部活动
    //flagChoice
    
    //场地类型
    //flagChoice2
    
    //活动费用
    //flagChoice4
    NSString *fee = @"";
    if (flagChoice4 == 0) {
        fee = textFieldAllPrice.text;
    }else if (flagChoice4 == 1)
    {
        fee = textFieldUnitPrice.text;
    }else if (flagChoice4 == 2)
    {
        fee = textFieldAccount.text;
    }
    
    //人数下限
    
    
    
    
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示" message:@"接口还在调试中，谢谢参与！" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
    [alert show];
    return;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
