//
//  DemoViewController4.m
//  ZMZCALayer
//
//  Created by CiHon-IOS2 on 16/9/22.
//  Copyright © 2016年 walkingzmz. All rights reserved.
//

#import "DemoViewController4.h"

@interface DemoViewController4 ()
//音乐震动条图
//复制层
@property(nonatomic,strong)UIView *contentView,*contentV;

@end




@implementation DemoViewController4


-(UIView *)contentView
{
    if (!_contentView) {
        _contentView = [[UIView alloc]initWithFrame:CGRectMake(50, 100, 300, 200)];
        _contentView.backgroundColor = [UIColor grayColor];
    }
    return _contentView;
}

-(UIView *)contentV
{
    if (!_contentV) {
        _contentV = [[UIView alloc]initWithFrame:CGRectMake(50, 400, 300, 200)];
        _contentV.backgroundColor = [UIColor grayColor];
    }
    return _contentV;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.contentView];
    [self.view addSubview:self.contentV];
    //音乐震动条
    [self MusicVibration];
    
    //复制层
    [self replicatorL];
    
    // Do any additional setup after loading the view.
}
-(void)MusicVibration{
    
    //复制层
    CAReplicatorLayer *repL = [CAReplicatorLayer layer];
    repL.frame = self.contentView.bounds;
    
    repL.instanceCount = 7;
    
    repL.instanceTransform = CATransform3DMakeTranslation(40, 0, 0);
    //设置动画延时执行时间
    repL.instanceDelay = 0.5;
    [self.contentView.layer addSublayer:repL];

    
    //创建一个音乐震动条
    CALayer *layer = [CALayer layer];
    CGFloat w = 30;
    CGFloat h = 150;
    layer.bounds = CGRectMake(0, 0, w, h);
    layer.backgroundColor = [UIColor redColor].CGColor;
    layer.anchorPoint = CGPointMake(0 , 1);
    layer.position = CGPointMake(0 , self.contentView.bounds.size.height);
    [repL addSublayer:layer];
    
    //添加动画
    CABasicAnimation *anim = [CABasicAnimation animation];
    anim.keyPath = @"transform.scale.y";
    anim.toValue = @0;
    anim.duration = 0.5;
    anim.repeatCount = MAXFLOAT;
    anim.autoreverses = YES;
    [layer addAnimation:anim forKey:nil];
    
    
    
}



-(void)replicatorL{
    //复制层可以复制它里面的层
    //想要复制它里面的内容，也要把它添加到层上面
    CAReplicatorLayer *repL = [CAReplicatorLayer layer];
    repL.frame = self.contentV.bounds;
    repL.backgroundColor = [UIColor redColor].CGColor;
    [self.contentV.layer addSublayer:repL];
    
    
    CALayer *layer = [CALayer layer];
    layer.frame = CGRectMake(30, 20, 50, 50);
    layer.backgroundColor = [UIColor greenColor].CGColor;
    [repL addSublayer:layer];
    
    CALayer *layer2 = [CALayer layer];
    layer2.frame = CGRectMake(30, 80, 50, 50);
    layer2.backgroundColor = [UIColor yellowColor].CGColor;
    [repL addSublayer:layer2];
    
    //要复制的份。包括它自己
    repL.instanceCount = 4;
    //相对复制出来的上一个层做平移
    repL.instanceTransform = CATransform3DMakeTranslation(60, 0, 0);
    

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
