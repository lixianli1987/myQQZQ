/*********************************************************************
 * 版权所有 QQZQ
 *
 * 文件名称： WebServiceHost.h 请求地址管理类
 * 内容摘要： 请求地址管理类
 * 其它说明： 头文件
 * 作 成 者： LXL
 * 完成日期： 2015年07月22日
 * 修改记录1：
 * 修改日期：
 * 修 改 人：
 * 修改内容：
 * 修改记录2：
 **********************************************************************/

#import <Foundation/Foundation.h>

@interface WebServiceHost : NSObject

//阿里云
// http://121.43.229.24:8080/qqzq

//接口文档
//http://121.43.229.24:8080/qqzq/doc.pdf

//服务器地址
#define WEB_SERVER @"121.43.229.24"
//#define WEB_SERVER @"192.168.2.101"
#define WEB_PORT @":8080"
#define WEB_SERVICE_HOST [NSString stringWithFormat:@"http://%@%@/qqzq/rest", WEB_SERVER,WEB_PORT]

//登陆
#define WEB_SERVICE_LOGIN [NSString stringWithFormat:@"%@/authc/login", WEB_SERVICE_HOST]

//获取验证码
#define WEB_SERVICE_GETYZM [NSString stringWithFormat:@"%@/authc/verifycode", WEB_SERVICE_HOST]

//注册
#define WEB_SERVICE_GEGISTER [NSString stringWithFormat:@"%@/authc/register", WEB_SERVICE_HOST]


//查询用户所在球队--我的球队(球队管理)
#define WEB_SERVICE_GETMYSPORTTEAM(loginName) [NSString stringWithFormat:@"%@/team/teams/members/%@", WEB_SERVICE_HOST,loginName]


//获取我的球队
#define WEB_SERVICE_GETMYTEAM(userId) [NSString stringWithFormat:@"%@/getMyTeam%@userId=%@", WEB_SERVICE_HOST,@"?",userId]

//创建球队
#define WEB_SERVICE_CREATETEAM [NSString stringWithFormat:@"%@/team/teams", WEB_SERVICE_HOST]

//发起活动
#define WEB_SERVICE_INITIATACTIVITY [NSString stringWithFormat:@"%@/activity/activities", WEB_SERVICE_HOST]

//球队内部活动
#define WEB_SERVICE_SPORTINNERACTIVITY(publisher) [NSString stringWithFormat:@"%@/activity/activities%@publisher=%@", WEB_SERVICE_HOST,@"?",publisher]

//查找球队
#define WEB_SERVICE_FIND_SPORTTEAM(teamLeaderNum,teamName) [NSString stringWithFormat:@"%@/team/teams%@teamLeaderUsrNm=%@%@teamName=%@", WEB_SERVICE_HOST,@"?",teamLeaderNum,@"&",teamName]


@end
