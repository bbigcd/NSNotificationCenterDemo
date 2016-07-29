//
//  secondViewController.m
//  NSNotificationCenterDemo
//
//  Created by bbigcd on 16/7/22.
//  Copyright © 2016年 cd. All rights reserved.
//

#import "secondViewController.h"

@interface secondViewController ()
{
    UITextField *_textField;
}
@end

@implementation secondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor grayColor];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    [btn setTitle:@"返回" forState:UIControlStateNormal];
    [btn setBackgroundColor:[UIColor yellowColor]];
    [btn setFrame:CGRectMake(100, 300, 100, 40)];
    [btn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    _textField = [[UITextField alloc] initWithFrame:CGRectMake(100, 400, 100, 40)];
    _textField.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_textField];

}

- (void)click
{
//    if (_textField.text != nil) {
//        [self dismissViewControllerAnimated:YES completion:nil];
//    }
    [[NSNotificationCenter defaultCenter] postNotificationName:@"CHANGE_LABELTEXT" object:[NSString stringWithFormat:@"第二页的通知内容--textField.text==%@", _textField.text]];
    
//    [[NSNotificationCenter defaultCenter] postNotificationName:@"APPDELEGATE_NOTIFICATION" object:@"通知Applegate执行事件"];
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
