//
//  ChoiceCityViewController.m
//  QQZQ
//
//  Created by cafuc on 15/9/3.
//  Copyright (c) 2015年 cafuc. All rights reserved.
//

#import "ChoiceCityViewController.h"
#import "CityTableViewCell.h"
#import "RegisterViewController.h"
#import "CreateViewController.h"


@interface ChoiceCityViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation ChoiceCityViewController

@synthesize buttonBack;
@synthesize tableViewCity;
@synthesize arrayCity;
@synthesize receivedProvince;
@synthesize receiveRegisterFlag;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //根据传过来的标志位决定选择哪个方法
    [self getCityInfo];
    
    tableViewCity.delegate = self;
    tableViewCity.dataSource = self;
}



//根据flag标记选择调用哪个方法
-(void)getCityInfo
{
    //初始化城市数组
    arrayCity = [[NSMutableArray alloc] init];
    
    NSLog(@"接收过来的省份:%@",receivedProvince);
    
    if ([receivedProvince isEqualToString:@"安徽"]){
        //安徽
        [self getAnHui];
    }else if([receivedProvince isEqualToString:@"福建"])
    {
        [self getFuJian];
    }else if([receivedProvince isEqualToString:@"广东"])
    {
        [self getGuangDong];
    }else if([receivedProvince isEqualToString:@"广西"])
    {
        [self getGuangXi];
    }else if([receivedProvince isEqualToString:@"贵州"])
    {
        [self getGuiZhou];
    }else if([receivedProvince isEqualToString:@"甘肃"])
    {
        [self getGanSu];
    }else if([receivedProvince isEqualToString:@"黑龙江"])
    {
        [self getHeiLongJiang];
    }else if([receivedProvince isEqualToString:@"河北"])
    {
        [self getHeBei];
    }else if([receivedProvince isEqualToString:@"河南"])
    {
        [self getHeNan];
    }else if([receivedProvince isEqualToString:@"湖南"])
    {
        [self getHuNan];
    }else if([receivedProvince isEqualToString:@"湖北"])
    {
        [self getHuBei];
    }else if([receivedProvince isEqualToString:@"海南"])
    {
        [self getHaiNan];
    }else if([receivedProvince isEqualToString:@"吉林"])
    {
        [self getJiLin];
    }else if([receivedProvince isEqualToString:@"江西"])
    {
        [self getJiangXi];
    }else if([receivedProvince isEqualToString:@"江苏"])
    {
        [self getJiangSu];
    }else if([receivedProvince isEqualToString:@"辽宁"])
    {
        [self getLiaoNing];
    }else if([receivedProvince isEqualToString:@"宁夏"])
    {
        [self getNingXia];
    }else if([receivedProvince isEqualToString:@"内蒙"])
    {
        [self getNeiMeng];
    }else if([receivedProvince isEqualToString:@"青海"])
    {
        [self getQingHai];
    }else if([receivedProvince isEqualToString:@"山东"])
    {
        [self getShanDong];
    }else if([receivedProvince isEqualToString:@"山西"])
    {
        [self getShanXi];
    }else if([receivedProvince isEqualToString:@"陕西"])
    {
        [self getShanXi2];
    }else if([receivedProvince isEqualToString:@"四川"])
    {
        [self getSiChuan];
    }else if([receivedProvince isEqualToString:@"西藏"])
    {
        [self getXiZang];
    }else if([receivedProvince isEqualToString:@"新疆"])
    {
        [self getXinJiang];
    }else if([receivedProvince isEqualToString:@"云南"])
    {
        [self getYunNan];
    }else if([receivedProvince isEqualToString:@"浙江"])
    {
        [self getZheJiang];
    }
}

//安徽
-(void) getAnHui
{
    [arrayCity addObject:@"安庆"];
    [arrayCity addObject:@"蚌埠"];
    [arrayCity addObject:@"亳州"];
    [arrayCity addObject:@"巢湖"];
    [arrayCity addObject:@"池州"];
    [arrayCity addObject:@"滁州"];
    [arrayCity addObject:@"阜阳"];
    [arrayCity addObject:@"淮北"];
    [arrayCity addObject:@"合肥"];
    [arrayCity addObject:@"淮南"];
    [arrayCity addObject:@"黄山"];
    [arrayCity addObject:@"六安"];
    [arrayCity addObject:@"马鞍山"];
    [arrayCity addObject:@"宿州"];
    [arrayCity addObject:@"铜陵"];
    [arrayCity addObject:@"芜湖"];
    [arrayCity addObject:@"宣城"];
}

//福建
-(void) getFuJian
{
    [arrayCity addObject:@"福州"];
    [arrayCity addObject:@"龙岩"];
    [arrayCity addObject:@"宁德"];
    [arrayCity addObject:@"南平"];
    [arrayCity addObject:@"莆田"];
    [arrayCity addObject:@"泉州"];
    [arrayCity addObject:@"三明"];
    [arrayCity addObject:@"厦门"];
    [arrayCity addObject:@"漳州"];
    
}

//广东
-(void) getGuangDong
{
    [arrayCity addObject:@"潮州"];
    [arrayCity addObject:@"东莞"];
    [arrayCity addObject:@"佛山"];
    [arrayCity addObject:@"广州"];
    [arrayCity addObject:@"河源"];
    [arrayCity addObject:@"惠州"];
    [arrayCity addObject:@"江门"];
    [arrayCity addObject:@"揭阳"];
    [arrayCity addObject:@"茂名"];
    [arrayCity addObject:@"梅州"];
    [arrayCity addObject:@"清远"];
    [arrayCity addObject:@"韶关"];
    [arrayCity addObject:@"汕头"];
    [arrayCity addObject:@"汕尾"];
    [arrayCity addObject:@"深圳"];
    [arrayCity addObject:@"云浮"];
    [arrayCity addObject:@"阳江"];
    [arrayCity addObject:@"珠海"];
    [arrayCity addObject:@"湛江"];
    [arrayCity addObject:@"肇庆"];
    [arrayCity addObject:@"中山"];
}

//广西
-(void) getGuangXi
{
    [arrayCity addObject:@"北海"];
    [arrayCity addObject:@"百色"];
    [arrayCity addObject:@"崇左"];
    [arrayCity addObject:@"防城港"];
    [arrayCity addObject:@"贵港"];
    [arrayCity addObject:@"桂林"];
    [arrayCity addObject:@"河池"];
    [arrayCity addObject:@"贺州"];
    [arrayCity addObject:@"来宾"];
    [arrayCity addObject:@"柳州"];
    [arrayCity addObject:@"南宁"];
    [arrayCity addObject:@"钦州"];
    [arrayCity addObject:@"梧州"];
    [arrayCity addObject:@"玉林"];
}

//贵州
-(void) getGuiZhou
{
    [arrayCity addObject:@"安顺"];
    [arrayCity addObject:@"毕节"];
    [arrayCity addObject:@"贵阳"];
    [arrayCity addObject:@"六盘水"];
    [arrayCity addObject:@"黔东南"];
    [arrayCity addObject:@"黔南"];
    [arrayCity addObject:@"黔西南"];
    [arrayCity addObject:@"铜仁"];
    [arrayCity addObject:@"遵义"];
}

//甘肃
-(void) getGanSu
{
    [arrayCity addObject:@"白银"];
    [arrayCity addObject:@"定西"];
    [arrayCity addObject:@"甘南"];
    [arrayCity addObject:@"金昌"];
    [arrayCity addObject:@"酒泉"];
    [arrayCity addObject:@"嘉峪关"];
    [arrayCity addObject:@"陇南"];
    [arrayCity addObject:@"临夏"];
    [arrayCity addObject:@"兰州市"];
    [arrayCity addObject:@"平凉"];
    [arrayCity addObject:@"庆阳"];
    [arrayCity addObject:@"天水"];
    [arrayCity addObject:@"武威"];
    [arrayCity addObject:@"张掖"];
}

//黑龙江
-(void) getHeiLongJiang
{
    [arrayCity addObject:@"大庆"];
    [arrayCity addObject:@"大兴安岭"];
    [arrayCity addObject:@"哈尔滨"];
    [arrayCity addObject:@"鹤岗"];
    [arrayCity addObject:@"黑河"];
    [arrayCity addObject:@"佳木斯"];
    [arrayCity addObject:@"鸡西"];
    [arrayCity addObject:@"牡丹江"];
    [arrayCity addObject:@"齐齐哈尔"];
    [arrayCity addObject:@"七台河"];
    [arrayCity addObject:@"绥化"];
    [arrayCity addObject:@"双鸭山"];
    [arrayCity addObject:@"伊春"];
}

//河北
-(void) getHeBei
{
    [arrayCity addObject:@"保定"];
    [arrayCity addObject:@"承德"];
    [arrayCity addObject:@"沧州"];
    [arrayCity addObject:@"邯郸"];
    [arrayCity addObject:@"衡水"];
    [arrayCity addObject:@"廊坊"];
    [arrayCity addObject:@"秦皇岛"];
    [arrayCity addObject:@"石家庄"];
    [arrayCity addObject:@"唐山"];
    [arrayCity addObject:@"邢台"];
    [arrayCity addObject:@"张家口"];
}

//河南
-(void) getHeNan
{
    [arrayCity addObject:@"安阳"];
    [arrayCity addObject:@"鹤壁"];
    [arrayCity addObject:@"济源"];
    [arrayCity addObject:@"焦作"];
    [arrayCity addObject:@"开封"];
    [arrayCity addObject:@"漯河"];
    [arrayCity addObject:@"洛阳"];
    [arrayCity addObject:@"南阳"];
    [arrayCity addObject:@"平顶山"];
    [arrayCity addObject:@"濮阳"];
    [arrayCity addObject:@"三门峡"];
    [arrayCity addObject:@"商丘"];
    [arrayCity addObject:@"许昌"];
    [arrayCity addObject:@"新乡"];
    [arrayCity addObject:@"信阳"];
    [arrayCity addObject:@"周口"];
    [arrayCity addObject:@"驻马店"];
    [arrayCity addObject:@"郑州"];
}

//湖南
-(void) getHuNan
{
    [arrayCity addObject:@"常德"];
    [arrayCity addObject:@"长沙"];
    [arrayCity addObject:@"郴州"];
    [arrayCity addObject:@"怀化"];
    [arrayCity addObject:@"衡阳"];
    [arrayCity addObject:@"娄底"];
    [arrayCity addObject:@"邵阳"];
    [arrayCity addObject:@"湘潭"];
    [arrayCity addObject:@"湘西"];
    [arrayCity addObject:@"益阳"];
    [arrayCity addObject:@"岳阳"];
    [arrayCity addObject:@"永州"];
    [arrayCity addObject:@"张家界"];
    [arrayCity addObject:@"株洲"];
}

//湖北
-(void) getHuBei
{
    [arrayCity addObject:@"恩施"];
    [arrayCity addObject:@"鄂州"];
    [arrayCity addObject:@"黄冈"];
    [arrayCity addObject:@"黄石"];
    [arrayCity addObject:@"荆门"];
    [arrayCity addObject:@"荆州"];
    [arrayCity addObject:@"潜江"];
    [arrayCity addObject:@"神农架"];
    [arrayCity addObject:@"十堰"];
    [arrayCity addObject:@"随州"];
    [arrayCity addObject:@"天门"];
    [arrayCity addObject:@"武汉"];
    [arrayCity addObject:@"孝感"];
    [arrayCity addObject:@"咸宁"];
    [arrayCity addObject:@"仙桃"];
    [arrayCity addObject:@"襄阳"];
    [arrayCity addObject:@"宜昌"];
}

//海南
-(void) getHaiNan
{
    [arrayCity addObject:@"白沙"];
    [arrayCity addObject:@"保亭"];
    [arrayCity addObject:@"昌江"];
    [arrayCity addObject:@"澄迈"];
    [arrayCity addObject:@"定安"];
    [arrayCity addObject:@"东方"];
    [arrayCity addObject:@"儋州"];
    [arrayCity addObject:@"海口"];
    [arrayCity addObject:@"乐东"];
    [arrayCity addObject:@"临高"];
    [arrayCity addObject:@"陵水"];
    [arrayCity addObject:@"琼海"];
    [arrayCity addObject:@"琼中"];
    [arrayCity addObject:@"三沙"];
    [arrayCity addObject:@"三亚"];
    [arrayCity addObject:@"屯昌"];
    [arrayCity addObject:@"文昌"];
    [arrayCity addObject:@"万宁"];
    [arrayCity addObject:@"五指山"];
    
}

//吉林
-(void) getJiLin
{
    [arrayCity addObject:@"白城"];
    [arrayCity addObject:@"白山"];
    [arrayCity addObject:@"长春"];
    [arrayCity addObject:@"吉林"];
    [arrayCity addObject:@"辽源"];
    [arrayCity addObject:@"四平"];
    [arrayCity addObject:@"松原"];
    [arrayCity addObject:@"通化"];
    [arrayCity addObject:@"延边"];
}

//江西
-(void) getJiangXi
{
    [arrayCity addObject:@"抚州"];
    [arrayCity addObject:@"赣州"];
    [arrayCity addObject:@"吉安"];
    [arrayCity addObject:@"景德镇"];
    [arrayCity addObject:@"九江"];
    [arrayCity addObject:@"南昌"];
    [arrayCity addObject:@"萍乡"];
    [arrayCity addObject:@"上饶"];
    [arrayCity addObject:@"新余"];
    [arrayCity addObject:@"宜春"];
    [arrayCity addObject:@"鹰潭"];
}

//江苏
-(void) getJiangSu
{
    [arrayCity addObject:@"常州"];
    [arrayCity addObject:@"淮安"];
    [arrayCity addObject:@"连云港"];
    [arrayCity addObject:@"南京"];
    [arrayCity addObject:@"南通"];
    [arrayCity addObject:@"宿迁"];
    [arrayCity addObject:@"苏州"];
    [arrayCity addObject:@"泰州"];
    [arrayCity addObject:@"无锡"];
    [arrayCity addObject:@"徐州"];
    [arrayCity addObject:@"盐城"];
    [arrayCity addObject:@"扬州"];
    [arrayCity addObject:@"镇江"];
}

//辽宁
-(void) getLiaoNing
{
    [arrayCity addObject:@"鞍山"];
    [arrayCity addObject:@"本溪"];
    [arrayCity addObject:@"朝阳"];
    [arrayCity addObject:@"丹东"];
    [arrayCity addObject:@"大连"];
    [arrayCity addObject:@"抚顺"];
    [arrayCity addObject:@"阜新"];
    [arrayCity addObject:@"葫芦岛"];
    [arrayCity addObject:@"锦州"];
    [arrayCity addObject:@"辽阳"];
    [arrayCity addObject:@"盘锦"];
    [arrayCity addObject:@"沈阳"];
    [arrayCity addObject:@"铁岭"];
    [arrayCity addObject:@"营口"];
}

//宁夏
-(void) getNingXia
{
    [arrayCity addObject:@"固原"];
    [arrayCity addObject:@"石嘴山"];
    [arrayCity addObject:@"吴忠"];
    [arrayCity addObject:@"银川"];
    [arrayCity addObject:@"中卫"];
}

//内蒙
-(void) getNeiMeng
{
    [arrayCity addObject:@"阿拉善"];
    [arrayCity addObject:@"包头"];
    [arrayCity addObject:@"巴彦淖尔"];
    [arrayCity addObject:@"赤峰"];
    [arrayCity addObject:@"鄂尔多斯"];
    [arrayCity addObject:@"呼和浩特"];
    [arrayCity addObject:@"呼伦贝尔"];
    [arrayCity addObject:@"通辽"];
    [arrayCity addObject:@"乌海"];
    [arrayCity addObject:@"乌兰察布"];
    [arrayCity addObject:@"兴安"];
    [arrayCity addObject:@"锡林郭勒"];
}

//青海
-(void) getQingHai
{
    [arrayCity addObject:@"海洛"];
    [arrayCity addObject:@"海北"];
    [arrayCity addObject:@"海东"];
    [arrayCity addObject:@"黄南"];
    [arrayCity addObject:@"海南"];
    [arrayCity addObject:@"海西"];
    [arrayCity addObject:@"西宁"];
    [arrayCity addObject:@"玉树"];
}

//山东
-(void) getShanDong
{
    [arrayCity addObject:@"滨州"];
    [arrayCity addObject:@"东营"];
    [arrayCity addObject:@"德州"];
    [arrayCity addObject:@"菏泽"];
    [arrayCity addObject:@"济南"];
    [arrayCity addObject:@"济宁"];
    [arrayCity addObject:@"聊城"];
    [arrayCity addObject:@"莱芜"];
    [arrayCity addObject:@"临沂"];
    [arrayCity addObject:@"青岛"];
    [arrayCity addObject:@"日照"];
    [arrayCity addObject:@"泰安"];
    [arrayCity addObject:@"潍坊"];
    [arrayCity addObject:@"威海"];
    [arrayCity addObject:@"烟台"];
    [arrayCity addObject:@"淄博"];
    [arrayCity addObject:@"枣庄"];
}

//山西
-(void) getShanXi
{
    [arrayCity addObject:@"长治"];
    [arrayCity addObject:@"大同"];
    [arrayCity addObject:@"晋城"];
    [arrayCity addObject:@"晋中"];
    [arrayCity addObject:@"临汾"];
    [arrayCity addObject:@"吕梁"];
    [arrayCity addObject:@"朔州"];
    [arrayCity addObject:@"太原"];
    [arrayCity addObject:@"忻州"];
    [arrayCity addObject:@"运城"];
    [arrayCity addObject:@"阳泉"];
}

//陕西
-(void) getShanXi2
{
    [arrayCity addObject:@"安康"];
    [arrayCity addObject:@"宝鸡"];
    [arrayCity addObject:@"汉中"];
    [arrayCity addObject:@"商洛"];
    [arrayCity addObject:@"铜川"];
    [arrayCity addObject:@"渭南"];
    [arrayCity addObject:@"西安"];
    [arrayCity addObject:@"咸阳"];
    [arrayCity addObject:@"延安"];
    [arrayCity addObject:@"榆林"];
}

//四川
-(void) getSiChuan
{
    [arrayCity addObject:@"阿坝"];
    [arrayCity addObject:@"巴中"];
    [arrayCity addObject:@"成都"];
    [arrayCity addObject:@"德阳"];
    [arrayCity addObject:@"达州"];
    [arrayCity addObject:@"广安"];
    [arrayCity addObject:@"广元"];
    [arrayCity addObject:@"甘孜"];
    [arrayCity addObject:@"凉山"];
    [arrayCity addObject:@"乐山"];
    [arrayCity addObject:@"泸州"];
    [arrayCity addObject:@"眉山"];
    [arrayCity addObject:@"绵阳"];
    [arrayCity addObject:@"南充"];
    [arrayCity addObject:@"内江"];
    [arrayCity addObject:@"攀枝花"];
    [arrayCity addObject:@"遂宁"];
    [arrayCity addObject:@"雅安"];
    [arrayCity addObject:@"宜宾"];
    [arrayCity addObject:@"自贡"];
    [arrayCity addObject:@"资阳"];
}

//西藏
-(void) getXiZang
{
    [arrayCity addObject:@"阿里"];
    [arrayCity addObject:@"昌都"];
    [arrayCity addObject:@"拉萨"];
    [arrayCity addObject:@"林芝"];
    [arrayCity addObject:@"那曲"];
    [arrayCity addObject:@"日喀则"];
    [arrayCity addObject:@"山南"];
}

//新疆
-(void) getXinJiang
{
    [arrayCity addObject:@"阿克苏"];
    [arrayCity addObject:@"阿拉尔"];
    [arrayCity addObject:@"阿勒泰"];
    [arrayCity addObject:@"博尔塔拉"];
    [arrayCity addObject:@"巴音郭楞"];
    [arrayCity addObject:@"昌吉"];
    [arrayCity addObject:@"哈密"];
    [arrayCity addObject:@"和田"];
    [arrayCity addObject:@"克拉玛依"];
    [arrayCity addObject:@"喀什"];
    [arrayCity addObject:@"克孜勒苏"];
    [arrayCity addObject:@"石河子"];
    [arrayCity addObject:@"塔城"];
    [arrayCity addObject:@"吐鲁番"];
    [arrayCity addObject:@"图木舒克"];
    [arrayCity addObject:@"五家渠"];
    [arrayCity addObject:@"乌鲁木齐"];
    [arrayCity addObject:@"伊犁"];
}

//云南
-(void) getYunNan
{
    [arrayCity addObject:@"保山"];
    [arrayCity addObject:@"楚雄"];
    [arrayCity addObject:@"德宏"];
    [arrayCity addObject:@"大理"];
    [arrayCity addObject:@"迪庆"];
    [arrayCity addObject:@"红河"];
    [arrayCity addObject:@"昆明"];
    [arrayCity addObject:@"临沧"];
    [arrayCity addObject:@"丽江"];
    [arrayCity addObject:@"怒江"];
    [arrayCity addObject:@"普洱"];
    [arrayCity addObject:@"曲靖"];
    [arrayCity addObject:@"文山"];
    [arrayCity addObject:@"西双版纳"];
    [arrayCity addObject:@"玉溪"];
    [arrayCity addObject:@"昭通"];
}

//浙江
-(void) getZheJiang
{
    [arrayCity addObject:@"湖州"];
    [arrayCity addObject:@"杭州"];
    [arrayCity addObject:@"金华"];
    [arrayCity addObject:@"嘉兴"];
    [arrayCity addObject:@"丽水"];
    [arrayCity addObject:@"宁波"];
    [arrayCity addObject:@"衢州"];
    [arrayCity addObject:@"绍兴"];
    [arrayCity addObject:@"台州"];
    [arrayCity addObject:@"温州"];
    [arrayCity addObject:@"舟山"];
}


//装值的个数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return arrayCity.count;
}

//行高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

//装值
- (UITableViewCell *)tableView:(UITableView *)tableViews
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"CityTableViewCell";
    
    CityTableViewCell *cell = (CityTableViewCell *)[tableViews dequeueReusableCellWithIdentifier:identifier];
    if (cell==nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:identifier owner:self options:nil]objectAtIndex:0];
    }
    
    cell.labelCity.text = arrayCity[indexPath.row];
    
    return cell;
    
}

//选中哪一行
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //取出arrayCity里面的值
    //拼接传过来的省份值
    //显示给注册页面
    //int tmpNum = (int)indexPath.row;
    NSString *tmpCity = arrayCity[indexPath.row];
    NSString *proAndCity = [[receivedProvince stringByAppendingString:@" "] stringByAppendingString:tmpCity];
    
    if (receiveRegisterFlag == 1) {
    //返回注册页面
    RegisterViewController *registerViewController = [self.navigationController.viewControllers objectAtIndex:self.navigationController.viewControllers.count - 3];
    //传参数
    registerViewController.labelCity.text = proAndCity;
    registerViewController.labelCity.textColor = [UIColor blackColor];
    [self.navigationController popToViewController:registerViewController animated:YES];
    }else
    {
        //返回创建球队页面
        CreateViewController *createViewController = [self.navigationController.viewControllers objectAtIndex:self.navigationController.viewControllers.count - 3];
        //传参数
        createViewController.labelSportLocation.text = proAndCity;
        createViewController.labelSportLocation.textColor = [UIColor blackColor];
        [self.navigationController popToViewController:createViewController animated:YES];
    }
    
}


//响应按钮方法
-(IBAction)clickBtn:(id)sender
{
    //UIButton *tmpBtn = (UIButton *)sender;
    
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

@end
