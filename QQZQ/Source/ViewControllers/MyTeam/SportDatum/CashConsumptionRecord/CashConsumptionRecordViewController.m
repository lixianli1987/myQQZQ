//
//  CashConsumptionRecordViewController.m
//  QQZQ
//
//  Created by cafuc on 15/10/7.
//  Copyright (c) 2015年 cafuc. All rights reserved.
//

#import "CashConsumptionRecordViewController.h"
#import "CashConsumptionTableViewCell.h"
#import "CashConsumption.h"
#import "CashConsumptionRecordDetailViewController.h"


@interface CashConsumptionRecordViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    NSMutableArray *arrayData;
}

@end

@implementation CashConsumptionRecordViewController

@synthesize buttonBack;
@synthesize labelSportName;
@synthesize tableViewRecord;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //初始化数组
    arrayData = [[NSMutableArray alloc] init];
    
    CashConsumption *cashConsumption = [[CashConsumption alloc] init];
    cashConsumption.title = @"桑拿球场7人活动";
    cashConsumption.moneySum = @"350元";
    cashConsumption.type = @"7人场";
    cashConsumption.peopleNum = @"11人";
    cashConsumption.peopleSingle = @"32元";
    cashConsumption.mode = @"【总价分摊】";
    [arrayData addObject:cashConsumption];
    
    
    //tableView设置代理
    tableViewRecord.delegate = self;
    tableViewRecord.dataSource = self;
    
}

//装值的个数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return arrayData.count;
}

//行高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 164;
}

//装值
- (UITableViewCell *)tableView:(UITableView *)tableViews
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"进来没");
    static NSString *identifier = @"CashConsumptionTableViewCell";
    
    CashConsumptionTableViewCell *cell = (CashConsumptionTableViewCell *)[tableViews dequeueReusableCellWithIdentifier:identifier];
    if (cell==nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:identifier owner:self options:nil]objectAtIndex:0];
    }
    //cell.backgroundColor = [UIColor colorWithRed:250/255.0 green:250/255.0 blue:250/255.0 alpha:1];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    [cell initCellData:[arrayData objectAtIndex:indexPath.row]];
    
    return cell;
    
}

//选中哪一行
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"选中第%d行",indexPath.row);
    
    CashConsumptionRecordDetailViewController *cashConsumptionRecordDetailViewController = [[CashConsumptionRecordDetailViewController alloc] init];
    //设置参数，传过去的cell不同
    [self.navigationController pushViewController:cashConsumptionRecordDetailViewController animated:YES];
}





//按钮执行方法
-(IBAction)clickBtn:(id)sender
{
    NSLog(@"点击了返回按钮");
    [self.navigationController popViewControllerAnimated:YES];

}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
