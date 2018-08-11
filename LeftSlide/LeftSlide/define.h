//
//  define.h
//  iPhoneX适配
//
//  Created by 耿荣林 on 2018/5/28.
//  Copyright © 2018年 耿荣林. All rights reserved.
//
#ifndef define_h
#define define_h

#pragma iPhoneX的适配宏：
// 判断是否是iPhone X
#define iPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436),[[UIScreen mainScreen] currentMode].size) : NO)
// 状态栏高度
#define STATUS_BAR_HEIGHT (iPhoneX ? 44.f : 20.f)
// 导航栏高度
#define NAVIGATION_BAR_HEIGHT (iPhoneX ? 88.f : 64.f)
// tabBar高度
#define TAB_BAR_HEIGHT (iPhoneX ? (49.f+34.f) : 49.f)
// home indicator高度
#define HOME_INDICATOR_HEIGHT (iPhoneX ? 34.f : 0.f)

#pragma iPhoneX的适配宏：


#endif /* define_h */
