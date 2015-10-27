//
//  ChoiceProvinceViewController.m
//  QQZQ
//
//  Created by cafuc on 15/9/3.
//  Copyright (c) 2015年 cafuc. All rights reserved.
//

#import "ChoiceProvinceViewController.h"
#import "ChoiceProvinceTableViewCell.h"
#import "RegisterViewController.h"
#import "ChoiceCityViewController.h"


@interface ChoiceProvinceViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation ChoiceProvinceViewController

@synthesize buttonBack;
@synthesize tableviewProvince;
@synthesize arrayProvince;



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //调用省份
    [self getInitProvince];
    //设置代理
    tableviewProvince.delegate = self;
    tableviewProvince.dataSource = self;
    
    
}

//省份装值
-(void) getInitProvince
{
    arrayProvince = [[NSMutableArray alloc] init];
    [arrayProvince addObject:@"安徽"];
    [arrayProvince addObject:@"北京"];
    [arrayProvince addObject:@"重庆"];
    [arrayProvince addObject:@"福建"];
    [arrayProvince addObject:@"广东"];
    [arrayProvince addObject:@"广西"];
    [arrayProvince addObject:@"贵州"];
    [arrayProvince addObject:@"甘肃"];
    [arrayProvince addObject:@"黑龙江"];
    [arrayProvince addObject:@"河北"];
    [arrayProvince addObject:@"河南"];
    [arrayProvince addObject:@"湖南"];
    [arrayProvince addObject:@"湖北"];
    [arrayProvince addObject:@"海南"];
    [arrayProvince addObject:@"吉林"];
    [arrayProvince addObject:@"江西"];
    [arrayProvince addObject:@"江苏"];
    [arrayProvince addObject:@"辽宁"];
    [arrayProvince addObject:@"宁夏"];
    [arrayProvince addObject:@"内蒙"];
    [arrayProvince addObject:@"青海"];
    [arrayProvince addObject:@"上海"];
    [arrayProvince addObject:@"山东"];
    [arrayProvince addObject:@"山西"];
    [arrayProvince addObject:@"陕西"];
    [arrayProvince addObject:@"四川"];
    [arrayProvince addObject:@"天津"];
    [arrayProvince addObject:@"西藏"];
    [arrayProvince addObject:@"新疆"];
    [arrayProvince addObject:@"云南"];
    [arrayProvince addObject:@"浙江"];
    
}

//装值的个数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return arrayProvince.count;
}

//行高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

//装值
- (UITableViewCell *)tableView:(UITableView *)tableViews
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"ChoiceProvinceTableViewCell";
    
    ChoiceProvinceTableViewCell *cell = (ChoiceProvinceTableViewCell *)[tableViews dequeueReusableCellWithIdentifier:identifier];
    if (cell==nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:identifier owner:self options:nil]objectAtIndex:0];
    }
    
    cell.labelProvince.text = arrayProvince[indexPath.row];
    
    return cell;
    
}

//选中哪一行
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //跳往城市页面
    //如果是直辖市,直接返回注册页面
    int tmpNum = (int)indexPath.row;
    NSLog(@"cccc:%d",tmpNum);
    
    if (indexPath.row == 1 ||
        indexPath.row == 2 ||
        indexPath.row == 21 ||
        indexPath.row == 26
        )
    {
        //如果是直辖市，则直接返回注册页面
        RegisterViewController *registerViewController = [self.navigationController.viewControllers objectAtIndex:self.navigationController.viewControllers.count - 2];
        //传参数
        registerViewController.labelCity.text = arrayProvince[indexPath.row];
        registerViewController.labelCity.textColor = [UIColor blackColor];
        [self.navigationController popToViewController:registerViewController animated:YES];
    }else
    {
        //跳往选择城市页面
        ChoiceCityViewController *choiceCityViewController = [[ChoiceCityViewController alloc] init];
        choiceCityViewController.receivedProvince = arrayProvince[indexPath.row];
        NSLog(@"发送的省份:%@",choiceCityViewController.receivedProvince);
        [self.navigationController pushViewController:choiceCityViewController animated:YES];
    }
    
}

//响应按钮方法
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
