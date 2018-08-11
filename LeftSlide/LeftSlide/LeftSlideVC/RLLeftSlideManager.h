//
//  RLLeftSlideManager.h
//  LeftSlide
//
//  Created by 耿荣林 on 2018/6/27.
//  Copyright © 2018年 耿荣林. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RLLeftSlideViewController.h"

@interface RLLeftSlideManager : NSObject
@property (nonatomic,strong) RLLeftSlideViewController *LeftSlideVC;
@property (strong, nonatomic) UINavigationController *mainNavigationController;
+ (instancetype)sharedIncetance;

@end
