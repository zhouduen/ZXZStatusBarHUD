//
//  ZXZStatusBarHUD.h
//  ZXZStatusBarHUD
//
//  Created by duen on 15/12/17.
//  Copyright © 2017年 AAAAA. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZXZStatusBarHUD : NSObject
/*!
 普通文字
 
 @param message 图片
 */
+ (void)showMessage:(NSString*)message image:(UIImage*)image;
/*!
 显示成功信息
 */
+  (void)showSuccess:(NSString*)success;
/**
 *显示失败信息
 */

+ (void)showError:(NSString*)error;
/**
* 显示隐藏信息
*/
+ (void)showHide;
/*!
 显示加载信息
 */
+ (void)showLoading:(NSString*)loading;
@end
