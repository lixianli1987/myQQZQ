//
//  MyTeamTableViewCell.m
//  QQZQ
//
//  Created by cafuc on 15/10/5.
//  Copyright (c) 2015年 cafuc. All rights reserved.
//

#import "MyTeamTableViewCell.h"
#import "MyUtils.h"


@implementation MyTeamTableViewCell

@synthesize labelSportName;
@synthesize labelSportTime;
@synthesize textContent;
@synthesize labelSportNameShow;

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


-(void) initCellData:(SportDataCell *)bean
{
    //这里是绘制cell和装值
    //固定显示球队名称
    labelSportNameShow = [[UILabel alloc] initWithFrame:CGRectMake(15, 0, 60, 21)];
    labelSportNameShow.text = @"球队名称:";
    labelSportNameShow.font = [UIFont systemFontOfSize:12];
    [self.contentView addSubview:labelSportNameShow];
    
    //取数据球队名称
    labelSportName = [[UILabel alloc] initWithFrame:CGRectMake(75, 0, 100, 21)];
    labelSportName.text = bean.sportName;
    labelSportName.font = [UIFont systemFontOfSize:12];
    [self.contentView addSubview:labelSportName];
    
    //取时间显示
    labelSportTime = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH-90, 0, 80, 21)];
    labelSportTime.text = @"2015年08月01日";
    labelSportTime.font = [UIFont systemFontOfSize:10];
    labelSportTime.textColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1];
    [self.contentView addSubview:labelSportTime];
    
    //显示内容
    
    textContent = [[UITextView alloc] initWithFrame:CGRectMake(15, 18, SCREEN_WIDTH-30, 35)];
    //textContent.backgroundColor = [UIColor redColor];
    textContent.userInteractionEnabled = NO;
    
    if (bean.sportContent.length > 40) {
        bean.sportContent = [[bean.sportContent substringToIndex:40] stringByAppendingString:@"……"];
    }
    //装值
    textContent.text = bean.sportContent;
    
    textContent.textColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1];
    [self.contentView addSubview:textContent];
    //加一条横线
    UIView *viewHengxian1 = [[UIView alloc] initWithFrame:CGRectMake(20, 55, SCREEN_WIDTH-20, 1)];
    viewHengxian1.backgroundColor = [UIColor colorWithRed: 216/255.0 green: 216/255.0 blue: 216/255.0 alpha:1];
    [self.contentView addSubview:viewHengxian1];
    
    
}


@end
