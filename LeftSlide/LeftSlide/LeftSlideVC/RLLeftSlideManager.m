//
//  RLLeftSlideManager.m
//  LeftSlide
//
//  Created by 耿荣林 on 2018/6/27.
//  Copyright © 2018年 耿荣林. All rights reserved.
//

#import "RLLeftSlideManager.h"

@implementation RLLeftSlideManager
static id _instance;

+ (instancetype)sharedIncetance{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[self alloc]init];
    });
    return _instance;
}

@end
