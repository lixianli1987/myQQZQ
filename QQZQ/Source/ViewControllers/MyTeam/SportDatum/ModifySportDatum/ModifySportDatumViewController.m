//
//  ModifySportDatumViewController.m
//  QQZQ
//
//  Created by cafuc on 15/11/8.
//  Copyright © 2015年 cafuc. All rights reserved.
//

#import "ModifySportDatumViewController.h"
#import "MyUtils.h"
#import "ChoiceProvinceViewController.h"

@interface ModifySportDatumViewController ()<UITextViewDelegate,UITextFieldDelegate>
{
    //选择x人制
    int flag5;
    int flag7;
    int flag9;
    int flag11;
    
    //选择任何人、需审核
    int flagChoice;
}

@end

@implementation ModifySportDatumViewController

@synthesize buttonBack;
@synthesize buttonSure;
@synthesize viewSportHeadImg;
@synthesize textFieldSportName;
@synthesize viewSportLocation;
@synthesize button5People;
@synthesize button7People;
@synthesize button9People;
@synthesize button11People;
@synthesize buttonAnybody;
@synthesize buttonNeedVerify;
@synthesize textViewProfile;
@synthesize view5;
@synthesize view7;
@synthesize view9;
@synthesize view11;
@synthesize viewEveryOne;
@synthesize viewNeed;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //初始化选择5
    flag5 = 1;
    flag7 = 0;
    flag9 = 0;
    flag11 = 0;
    
    //初始化选择 任何人
    flagChoice = 0;
    
    
    //初始化时设置button的状态
    //需要设置5\7\9\11人制 和 任意人\需审核
    [button5People setSelected:YES];
    [button5People setBackgroundImage:[UIImage imageNamed:@"choiceNot"] forState:UIControlStateNormal];
    [button5People setBackgroundImage:[UIImage imageNamed:@"choice"] forState:UIControlStateSelected];
    [button7People setSelected:NO];
    [button7People setBackgroundImage:[UIImage imageNamed:@"choiceNot"] forState:UIControlStateNormal];
    [button7People setBackgroundImage:[UIImage imageNamed:@"choice"] forState:UIControlStateSelected];
    [button9People setSelected:NO];
    [button9People setBackgroundImage:[UIImage imageNamed:@"choiceNot"] forState:UIControlStateNormal];
    [button9People setBackgroundImage:[UIImage imageNamed:@"choice"] forState:UIControlStateSelected];
    [button11People setSelected:NO];
    [button11People setBackgroundImage:[UIImage imageNamed:@"choiceNot"] forState:UIControlStateNormal];
    [button11People setBackgroundImage:[UIImage imageNamed:@"choice"] forState:UIControlStateSelected];
    
    [buttonAnybody setSelected:YES];
    [buttonAnybody setBackgroundImage:[UIImage imageNamed:@"choice2Not"] forState:UIControlStateNormal];
    [buttonAnybody setBackgroundImage:[UIImage imageNamed:@"choice2"] forState:UIControlStateSelected];
    [buttonNeedVerify setSelected:NO];
    [buttonNeedVerify setBackgroundImage:[UIImage imageNamed:@"choice2Not"] forState:UIControlStateNormal];
    [buttonNeedVerify setBackgroundImage:[UIImage imageNamed:@"choice2"] forState:UIControlStateSelected];
    
    //设置边框
    textViewProfile.layer.borderWidth = 1;
    textViewProfile.layer.borderColor = [UIColor colorWithRed:216/255.0 green:216/255.0 blue:216/255.0 alpha:1].CGColor;
    textViewProfile.text = @"请输入对球队的简介……";
    textViewProfile.textColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1];
    textViewProfile.font = [UIFont fontWithName:@"Arial" size:14];
    //设置代理
    textViewProfile.delegate = self;
    
    //设置view单击事件
    //单击手势
    UITapGestureRecognizer *sinTapGesture5= [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(sinTapView:)];
    [view5 addGestureRecognizer:sinTapGesture5];
    UITapGestureRecognizer *sinTapGesture7= [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(sinTapView:)];
    [view7 addGestureRecognizer:sinTapGesture7];
    UITapGestureRecognizer *sinTapGesture9= [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(sinTapView:)];
    [view9 addGestureRecognizer:sinTapGesture9];
    UITapGestureRecognizer *sinTapGesture11= [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(sinTapView:)];
    [view11 addGestureRecognizer:sinTapGesture11];
    //任何人 需审核
    UITapGestureRecognizer *sinTapGestureEvery= [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(sinTapView:)];
    [viewEveryOne addGestureRecognizer:sinTapGestureEvery];
    UITapGestureRecognizer *sinTapGestureNeed= [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(sinTapView:)];
    [viewNeed addGestureRecognizer:sinTapGestureNeed];
    //球队所在地
    UITapGestureRecognizer *sinTapGestureLocation= [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(sinTapView:)];
    [viewSportLocation addGestureRecognizer:sinTapGestureLocation];
    
    //设置textField
    textFieldSportName.delegate = self;
    [textFieldSportName setValue:[UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1] forKeyPath:@"_placeholderLabel.textColor"];
}


//按钮执行方法
-(IBAction)clickBtn:(id)sender
{
    UIButton *tmpBtn = (UIButton *)sender;
    
    if (tmpBtn.tag == 10 )
    {
        NSLog(@"点击了返回按钮");
        [self.navigationController popViewControllerAnimated:YES];
    }else if (tmpBtn.tag == 11)
    {
        //点击了提交按钮
        NSLog(@"点击了提交按钮");
        
        
    }else if (tmpBtn.tag == 12)
    {
        //点击了5人制
        NSLog(@"点击了5人制");
        [button5People setSelected:YES];
        [button7People setSelected:NO];
        [button9People setSelected:NO];
        [button11People setSelected:NO];
        //设置flag
        //flag1 = 1;
        
    }else if (tmpBtn.tag == 13)
    {
        //点击了7人制
        NSLog(@"点击了7人制");
        [button5People setSelected:NO];
        [button7People setSelected:YES];
        [button9People setSelected:NO];
        [button11People setSelected:NO];
        //设置flag
        //flag1 = 2;
        
    }else if (tmpBtn.tag == 14)
    {
        //点击了9人制
        NSLog(@"点击了9人制");
        [button5People setSelected:NO];
        [button7People setSelected:NO];
        [button9People setSelected:YES];
        [button11People setSelected:NO];
        //设置flag
        //flag1 = 3;
        
    }else if (tmpBtn.tag ==15)
    {
        //点击了11人制
        NSLog(@"点击了11人制");
        [button5People setSelected:NO];
        [button7People setSelected:NO];
        [button9People setSelected:NO];
        [button11People setSelected:YES];
        //设置flag
        //flag1 = 4;
        
    }else if (tmpBtn.tag == 16)
    {
        //点击了任意人验证
        NSLog(@"点击了任意人验证");
        [buttonAnybody setSelected:YES];
        [buttonNeedVerify setSelected:NO];
        //设置flag
        //flag2 = 1;
        
    }else if (tmpBtn.tag ==17)
    {
        //点击了需审核
        NSLog(@"点击了需审核");
        [buttonAnybody setSelected:NO];
        [buttonNeedVerify setSelected:YES];
        //设置flag
        //flag2 = 2;
    }
    
    
}


//开始编辑的时候
- (void)textViewDidBeginEditing:(UITextView *)textView
{
    NSLog(@"开始编辑");
    //开始编辑的时候，整体视图上移
    self.view.frame = CGRectMake(0, -250, SCREEN_WIDTH, SCREEN_HEIGHT);
    
    //需要判断字
    if ([textViewProfile.text isEqualToString:@"请输入对球队的简介……"]) {
        textViewProfile.text = @"";
        textViewProfile.textColor = [UIColor blackColor];
    }
    
}

// textView回车或者return返回键盘
-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if ([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        
        self.view.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
        
        return NO;
    }
    return YES;
}


//textField隐藏键盘
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    //resign keyboard
    [textFieldSportName resignFirstResponder];
    return YES;
}


//单击事件响应
-(void)sinTapView:(UITapGestureRecognizer *)sender
{
    //1.先判断点击了哪个view
    int viewTag =sender.view.tag;
    switch (viewTag) {
        case 5:
            NSLog(@"点击了5");
            if (flag5 == 0) {
                //设置flag
                flag5 = 1;
                //button选择状态
                [button5People setSelected:YES];
            }else
            {
                //设置flag
                flag5 = 0;
                //button选择状态
                [button5People setSelected:NO];
            }
            break;
        case 7:
            NSLog(@"点击了7");
            if (flag7 == 0) {
                //设置flag
                flag7 = 1;
                //button选择状态
                [button7People setSelected:YES];
            }else
            {
                //设置flag
                flag7 = 0;
                //button选择状态
                [button7People setSelected:NO];
            }
            break;
        case 9:
            NSLog(@"点击了9");
            if (flag9 == 0) {
                //设置flag
                flag9 = 1;
                //button选择状态
                [button9People setSelected:YES];
            }else
            {
                //设置flag
                flag9 = 0;
                //button选择状态
                [button9People setSelected:NO];
            }
            break;
        case 11:
            NSLog(@"点击了11");
            if (flag11 == 0) {
                //设置flag
                flag11 = 1;
                //button选择状态
                [button11People setSelected:YES];
            }else
            {
                //设置flag
                flag11 = 0;
                //button选择状态
                [button11People setSelected:NO];
            }
            break;
        case 15:
            NSLog(@"点击了任何人");
            flagChoice = 0;
            [buttonAnybody setSelected:YES];
            [buttonNeedVerify setSelected:NO];
            break;
        case 16:
            NSLog(@"点击了需审核");
            flagChoice = 1;
            [buttonAnybody setSelected:NO];
            [buttonNeedVerify setSelected:YES];
            break;
        case 17:
            NSLog(@"点击了球队所在地");
            [self pushToProvince];
            
            break;
        default:
            break;
    }
    
}

//跳往选择省份页面
-(void) pushToProvince
{
    ChoiceProvinceViewController *choiceProvinceViewController = [[ChoiceProvinceViewController alloc] init];
    [self.navigationController pushViewController:choiceProvinceViewController animated:YES];
    
}


@end
