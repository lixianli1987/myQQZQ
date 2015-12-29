//
//  SetViewController.h
//  QQZQ
//
//  Created by cafuc on 15/12/19.
//  Copyright © 2015年 cafuc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SetViewController : UIViewController

//返回按钮
@property (weak,nonatomic) IBOutlet UIButton *buttonBack;


//响应按钮方法
-(IBAction)clickBtn:(id)sender;

@end
