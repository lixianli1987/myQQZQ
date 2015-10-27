//
//  CashConsumptionRecordDetailViewController.m
//  QQZQ
//
//  Created by cafuc on 15/10/17.
//  Copyright (c) 2015年 cafuc. All rights reserved.
//

#import "CashConsumptionRecordDetailViewController.h"
#import "CashRecordDetailCollectionViewCell.h"
#import "CashData.h"


@interface CashConsumptionRecordDetailViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
{
    NSMutableArray *arrayCellData;
}

@end

@implementation CashConsumptionRecordDetailViewController


@synthesize labelActivityName;
@synthesize labelActivityDate;
@synthesize labelActivityTime;
@synthesize labelType;
@synthesize labelMoneySum;
@synthesize labelPeopleAvg;
@synthesize labelMode;
@synthesize labelInitiPeople;
@synthesize labelList;
@synthesize collectionViewList;



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //网络请求
    
    
    //初始化collection数据
    [self initCellData];
    
    //注册cell
    [collectionViewList registerClass:[CashRecordDetailCollectionViewCell class] forCellWithReuseIdentifier:@"CashRecordDetailCollectionViewCell"];
    collectionViewList.backgroundColor = [UIColor clearColor];
    collectionViewList.delegate = self;
    collectionViewList.dataSource = self;
}


//cell数据
-(void) initCellData
{
    //初始化数组
    arrayCellData = [[NSMutableArray alloc] init];
    //初始化一个对象
    CashData *cashData = [[CashData alloc] init];
    cashData.name = @"李师兄XX";
    cashData.imageUrl = @"http://static.oschina.net/uploads/space/2015/1005/105628_bbrj_2312022.png";
    [arrayCellData addObject:cashData];
    
    CashData *cashData2 = [[CashData alloc] init];
    cashData2.name = @"李师兄XX";
    cashData2.imageUrl = @"http://static.oschina.net/uploads/space/2015/1005/105628_bbrj_2312022.png";
    [arrayCellData addObject:cashData2];
    
    CashData *cashData3 = [[CashData alloc] init];
    cashData3.name = @"李师兄XX";
    cashData3.imageUrl = @"http://static.oschina.net/uploads/space/2015/1005/105628_bbrj_2312022.png";
    [arrayCellData addObject:cashData3];
    
    CashData *cashData4 = [[CashData alloc] init];
    cashData4.name = @"李师兄XX";
    cashData4.imageUrl = @"http://static.oschina.net/uploads/space/2015/1005/105628_bbrj_2312022.png";
    [arrayCellData addObject:cashData4];
    
    CashData *cashData5 = [[CashData alloc] init];
    cashData5.name = @"李师兄XX";
    cashData5.imageUrl = @"http://static.oschina.net/uploads/space/2015/1005/105628_bbrj_2312022.png";
    [arrayCellData addObject:cashData5];
}

//set UICollectionViewCell number
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    NSLog(@"111");
    return [arrayCellData count];
}

//UICollectionView content
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"222");
    static NSString *CellIdentifier = @"CashRecordDetailCollectionViewCell";
    
    CashRecordDetailCollectionViewCell *cell = (CashRecordDetailCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    cell.backgroundColor = [UIColor clearColor];
    [cell initCellData:[arrayCellData objectAtIndex:indexPath.row]];
    
    return cell;
}

//每个cell的边缘距离
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(10, 10, 0, 0);//上左下右
}

//设置一行每个cell之间的距离
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}

//choice
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"333");
    NSLog(@"点击的是哪个cell:%d",indexPath.row);
}

//按钮执行方法
-(IBAction)clickBtn:(id)sender
{
    UIButton *tmpBtn = (UIButton *)sender;
    
    NSLog(@"点击了返回按钮");
    [self.navigationController popViewControllerAnimated:YES];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
