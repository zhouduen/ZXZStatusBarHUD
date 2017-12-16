//
//  ViewController.m
//  ZXZStatusBarHUD
//
//  Created by duen on 15/12/17.
//  Copyright © 2017年 AAAAA. All rights reserved.
//

#import "ViewController.h"
#import "ZXZStatusBarHUD.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)message:(id)sender {
    [ZXZStatusBarHUD showMessage:@"这是一堆文字" image:[UIImage imageNamed:@"check"]];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [ZXZStatusBarHUD showSuccess:@"加载成功..."];
}
- (IBAction)success:(id)sender {
    [ZXZStatusBarHUD showSuccess:@"加载成功"];
}
- (IBAction)error:(id)sender {
    [ZXZStatusBarHUD showError:@"加载失败..."];
    
}
- (IBAction)loading:(id)sender {
    
    [ZXZStatusBarHUD showLoading:@"加载中..."];
}

- (IBAction)hide:(id)sender {
    [ZXZStatusBarHUD showHide];
}

@end
