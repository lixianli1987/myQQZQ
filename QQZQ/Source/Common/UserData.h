//
//  UserData.h
//  QQZQ
//
//  Created by cafuc on 15/11/14.
//  Copyright © 2015年 cafuc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserData : NSObject

//登陆账号和密码
@property (nonatomic, strong) NSString  *loginAccount;
@property (nonatomic, strong) NSString  *loginPassword;

//单例
+ (UserData *)getUserData;

//登录时初始化数据
- (void)initUserData:(NSString *)loginAccount password:(NSString *)loginPassword;

//退出登录时设置
- (void)signOutUser;

@end
