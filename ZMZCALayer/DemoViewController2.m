//
//  DemoViewController2.m
//  ZMZCALayer
//
//  Created by CiHon-IOS2 on 16/9/22.
//  Copyright © 2016年 walkingzmz. All rights reserved.
//

#import "DemoViewController2.h"

@interface DemoViewController2 ()

@property(nonatomic,strong)UIImageView *imageview,*heartimage;

@end

@implementation DemoViewController2


- (UIImageView *)imageview
{
    if (!_imageview) {
        _imageview = [[UIImageView alloc]initWithFrame:CGRectMake(60, 100, 150, 300)];
        _imageview.image = [UIImage imageNamed:@"1"];
    }
    return _imageview;
}


- (UIImageView *)heartimage
{
    if (!_heartimage) {
        _heartimage = [[UIImageView alloc]initWithFrame:CGRectMake(100, 450, 100, 100)];
        _heartimage.image = [UIImage imageNamed:@"心"];
    }
    return _heartimage;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    [self loadViews];
    // Do any additional setup after loading the view.
}



-(void)loadViews{
    NSArray *Arr = @[@"转场",@"心跳"];
    [self.view addSubview:self.imageview];
    [self.view addSubview:self.heartimage];
    for (int i=0; i<2; i++) {
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake((ScreenWidth-80*4)/5+i*(ScreenWidth-80*4)/5+80*i, ScreenHeight-100, 80, 50);
        btn.backgroundColor = [UIColor yellowColor];
        [btn setTitle:Arr[i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        btn.tag = 200+i;
        [btn addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
        
    }
    
}

-(void)click:(UIButton *)sender
{
    if (sender.tag==200) {
        
        [UIView transitionWithView:self.imageview duration:1.0f options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
            /*
             UIViewAnimationOptionTransitionNone            = 0 << 20, // default
             UIViewAnimationOptionTransitionFlipFromLeft    = 1 << 20,
             UIViewAnimationOptionTransitionFlipFromRight   = 2 << 20,
             UIViewAnimationOptionTransitionCurlUp          = 3 << 20,
             UIViewAnimationOptionTransitionCurlDown        = 4 << 20,
             UIViewAnimationOptionTransitionCrossDissolve   = 5 << 20,
             UIViewAnimationOptionTransitionFlipFromTop     = 6 << 20,
             UIViewAnimationOptionTransitionFlipFromBottom  = 7 << 20,
             */
            NSString *imageName = [NSString stringWithFormat:@"%d",arc4random_uniform(3)];
            
            self.imageview.image = [UIImage imageNamed:imageName];
        } completion:nil];
        
    }else{
     
        //创建动画对象
        CABasicAnimation *anim = [CABasicAnimation animation];
        //设置属性
        anim.keyPath = @"transform.scale";
        //设置属性值
        anim.toValue = @0.5;
        //设置动画的执行次数
        anim.repeatCount = MAXFLOAT;
        //设置动画的执行时长
        anim.duration = 0.5;
        
        //自动反转
        anim.autoreverses = YES;
        //添加动画
        [self.heartimage.layer addAnimation:anim forKey:nil];

    }
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
