//
//  MyTeamTableViewCell.h
//  QQZQ
//
//  Created by cafuc on 15/10/5.
//  Copyright (c) 2015年 cafuc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SportDataCell.h"

@interface MyTeamTableViewCell : UITableViewCell

@property (strong,nonatomic) UILabel *labelSportName;
@property (strong,nonatomic) UILabel *labelSportTime;
@property (strong,nonatomic) UITextView *textContent;
//加在这里是为了变灰色方便
@property (strong,nonatomic) UILabel *labelSportNameShow;

-(void) initCellData:(SportDataCell *)bean;

@end
