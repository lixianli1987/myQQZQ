//
//  FindViewTableViewCell.h
//  QQZQ
//
//  Created by cafuc on 15/9/10.
//  Copyright (c) 2015年 cafuc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FindViewData.h"


@interface FindViewTableViewCell : UITableViewCell

//图片
@property (weak,nonatomic) IBOutlet UIImageView *imageview;
//球队名称
@property (weak,nonatomic) IBOutlet UILabel *labelSportName;
//球队队长
@property (weak,nonatomic) IBOutlet UILabel *labelSportLeader;
//球员人数
@property (weak,nonatomic) IBOutlet UILabel *labelSportNumber;
//成立时间
@property (weak,nonatomic) IBOutlet UILabel *labelSportEstablishTime;


-(void) initCellData:(FindViewData *)bean;

@end
