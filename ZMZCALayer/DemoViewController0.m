//
//  DemoViewController0.m
//  ZMZCALayer
//
//  Created by CiHon-IOS2 on 16/9/21.
//  Copyright © 2016年 walkingzmz. All rights reserved.
//

#import "DemoViewController0.h"

@interface DemoViewController0 ()


@property(nonatomic,weak)CALayer *layer;

@property(nonatomic,strong)NSArray *daarr;

@property(nonatomic,strong)UIImageView *imageview;

@property(nonatomic,strong)UIView *redView;
@end

@implementation DemoViewController0

- (NSArray *)daarr {
    if (!_daarr) {
        _daarr = @[@"隐式动画",
                   @"旋转",
                   @"变圆",
                   @"阴影"];
    }
    return _daarr;
}

- (UIImageView *)imageview
{
    if (!_imageview) {
        _imageview = [[UIImageView alloc]initWithFrame:CGRectMake(200, 100, 60, 60)];
        _imageview.image = [UIImage imageNamed:@"group"];
    }
    return _imageview;
}

-(UIView *)redView
{
    if (!_redView) {
        _redView = [[UIView alloc]initWithFrame:CGRectMake(60, 300, 100, 100)];
        _redView.backgroundColor = [UIColor grayColor];
    }
    return _redView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    CALayer *layer = [CALayer layer];
    layer.bounds = CGRectMake(0, 64, 100, 100);
    layer.position = CGPointMake(100, 200);
    layer.backgroundColor = [UIColor greenColor].CGColor;
    self.layer = layer;
    [self.view.layer addSublayer:layer];

    [self loadViews];
}

-(void)loadViews{
    
    [self.view addSubview:self.imageview];
    [self.view addSubview:self.redView];
    for (int i=0; i<4; i++) {
    
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake((ScreenWidth-80*4)/5+i*(ScreenWidth-80*4)/5+80*i, ScreenHeight-100, 80, 50);
        btn.backgroundColor = [UIColor yellowColor];
        [btn setTitle:self.daarr[i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        btn.tag = 100+i;
        [btn addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
        
    }

}

-(void)click:(UIButton *)sender
{
    NSInteger n = sender.tag;
    NSLog(@"%zi",n);
    switch (n) {
        case 100:
        {
            
            [CATransaction begin];
            //设置事务有没有动画
            [CATransaction setDisableActions:NO];
            //设置事务动画的执行时长
            [CATransaction setAnimationDuration:1.0f];
            self.layer.bounds = CGRectMake(100, 100, arc4random_uniform(200), arc4random_uniform(200));
            self.layer.position = CGPointMake(arc4random_uniform(300) + 100, arc4random_uniform(400) + 100);
            self.layer.backgroundColor = [self randomColor].CGColor;
            self.layer.cornerRadius = arc4random_uniform(self.layer.bounds.size.width);
            [CATransaction commit];

        }
            break;
        case 101:
        {
            
            [UIView animateWithDuration:1.0f animations:^{
                
                /*
                 angle：旋转的弧度，所以要把角度转换成弧度：角度 * M_PI / 180。
                 
                 x：向X轴方向旋转。值范围-1 --- 1之间
                 
                 y：向Y轴方向旋转。值范围-1 --- 1之间
                 
                 z：向Z轴方向旋转。值范围-1 --- 1之间
                 
                 tx：X轴偏移位置，往下为正数。
                 
                 ty：Y轴偏移位置，往右为正数。
                 
                 tz：Z轴偏移位置，往外为正数

                 */
                
                //旋转
//                self.imageview.layer.transform = CATransform3DMakeRotation(M_PI, 1, 1, 0);
//                
//                //范围
//                self.imageview.layer.transform = CATransform3DMakeScale(0.5, 0.5, 0);
//                
//                self.imageview.layer.transform = CATransform3DMakeTranslation(100, 50, 1);
//                
                
               // NSValue *value = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI, 1, 1, 0)];
                [self.imageview.layer setValue:@(M_PI) forKeyPath:@"transform.rotation.y"];
            }];

        }
            break;
        case 102:
        {
            
            //UIView本身就自带阴影效果,它是透明.
            self.imageview.layer.shadowOpacity = 1;
            //设置阴影的偏移量
            self.imageview.layer.shadowOffset = CGSizeMake(-30, -10);
            //设置阴影的模糊程度
            self.imageview.layer.shadowRadius = 10;
            //设置阴影的颜色
            self.imageview.layer.shadowColor = [UIColor blueColor].CGColor;
            
            //设置边框的颜色
            self.imageview.layer.borderColor = [UIColor greenColor].CGColor;
            //设置边框的宽度
            self.imageview.layer.borderWidth = 2;
            
            //设置圆角半径.
            self.imageview.layer.cornerRadius = 30;
            
            //我们设置的所有layer的属性只作用在根层上.
            //    NSLog(@"%@",self.imageV.layer.contents);
            //超过根层以外东西都会被裁剪掉.
            self.imageview.layer.masksToBounds = YES;
        }
            break;
        default:
        {
            //UIView本身就自带阴影效果,它是透明.
            self.redView.layer.shadowOpacity = 1;
            //设置阴影的偏移量
            self.redView.layer.shadowOffset = CGSizeMake(-30, -10);
            //设置阴影的模糊程度
            self.redView.layer.shadowRadius = 10;
            //设置阴影的颜色
            self.redView.layer.shadowColor = [UIColor blueColor].CGColor;
            
            //设置边框的颜色
            self.redView.layer.borderColor = [UIColor greenColor].CGColor;
            //设置边框的宽度
            self.redView.layer.borderWidth = 2;
            
            //设置圆角半径.
            self.redView.layer.cornerRadius = 50;

        }
            break;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




- (UIColor *)randomColor{
    
    CGFloat r = arc4random_uniform(256) /255.0;
    CGFloat g = arc4random_uniform(256) /255.0;
    CGFloat b = arc4random_uniform(256) /255.0;
    
    return [UIColor colorWithRed:r green:g blue:b alpha:1];
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
