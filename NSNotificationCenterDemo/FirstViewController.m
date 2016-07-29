//
//  FirstViewController.m
//  NSNotificationCenterDemo
//
//  Created by bbigcd on 16/7/22.
//  Copyright © 2016年 cd. All rights reserved.
//

#import "FirstViewController.h"
#import "secondViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    [btn setTitle:@"跳转" forState:UIControlStateNormal];
    [btn setBackgroundColor:[UIColor yellowColor]];
    [btn setFrame:CGRectMake(100, 300, 100, 40)];
    [btn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
// 注册通知 self接受名为@"CHANGE_LABELTEXT"的通知后,执行notification:方法
    // nil表示不限制通知的发送者
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notification:) name:@"CHANGE_LABELTEXT" object:nil];
    

}

- (void)dealloc
{
    NSLog(@"注销通知");
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

// 接受对应通知之后执行的方法
- (void)notification:(NSNotification *)notification {
//    notification.name 通知的name
//    notification.object 通知的内容, 可自定义
    NSString *str = (NSString *)notification.object;
    ((UILabel *)[self.view viewWithTag:9090]).text = str;
    NSLog(@"%@", str);
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)click
{
    [self presentViewController:[[secondViewController alloc] init] animated:YES completion:nil];
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
