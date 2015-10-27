//
//  SportInnerAcyivityTableViewCell.h
//  QQZQ
//
//  Created by cafuc on 15/10/5.
//  Copyright (c) 2015年 cafuc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SportInnerData.h"

@interface SportInnerAcyivityTableViewCell : UITableViewCell

@property (strong,nonatomic) UIImageView *imgView;
@property (strong,nonatomic) UILabel *labelSportName;
@property (strong,nonatomic) UILabel *labelActivityName;
@property (strong,nonatomic) UILabel *labelActivityLocation;
@property (strong,nonatomic) UILabel *labelActivityTime;
@property (strong,nonatomic) UILabel *labelActivityType;
@property (strong,nonatomic) UIButton *buttonActivityStatus;

-(void) initCellDataInner:(SportInnerData *)bean;

@end
