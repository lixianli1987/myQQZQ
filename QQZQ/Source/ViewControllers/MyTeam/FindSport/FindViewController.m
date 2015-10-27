//
//  FindViewController.m
//  QQZQ
//
//  Created by cafuc on 15/9/5.
//  Copyright (c) 2015年 cafuc. All rights reserved.
//

#import "FindViewController.h"
#import "FindViewTableViewCell.h"
#import "FindViewData.h"


@interface FindViewController ()<UISearchBarDelegate,UITableViewDelegate,UITableViewDataSource>
{
    NSMutableArray *arrayData;
}

@end

@implementation FindViewController

@synthesize searchBarMy;
@synthesize tableView;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    //初始化数组
    arrayData = [[NSMutableArray alloc] init];
    //测试
    FindViewData *findViewData = [[FindViewData alloc] init];
    findViewData.imageUrl = @"www.baidu.com";
    findViewData.teamName = @"成都皇马队";
    findViewData.teamLeader = @"李师兄";
    findViewData.teamNumber = @"15人";
    findViewData.establishTime = @"2015年09月10日";
    [arrayData addObject:findViewData];
    
    FindViewData *findViewData2 = [[FindViewData alloc] init];
    findViewData2.imageUrl = @"www.baidu.com";
    [arrayData addObject:findViewData2];
    
    FindViewData *findViewData3 = [[FindViewData alloc] init];
    findViewData3.imageUrl = @"www.baidu.com";
    [arrayData addObject:findViewData3];
    FindViewData *findViewData4 = [[FindViewData alloc] init];
    findViewData4.imageUrl = @"www.baidu.com";
    [arrayData addObject:findViewData4];
    FindViewData *findViewData5 = [[FindViewData alloc] init];
    findViewData5.imageUrl = @"www.baidu.com";
    [arrayData addObject:findViewData5];
    FindViewData *findViewData6 = [[FindViewData alloc] init];
    findViewData6.imageUrl = @"www.baidu.com";
    [arrayData addObject:findViewData6];
    FindViewData *findViewData7 = [[FindViewData alloc] init];
    findViewData7.imageUrl = @"www.baidu.com";
    [arrayData addObject:findViewData7];
    
    
    
    
    //searchBar设置代理
    searchBarMy.delegate = self;
    
    //tableView设置代理
    tableView.delegate = self;
    tableView.dataSource = self;
    
    
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
    NSLog(@"选中第%d行",indexPath.row);
    
//    //如果是直辖市，则直接返回注册页面
//    RegisterViewController *registerViewController = [self.navigationController.viewControllers objectAtIndex:self.navigationController.viewControllers.count - 3];
//    //传参数
//    registerViewController.labelCity.text = proAndCity;
//    registerViewController.labelCity.textColor = [UIColor blackColor];
//    [self.navigationController popToViewController:registerViewController animated:YES];
    
}


//点击了search按钮搜索
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    NSLog(@"cc:%@",searchBarMy.text);
    [self textFieldShouldReturn:searchBarMy];
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


//点击了空白处将键盘隐藏
- (BOOL)textFieldShouldReturn:(UISearchBar *)textField
{
    //resign keyboard
    NSLog(@"wwww");
    [searchBarMy resignFirstResponder];
    
    return YES;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
