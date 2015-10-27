//
//  SportDatumViewController.h
//  QQZQ
//
//  Created by cafuc on 15/10/4.
//  Copyright (c) 2015年 cafuc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SportDatumViewController : UIViewController

//返回按钮
@property (weak,nonatomic) IBOutlet UIButton *buttonBack;
//邀请按钮
@property (weak,nonatomic) IBOutlet UIButton *buttonInvite;
//分享按钮
@property (weak,nonatomic) IBOutlet UIButton *buttonShare;
//uiviewScrollView
@property (weak,nonatomic) IBOutlet UIScrollView *scrollViewAll;

//响应按钮方法
-(IBAction)clickBtn:(id)sender;

@end
