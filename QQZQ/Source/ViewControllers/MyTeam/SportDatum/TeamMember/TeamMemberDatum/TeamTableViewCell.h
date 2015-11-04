//
//  TeamTableViewCell.h
//  QQZQ
//
//  Created by cafuc on 15/11/4.
//  Copyright © 2015年 cafuc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TeamData.h"

@interface TeamTableViewCell : UITableViewCell

//图片
@property (weak,nonatomic) IBOutlet UIImageView *imageview;
//球队名称
@property (weak,nonatomic) IBOutlet UILabel *labelSportName;
//球队队长
@property (weak,nonatomic) IBOutlet UILabel *labelSportTeam;
//球员人数
@property (weak,nonatomic) IBOutlet UILabel *labelPeopleNum;
//成立时间
@property (weak,nonatomic) IBOutlet UILabel *labelTime;

-(void) initCellDataSport:(TeamData *)bean;

@end
