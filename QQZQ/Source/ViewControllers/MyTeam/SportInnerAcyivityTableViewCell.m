//
//  SportInnerAcyivityTableViewCell.m
//  QQZQ
//
//  Created by cafuc on 15/10/5.
//  Copyright (c) 2015年 cafuc. All rights reserved.
//

#import "SportInnerAcyivityTableViewCell.h"
#import "UIImageView+AFNetworking.h"
#import "MyUtils.h"

@implementation SportInnerAcyivityTableViewCell

@synthesize imgView;
@synthesize labelSportName;
@synthesize labelActivityName;
@synthesize labelActivityLocation;
@synthesize labelActivityTime;
@synthesize labelActivityType;
@synthesize buttonActivityStatus;


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


-(void) initCellDataInner:(SportInnerData *)bean
{
    //放置图片
    imgView = [[UIImageView alloc] initWithFrame:CGRectMake(15, 10, 60, 60)];
    [imgView setImageWithURL:[NSURL URLWithString:bean.imageUrl] placeholderImage:[UIImage imageNamed:@"example1"]];
    [self.contentView addSubview:imgView];
    //放置球队名称
    labelSportName = [[UILabel alloc] initWithFrame:CGRectMake(80, 10, 85, 15)];
    //labelSportName.backgroundColor = [UIColor redColor];
    labelSportName.text = @"成都老曼联老年球队";
    labelSportName.font = [UIFont systemFontOfSize:12];
    labelSportName.textColor = [UIColor colorWithRed: 9/255.0 green: 187/255.0 blue: 7/255.0 alpha:1];
    [self.contentView addSubview:labelSportName];
    //活动名称
    labelActivityName = [[UILabel alloc] initWithFrame:CGRectMake(165+5, 10, 100, 15)];
    labelActivityName.text = @"巴拉巴拉劳动力的劳动力的";
    labelActivityName.font = [UIFont systemFontOfSize:12];
    [self.contentView addSubview:labelActivityName];
    //地点
    UILabel *labelLocationShow = [[UILabel alloc] initWithFrame:CGRectMake(80, 10+15, 30, 15)];
    //labelLocationShow.backgroundColor = [UIColor redColor];
    labelLocationShow.text = @"地点:";
    labelLocationShow.font = [UIFont systemFontOfSize:10];
    labelLocationShow.textColor = [UIColor colorWithRed: 153/255.0 green: 153/255.0 blue: 153/255.0 alpha:1];
    [self.contentView addSubview:labelLocationShow];
    //地点值
    labelActivityLocation = [[UILabel alloc] initWithFrame:CGRectMake(110, 10+15, 150, 15)];
    labelActivityLocation.text = @"成都武侯区中环绿荫球场";
    labelActivityLocation.font = [UIFont systemFontOfSize:10];
    labelActivityLocation.textColor = [UIColor colorWithRed: 153/255.0 green: 153/255.0 blue: 153/255.0 alpha:1];
    [self.contentView addSubview:labelActivityLocation];
    //时间
    UILabel *labelTimeShow = [[UILabel alloc] initWithFrame:CGRectMake(80, 10+30, 30, 15)];
    //labelLocationShow.backgroundColor = [UIColor redColor];
    labelTimeShow.text = @"时间:";
    labelTimeShow.font = [UIFont systemFontOfSize:10];
    labelTimeShow.textColor = [UIColor colorWithRed: 153/255.0 green: 153/255.0 blue: 153/255.0 alpha:1];
    [self.contentView addSubview:labelTimeShow];
    //时间值
    labelActivityTime = [[UILabel alloc] initWithFrame:CGRectMake(110, 10+30, 100, 15)];
    labelActivityTime.text = @"10月06日 周四 18:00";
    labelActivityTime.font = [UIFont systemFontOfSize:10];
    labelActivityTime.textColor = [UIColor colorWithRed: 153/255.0 green: 153/255.0 blue: 153/255.0 alpha:1];
    [self.contentView addSubview:labelActivityTime];
    //类型
    UILabel *labelTypeShow = [[UILabel alloc] initWithFrame:CGRectMake(80, 10+45, 30, 15)];
    //labelLocationShow.backgroundColor = [UIColor redColor];
    labelTypeShow.text = @"类型:";
    labelTypeShow.font = [UIFont systemFontOfSize:10];
    labelTypeShow.textColor = [UIColor colorWithRed: 153/255.0 green: 153/255.0 blue: 153/255.0 alpha:1];
    [self.contentView addSubview:labelTypeShow];
    //类型值
    labelActivityType = [[UILabel alloc] initWithFrame:CGRectMake(110, 10+45, 50, 15)];
    labelActivityType.text = @"7人场";
    labelActivityType.font = [UIFont systemFontOfSize:10];
    labelActivityType.textColor = [UIColor colorWithRed: 153/255.0 green: 153/255.0 blue: 153/255.0 alpha:1];
    [self.contentView addSubview:labelActivityType];
    //报名状态
    buttonActivityStatus = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH-70, 45, 50, 20)];
    [buttonActivityStatus setTitle:@"报名中" forState:UIControlStateNormal];
    [buttonActivityStatus setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    buttonActivityStatus.titleLabel.font = [UIFont systemFontOfSize:10];
    buttonActivityStatus.layer.masksToBounds = YES;
    buttonActivityStatus.layer.cornerRadius = 2;
    buttonActivityStatus.layer.borderWidth = 1;
    buttonActivityStatus.layer.borderColor = [UIColor redColor].CGColor;
    [self.contentView addSubview:buttonActivityStatus];
    //加一条横线
    UIView *viewHengxian1 = [[UIView alloc] initWithFrame:CGRectMake(20, 80, SCREEN_WIDTH-20, 1)];
    viewHengxian1.backgroundColor = [UIColor colorWithRed: 216/255.0 green: 216/255.0 blue: 216/255.0 alpha:1];
    [self.contentView addSubview:viewHengxian1];
}


@end
