//
//  TeamMemberDatumViewController.h
//  QQZQ
//
//  Created by cafuc on 15/10/29.
//  Copyright © 2015年 cafuc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TeamMemberDatumViewController : UIViewController

//返回按钮
@property (weak,nonatomic) IBOutlet UIButton *buttonBack;

//球队管理
@property (weak,nonatomic) IBOutlet UIButton *buttonBaseInfo;
//球队内部活动
@property (weak,nonatomic) IBOutlet UIButton *buttonPhoto;


//scrollview
@property (strong,nonatomic) IBOutlet UIScrollView *scrollViewAll;

//响应按钮方法
-(IBAction)clickBtn:(id)sender;

@end
