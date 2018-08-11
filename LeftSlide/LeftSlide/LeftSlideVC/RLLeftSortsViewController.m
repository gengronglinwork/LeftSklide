//
//  RLLeftSortsViewController.m
//  LeftSlide
//
//  Created by 耿荣林 on 2018/6/27.
//  Copyright © 2018年 耿荣林. All rights reserved.
//

#import "RLLeftSortsViewController.h"
#import "Macro.h"
#import "DKNightVersion.h"
#import "RLViewController.h"
#import "RLLeftSlideManager.h"

@interface RLLeftSortsViewController ()<UITableViewDelegate,UITableViewDataSource>


@end

@implementation RLLeftSortsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UITableView *tableview = [[UITableView alloc] init];
    self.tableview = tableview;
    tableview.sectionHeaderHeight = 0;
    tableview.sectionFooterHeight = 0;
    tableview.frame = self.view.bounds;
    tableview.dataSource = self;
    tableview.delegate  = self;
    tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:tableview];
    
    
    UISwitch *lightButton = [UISwitch new];
    lightButton.frame = CGRectMake((kScreenWidth - kMainPageDistance)/2 +100, kScreenHeight - 50, 200, 44);
    [lightButton addTarget:self action:@selector(changeLight) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:lightButton];
    // 设置夜间效果的颜色
    @weakify(self);
    [self addColorChangedBlock:^{
        @strongify(self);
        self.view.normalBackgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"leftbackiamge"]];
        self.view.nightBackgroundColor = UIColorFromRGB(0x343434);
        self.tableview.normalBackgroundColor = [UIColor clearColor];
        self.tableview.nightBackgroundColor = UIColorFromRGB(0x343434);
        self.tableview.nightSeparatorColor = UIColorFromRGB(0x313131);
      self.navigationController.navigationBar.nightBarTintColor = UIColorFromRGB(0x444444);
        self.navigationItem.leftBarButtonItem.nightTintColor = [UIColor whiteColor];
        self.navigationItem.rightBarButtonItem.nightTintColor = [UIColor whiteColor];
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *Identifier = @"Identifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Identifier];
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.font = [UIFont systemFontOfSize:20.0f];
    cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.textColor = [UIColor whiteColor];
    
    if (indexPath.row == 0) {
        cell.textLabel.text = @"开通会员";
    } else if (indexPath.row == 1) {
        cell.textLabel.text = @"QQ钱包";
    } else if (indexPath.row == 2) {
        cell.textLabel.text = @"网上营业厅";
    } else if (indexPath.row == 3) {
        cell.textLabel.text = @"个性装扮";
    } else if (indexPath.row == 4) {
        cell.textLabel.text = @"我的收藏";
    } else if (indexPath.row == 5) {
        cell.textLabel.text = @"我的相册";
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    RLViewController *vc = [[RLViewController alloc] init];
    [[RLLeftSlideManager sharedIncetance].LeftSlideVC closeLeftView];//关闭左侧抽屉
    vc.hidesBottomBarWhenPushed = YES;
    [[RLLeftSlideManager sharedIncetance].mainNavigationController pushViewController:vc animated:NO];
}


-(void)changeLight{
    NSLog(@"daindad");
    if ([DKNightVersionManager currentThemeVersion] == DKThemeVersionNight) {
        [DKNightVersionManager dawnComing];
    } else {
        [DKNightVersionManager nightFalling];
    }
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
