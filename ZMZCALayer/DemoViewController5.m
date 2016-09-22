//
//  DemoViewController5.m
//  ZMZCALayer
//
//  Created by CiHon-IOS2 on 16/9/22.
//  Copyright © 2016年 walkingzmz. All rights reserved.
//

#import "DemoViewController5.h"
#import "ZMZbutton.h"

@interface DemoViewController5 ()
@property(nonatomic,strong)ZMZbutton *zmzbutton;
@property(nonatomic,strong)UIImageView *imageview;
@end


@implementation DemoViewController5


- (UIImageView *)imageview
{
    if (!_imageview) {
        _imageview = [[UIImageView alloc]initWithFrame:CGRectMake(60, 100, 220, 220)];
        _imageview.image = [UIImage imageNamed:@"卡哇伊"];
    }
    return _imageview;
}

-(ZMZbutton *)zmzbutton
{
    if (!_zmzbutton) {
        _zmzbutton = [[ZMZbutton alloc]initWithFrame:CGRectMake(100, 400, 20, 20)];
        [_zmzbutton setTitle:@"12" forState:UIControlStateNormal];
    }
    return _zmzbutton;
}

- (void)viewDidLoad {
        [super viewDidLoad];
        self.view.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:self.imageview];
    [self.view addSubview:self.zmzbutton];
    
    
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
