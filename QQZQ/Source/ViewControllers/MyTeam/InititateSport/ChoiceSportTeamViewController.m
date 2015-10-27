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



@interface ChoiceSportTeamViewController ()<UITableViewDataSource,UITableViewDelegate>
{
     NSMutableArray *arrayData;
}

@end

@implementation ChoiceSportTeamViewController

//@synthesize buttonBack;
@synthesize tableViewSports;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    //初始化数组
    arrayData = [[NSMutableArray alloc] init];
    //测试
    FindViewData *findViewData = [[FindViewData alloc] init];
    findViewData.imageUrl = @"http://image.baidu.com/search/detail?ct=503316480&z=0&ipn=d&word=%E5%9B%BE%E7%89%87%20png%E6%A0%BC%E5%BC%8F&step_word=&pn=0&spn=0&di=67714301380&pi=&rn=1&tn=baiduimagedetail&is=0%2C0&istype=0&ie=utf-8&oe=utf-8&in=&cl=2&lm=-1&st=undefined&cs=1089436324%2C3910665089&os=1479526918%2C3247161766&adpicid=0&ln=1000&fr=ala&fmq=1441898090399_R&ic=undefined&s=undefined&se=&sme=&tab=0&width=&height=&face=undefined&ist=&jit=&cg=&bdtype=0&objurl=http%3A%2F%2Fa.hiphotos.baidu.com%2Fzhidao%2Fwh%3D600%2C800%2Fsign%3D8899159308f79052ef4a4f383cc3fbf2%2F78310a55b319ebc41f7810198326cffc1e171629.jpg&fromurl=ippr_z2C%24qAzdH3FAzdH3Fzit1w5_z%26e3Bkwt17_z%26e3Bv54AzdH3Fq7jfpt5gAzdH3Fcmdmmdmb8_z%26e3Bip4s&gsm=0";
    findViewData.teamName = @"成都皇马队";
    findViewData.teamLeader = @"李师兄";
    findViewData.teamNumber = @"15人";
    findViewData.establishTime = @"2015年09月10日";
    
    [arrayData addObject:findViewData];
    
    
    
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
