//
//  MemberFeeManageViewController.m
//  QQZQ
//
//  Created by cafuc on 15/10/18.
//  Copyright (c) 2015年 cafuc. All rights reserved.
//

#import "MemberFeeManageViewController.h"
#import "MemberFeeData.h"
#import "MemberFeeManageTableViewCell.h"
#import "MyUtils.h"


@interface MemberFeeManageViewController ()<UIScrollViewDelegate,UITableViewDelegate,UITableViewDataSource>
{
    //选中球队管理的下划线
    UIView *viewH2;
    //cell 数据
    NSMutableArray *arrayData;
    UITableView *tableviewMemberFee;
}

@end

@implementation MemberFeeManageViewController

@synthesize labelSportName;
@synthesize buttonMoney;
@synthesize buttonDetail;
@synthesize labelMoney;
@synthesize labelTime;
@synthesize scrollViewFeeDetail;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    
    /*************初始化球队管理颜色*****/
    [buttonMoney setSelected:YES];
    [buttonMoney setTitleColor:[UIColor colorWithRed:0/255.0 green:175/255.0 blue:0/255.0 alpha:1] forState:UIControlStateSelected];
    
    [buttonDetail setSelected:NO];
    [buttonDetail setTitleColor:[UIColor colorWithRed:0/255.0 green:175/255.0 blue:0/255.0 alpha:1] forState:UIControlStateSelected];
    
    /*****************************横线*****************************/
    //初始化进来设置
    viewH2 = [[UIView alloc] initWithFrame:CGRectMake(0, 108, SCREEN_WIDTH/2, 2)];
    viewH2.backgroundColor = [UIColor colorWithRed:0/255.0 green:175/255.0 blue:0/255.0 alpha:1];
    [self.view addSubview:viewH2];
    
    [self initScrollview];
    [self initTableviewMoney];
    
}

//初始化scrollview
-(void) initScrollview
{
    //设置代理
    scrollViewFeeDetail.delegate = self;
    //翻页
    scrollViewFeeDetail.pagingEnabled = YES;
    //设置内容大小
    scrollViewFeeDetail.contentSize = CGSizeMake(SCREEN_WIDTH*2, SCREEN_HEIGHT-245);
    
    NSLog(@"初始化:%f",scrollViewFeeDetail.contentOffset.x);
}

//队员余额表tableview
-(void) initTableviewMoney
{
    tableviewMemberFee = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-100)];
    [scrollViewFeeDetail addSubview:tableviewMemberFee];
    
    
    /*****************************初始化队员余额表数据*****************************/
    //初始化数组
    arrayData = [[NSMutableArray alloc] init];
    
    MemberFeeData *memberFeeData = [[MemberFeeData alloc] init];
    memberFeeData.name = @"蓉超第2场";
    memberFeeData.date = @"2015年10月16日";
    memberFeeData.income = @"2000元";
    memberFeeData.expense = @"350元";
    [arrayData addObject:memberFeeData];
    
    MemberFeeData *memberFeeData2 = [[MemberFeeData alloc] init];
    memberFeeData2.name = @"蓉超第2场";
    memberFeeData2.date = @"2015年10月16日";
    memberFeeData2.income = @"2000元";
    memberFeeData2.expense = @"350元";
    [arrayData addObject:memberFeeData2];
    
    MemberFeeData *memberFeeData3 = [[MemberFeeData alloc] init];
    memberFeeData3.name = @"蓉超第2场";
    memberFeeData3.date = @"2015年10月16日";
    memberFeeData3.income = @"2000元";
    memberFeeData3.expense = @"350元";
    [arrayData addObject:memberFeeData3];
    
    NSLog(@"进来没");
    //tableView设置代理
    tableviewMemberFee.delegate = self;
    tableviewMemberFee.dataSource = self;
    
}



//装值的个数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"111");
    NSLog(@"zhi   :%d",arrayData.count);
    return arrayData.count;
}

//行高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
     NSLog(@"222");
    return 123;
}

//装值
- (UITableViewCell *)tableView:(UITableView *)tableViews
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"333");
    static NSString *identifier = @"MemberFeeManageTableViewCell";
    
    MemberFeeManageTableViewCell *cell = (MemberFeeManageTableViewCell *)[tableViews dequeueReusableCellWithIdentifier:identifier];
    if (cell==nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:identifier owner:self options:nil]objectAtIndex:0];
    }
    //[cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    [cell initCellData:[arrayData objectAtIndex:indexPath.row]];
    
    return cell;
    
}

//选中哪一行
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"选中第%d行",indexPath.row);
    
//    CashConsumptionRecordDetailViewController *cashConsumptionRecordDetailViewController = [[CashConsumptionRecordDetailViewController alloc] init];
//    //设置参数，传过去的cell不同
//    [self.navigationController pushViewController:cashConsumptionRecordDetailViewController animated:YES];
}

//改写手势代理
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    //输出点击的view的类名
    NSLog(@"%@",NSStringFromClass([touch.view class]));
    return YES;
}


-(IBAction)clickBtn:(id)sender
{
    UIButton *tmpBtn = (UIButton *)sender;
    switch (tmpBtn.tag) {
        case 10:
            NSLog(@"111");
            [self.navigationController popViewControllerAnimated:YES];
            break;
        case 11:
            NSLog(@"点击了队员余额表");
            [buttonMoney setSelected:YES];
            [buttonDetail setSelected:NO];
            viewH2.frame = CGRectMake(0, 108, SCREEN_WIDTH/2, 2);
            break;
        case 12:
             NSLog(@"点击了会员费收支明细");
            [buttonDetail setSelected:YES];
            [buttonMoney setSelected:NO];
            viewH2.frame = CGRectMake(SCREEN_WIDTH/2, 108, SCREEN_WIDTH/2, 2);
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
