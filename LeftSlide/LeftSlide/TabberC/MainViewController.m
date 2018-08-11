//
//  MainViewController.m
//  LeftSlide
//
//  Created by 耿荣林 on 2018/6/27.
//  Copyright © 2018年 耿荣林. All rights reserved.
//

#import "MainViewController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "DKNightVersionManager.h"
#import "RLViewController.h"
#import "RLLeftSlideManager.h"
#import "RLLeftSlideViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    FirstViewController *firstVC = [[FirstViewController alloc]init];
    firstVC.title = @"首页";
    UINavigationController *firstNVC = [[UINavigationController alloc]initWithRootViewController:firstVC];
    SecondViewController *secondVC = [[SecondViewController alloc]init];
    secondVC.title = @"个人";
    UINavigationController *secondNVC = [[UINavigationController alloc]initWithRootViewController:secondVC];
    self.viewControllers = @[firstNVC,secondNVC];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
