//
//  SportInnerActivityDetailViewController.h
//  QQZQ
//
//  Created by cafuc on 15/10/6.
//  Copyright (c) 2015年 cafuc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SportInnerActivityDetailViewController : UIViewController

//返回按钮
@property (weak,nonatomic) IBOutlet UIButton *buttonBack;
//发布按钮
@property (weak,nonatomic) IBOutlet UIButton *buttonShare;
//uiviewScrollView
@property (weak,nonatomic) IBOutlet UIScrollView *scrollViewAll;

//左边view
@property (weak,nonatomic) IBOutlet UIView *viewLeft;
//右边view
@property (weak,nonatomic) IBOutlet UIView *viewRight;


//响应按钮方法
-(IBAction)clickBtn:(id)sender;

@end
