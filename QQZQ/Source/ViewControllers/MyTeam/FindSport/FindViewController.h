//
//  FindViewController.h
//  QQZQ
//
//  Created by cafuc on 15/9/5.
//  Copyright (c) 2015年 cafuc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FindViewController : UIViewController

//返回按钮
@property (weak,nonatomic) IBOutlet UIButton *buttonBack;

//searchBar
@property (weak,nonatomic) IBOutlet UISearchBar *searchBarMy;

//tabview
@property (weak,nonatomic) IBOutlet UITableView *tableView;


//响应按钮方法
-(IBAction)clickBtn:(id)sender;


@end
