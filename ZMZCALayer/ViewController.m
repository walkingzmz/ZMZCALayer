//
//  ViewController.m
//  ZMZCALayer
//
//  Created by CiHon-IOS2 on 16/9/21.
//  Copyright © 2016年 walkingzmz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)NSArray *dataArray;
@property(nonatomic,strong)UITableView *tableview;
@end

@implementation ViewController

- (NSArray *)dataArray {
    if (!_dataArray) {
        _dataArray = @[@"CALayer的基本操作",
                       @"时钟效果",
                       @"心跳效果/转场动画",
                       @"图片折叠",
                       @"音乐震动条/复制层",
                       @"QQ粘性布局"];
    }
    return _dataArray;
}

-(UITableView *)tableview
{
    if (!_tableview) {
        _tableview = [[UITableView alloc]initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain];
        _tableview.delegate = self;
        _tableview.dataSource = self;
    }
    return _tableview;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"CAlayer";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.tableview];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.dataArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellid = @"zmzcellid";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellid];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid];
    }
    
    cell.textLabel.text = self.dataArray[indexPath.row];
    
    
    //跳转
   // [self.navigationController pushViewController:vc animated:YES];

    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSString *demoClassString = [NSString stringWithFormat:@"DemoViewController%ld", (long)indexPath.row];
    UIViewController *vc = [NSClassFromString(demoClassString) new];
    vc.title = self.dataArray[indexPath.row];
    [self.navigationController pushViewController:vc animated:YES];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
