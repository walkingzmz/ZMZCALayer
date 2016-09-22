//
//  DemoViewController1.m
//  ZMZCALayer
//
//  Created by CiHon-IOS2 on 16/9/22.
//  Copyright © 2016年 walkingzmz. All rights reserved.
//

#import "DemoViewController1.h"

#define angle2Rad(angle) ((angle) / 180.0 * M_PI)

//每一秒旋转6度
#define perSecondA 6
//每一分旋转
#define perMinA 6
//每一小时旋转30
#define perHourA 30
//第一分时针旋转的度数
#define perMinHour 0.5



@interface DemoViewController1 ()

@property(nonatomic,strong)UIImageView *clockimage;

@property(nonatomic,weak)CALayer *secondL;

@property(nonatomic,weak)CALayer *minuteL;

@property(nonatomic,weak)CALayer *hourL;

@end

@implementation DemoViewController1

-(UIImageView *)clockimage
{
    if (!_clockimage) {
        
        _clockimage = [[UIImageView alloc]initWithFrame:CGRectMake(100, 200, 200, 200)];
        _clockimage.image = [UIImage imageNamed:@"钟表"];
        
    }
    return _clockimage;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.clockimage];
    
    //添加时针
    [self addHour];
    
    //添加分针
    [self addMinue];
    
    //添加秒针
    [self addSecond];
    
    //添加定时器
    [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(timeChange) userInfo:nil repeats:YES];
    
    [self timeChange];
    
    CALayer *layer = [CALayer layer];
    layer.bounds = CGRectMake(0, 0, 6, 6);
    layer.backgroundColor = [UIColor blackColor].CGColor;
    layer.cornerRadius = layer.bounds.size.width * 0.5;
    layer.position = CGPointMake(self.clockimage.bounds.size.width * 0.5, self.clockimage.bounds.size.height * 0.5);
    [self.clockimage.layer addSublayer:layer];

    
}
-(void)timeChange{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    //components日历单元:年,月,日,时,分,秒
    //fromDate:从哪个时间开始取
    NSDateComponents *cmp = [calendar components:NSCalendarUnitSecond | NSCalendarUnitHour | NSCalendarUnitMinute fromDate:[NSDate date]];
    //获取当时是多少秒
    NSInteger curSecond = cmp.second;
    //获取当前是多少分
    NSInteger curMinute = cmp.minute;
    //获取当前是多少小时
    NSInteger curHour = cmp.hour;
    
    //秒针旋转多少度
    CGFloat angle = curSecond * perSecondA;
    self.secondL.transform = CATransform3DMakeRotation(angle2Rad(angle), 0, 0, 1);
    
    //让分针开始旋转
    CGFloat minuteA = curMinute * perMinA;
    self.minuteL.transform = CATransform3DMakeRotation(angle2Rad(minuteA), 0, 0, 1);
    
    //让时针开始旋转
    CGFloat hourA = curHour * perHourA + curMinute * perMinHour;
    self.hourL.transform = CATransform3DMakeRotation(angle2Rad(hourA), 0, 0, 1);
}
-(void)addHour{
    CALayer *layer = [CALayer layer];
    layer.backgroundColor = [UIColor blackColor].CGColor;
    layer.bounds = CGRectMake(0, 0, 2.5, 50);
    layer.position = CGPointMake(self.clockimage.bounds.size.width * 0.5, self.clockimage.bounds.size.height * 0.5);
    layer.anchorPoint = CGPointMake(0.5, 0.95);
    self.hourL = layer;
    [self.clockimage.layer addSublayer:layer];

}
-(void)addMinue{
    CALayer *layer = [CALayer layer];
    layer.backgroundColor = [UIColor blackColor].CGColor;
    layer.bounds = CGRectMake(0, 0, 2, 70);
    layer.position = CGPointMake(self.clockimage.bounds.size.width * 0.5, self.clockimage.bounds.size.height * 0.5);
    layer.anchorPoint = CGPointMake(0.5, 0.9);
    self.minuteL = layer;
    [self.clockimage.layer addSublayer:layer];

    
    
}
-(void)addSecond{
    //一般做旋转,缩放,都是根据锚点进旋转,缩放
    CALayer *layer = [CALayer layer];
    layer.backgroundColor = [UIColor redColor].CGColor;
    layer.bounds = CGRectMake(0, 0, 1, 82);
    layer.position = CGPointMake(self.clockimage.bounds.size.width * 0.5, self.clockimage.bounds.size.height * 0.5);
    layer.anchorPoint = CGPointMake(0.5, 0.85);
    self.secondL = layer;
    [self.clockimage.layer addSublayer:layer];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
