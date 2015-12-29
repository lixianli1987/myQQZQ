//
//  HistoryActivityTableViewCell.h
//  QQZQ
//
//  Created by cafuc on 15/12/18.
//  Copyright © 2015年 cafuc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SportInnerData.h"

@interface HistoryActivityTableViewCell : UITableViewCell

//图片
@property (weak,nonatomic) IBOutlet UIImageView *imageUrl;
//球队名称
@property (weak,nonatomic) IBOutlet UILabel *labelActivityName;
//球队队长
@property (weak,nonatomic) IBOutlet UILabel *labelActivityLocation;
//球员人数
@property (weak,nonatomic) IBOutlet UILabel *labelActivityTime;
//成立时间
@property (weak,nonatomic) IBOutlet UILabel *labelActivityType;


-(void) initCellData:(SportInnerData *)bean;

@end
