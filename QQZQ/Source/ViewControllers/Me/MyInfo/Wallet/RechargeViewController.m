//
//  RechargeViewController.m
//  QQZQ
//
//  Created by cafuc on 15/12/15.
//  Copyright © 2015年 cafuc. All rights reserved.
//

#import "RechargeViewController.h"
#import "RechargeData.h"
#import "RechargeTableViewCell.h"


@interface RechargeViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    //需要加载的数据
    NSMutableArray *arrayData;
}

@end

@implementation RechargeViewController

@synthesize tableViewRecharge;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //测试数据
    arrayData = [[NSMutableArray alloc] init];
    RechargeData *rechargeData = [[RechargeData alloc] init];
    rechargeData.money = @"+500";
    rechargeData.type = 0;
    rechargeData.time = @"2015年12月16日";
    [arrayData addObject:rechargeData];
    
    tableViewRecharge.dataSource = self;
    tableViewRecharge.delegate = self;
}

//装值的个数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return arrayData.count;
}

//行高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 61;
}

//装值
- (UITableViewCell *)tableView:(UITableView *)tableViews
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"进来没");
    static NSString *identifier = @"RechargeTableViewCell";
    
    RechargeTableViewCell *cell = (RechargeTableViewCell *)[tableViews dequeueReusableCellWithIdentifier:identifier];
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
