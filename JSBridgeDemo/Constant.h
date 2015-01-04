//
//  Constant.h
//  WebViewService
//
//  Created by Yongwei.Chen on 1/4/15.
//  Copyright (c) 2015 DCF. All rights reserved.
//

#define Application_Frame  [[UIScreen mainScreen] applicationFrame] //除去信号区的屏幕的frame
#define APP_Frame_Height   [[UIScreen mainScreen] applicationFrame].size.height //应用程序的屏幕高度
#define App_Frame_Width    [[UIScreen mainScreen] applicationFrame].size.width  //应用程序的屏幕宽度
/*** MainScreen Height Width */
#define Main_Screen_Height [[UIScreen mainScreen] bounds].size.height //主屏幕的高度
#define Main_Screen_Width  [[UIScreen mainScreen] bounds].size.width  //主屏幕的宽度
/*** ViewController Main View's Height (exclude navigation bar's height)*/
#define APP_View_Height   ([[UIScreen mainScreen] applicationFrame].size.height - CGRectGetHeight(self.navigationController.navigationBar.frame))
