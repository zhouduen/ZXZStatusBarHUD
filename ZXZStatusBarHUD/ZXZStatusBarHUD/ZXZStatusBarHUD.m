//
//  ZXZStatusBarHUD.m
//  ZXZStatusBarHUD
//
//  Created by duen on 15/12/17.
//  Copyright © 2017年 AAAAA. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZXZStatusBarHUD.h"
@implementation ZXZStatusBarHUD
#define ZXZMessage [UIFont systemFontOfSize:15]
static UIWindow* window_;
static NSTimer *timer_;
//消息停留时间
static CGFloat const ZXZMessageDuration = 2.0;
//消息显示/隐藏时间
static CGFloat const ZXZMAnimationDuration = 0.5;
+ (void)creatWindow
{
    CGFloat messageH = 20;
    CGRect frame = CGRectMake(0, -messageH, [UIScreen mainScreen].bounds.size.width, messageH);
    window_ = [[UIWindow alloc]init];
    window_.frame = frame;
    window_.backgroundColor = [UIColor blackColor];
    window_.hidden = NO;
    window_.windowLevel = UIWindowLevelAlert;
    frame.origin.y = 0;
    [UIView animateWithDuration:ZXZMAnimationDuration animations:^{
        window_.frame = frame;
    } completion:nil ];
}
+ (void)showMessage:(NSString*)message image:(UIImage *)image;
{
    [timer_ invalidate];
    [self creatWindow];
    UIButton *label = [[UIButton alloc]init] ;
    if (image) {
        
        [label setImage:image forState:UIControlStateNormal];
        [label setTitleEdgeInsets:UIEdgeInsetsMake(0, 10, 0, 0)];
    }
    label.frame = window_.bounds;
    [label setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    label.titleLabel.font = ZXZMessage;
    [label setTitle:message forState:UIControlStateNormal];
    [window_ addSubview:label];
    timer_ = [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(showHide) userInfo:nil repeats:NO];
}
+ (void)showSuccess:(NSString *)success
{
     [self creatWindow];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:@"check"] forState:UIControlStateNormal];
    [button setTitle:success forState:UIControlStateNormal];
    [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    button.frame = window_.bounds;
    button.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    [window_ addSubview:button];
}
+ (void)showError:(NSString *)error
{ 
    [self creatWindow];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [button setTitleEdgeInsets:UIEdgeInsetsMake(0, 10, 0, 0)];
    [button setTitle:error forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"ZXZStatusBarHUD.bundle/error"] forState:UIControlStateNormal];
    button.frame = window_.bounds;
    [window_ addSubview:button];
}
+ (void)showHide
{
    window_ = nil; 
}
+ (void)showLoading:(NSString *)loading

{
    [self creatWindow];
    
    UILabel *label = [[UILabel alloc]init];
    label.text = loading;
    label.font = ZXZMessage;
    label.tintColor = [UIColor redColor];
    label.textColor = [UIColor whiteColor];
    label.frame = window_.bounds;
    label.textAlignment = NSTextAlignmentCenter;
    [window_ addSubview:label];
    /*!
     添加圈圈
     */
    UIActivityIndicatorView *activityView = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    [activityView startAnimating];
    CGFloat mesWidth = [loading sizeWithAttributes:@{NSFontAttributeName:ZXZMessage,NSForegroundColorAttributeName:[UIColor redColor]}].width;
    CGFloat centerX = (window_.bounds.size.width - mesWidth) / 2 - 20;
    CGFloat centerY = window_.bounds.size.height * 0.5;
    activityView.center = CGPointMake( centerX, centerY);
    [window_ addSubview:activityView];
}
@end
