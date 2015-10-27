//
//  SportNewsViewController.h
//  QQZQ
//
//  Created by cafuc on 15/10/5.
//  Copyright (c) 2015年 cafuc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SportNewsViewController : UIViewController

//返回按钮
@property (weak,nonatomic) IBOutlet UIButton *buttonBack;
@property (weak,nonatomic) IBOutlet UILabel *labelSportName;
@property (weak,nonatomic) IBOutlet UILabel *labelSportTime;
//球队介绍textView
@property (strong,nonatomic) IBOutlet UITextView *textViewShow;

//接收
@property (strong,nonatomic) NSString *receicedName;
@property (strong,nonatomic) NSString *receivedTime;
@property (strong,nonatomic) NSString *receivedContent;

//响应按钮方法
-(IBAction)clickBtn:(id)sender;

@end
