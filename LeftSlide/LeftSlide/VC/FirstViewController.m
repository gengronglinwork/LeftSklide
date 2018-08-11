//
//  FirstViewController.m
//  LeftSlide
//
//  Created by 耿荣林 on 2018/6/27.
//  Copyright © 2018年 耿荣林. All rights reserved.
//

#import "FirstViewController.h"
#import "FirstTableViewCell.h"
#import "MessageViewController.h"
#import "DealData.h"
#import "FirstModel.h"

#define S_Width [UIScreen mainScreen].bounds.size.width
#define S_Height [UIScreen mainScreen].bounds.size.height
#import "define.h"

@interface FirstViewController ()<UIScrollViewDelegate,UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UIView *lineView;
@property (nonatomic,strong) UIScrollView *bigScrollView;
@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];
    
    
    
   //1、创建顶部button
    [self createTopButton];
    //2、bigScrollView
    [self createScrollView];
    //3、buntton关联bigScrollView（偏移量）
    
    //4、bigScrollView关联button
    
    //5、在bigScrollView上创建对应的tableView（tag判断是哪个tableView）
    
    //6、自定义cell
    //7、实现tableView的协议
    //8、添加数据（tag判断加载的数据内容）
    //9、tableView点击进入详情页面
}

//1、创建顶部button
- (void)createTopButton{
    NSArray *arr = [NSArray arrayWithObjects:@"第一页",@"第二页",@"第三页", nil];
    _lineView = [[UIView alloc]init];
    _lineView.frame = CGRectMake(0, NAVIGATION_BAR_HEIGHT + 50, S_Width / 3.0, 2);
    _lineView.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:_lineView];
    for (int i = 0; i < arr.count; i++) {
        UIButton *btn = [UIButton buttonWithType:1];
        btn.frame = CGRectMake(S_Width / 3.0 * i, NAVIGATION_BAR_HEIGHT, S_Width / 3.0, 50);
        [self.view addSubview:btn];
        [btn setTitle:[arr objectAtIndex:i] forState:UIControlStateNormal];
        btn.tag = 20 + i;
        [btn addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
        btn.backgroundColor = [UIColor greenColor];
        if (i == 0) {
            [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        }
    }
}

- (void)click:(UIButton *)btn{
    //btn的标题：
    for (int i = 0; i < 3; i++) {
      UIButton *newBtn = [self.view viewWithTag:20 + i];
        if (newBtn.tag == btn.tag) {
            [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        }else{
            [newBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        }
    }
    //条：
    _lineView.frame = CGRectMake((btn.tag - 20 ) * S_Width / 3.0,NAVIGATION_BAR_HEIGHT + 50, S_Width / 3.0, 2);
    //scrollView
    [_bigScrollView setContentOffset:CGPointMake((btn.tag - 20 ) * S_Width, 0)];
}

//2、bigScrollView
- (void)createScrollView{
    UIScrollView *bigScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, NAVIGATION_BAR_HEIGHT + 52, S_Width, S_Height - (NAVIGATION_BAR_HEIGHT + 52) - TAB_BAR_HEIGHT)];
    bigScrollView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:bigScrollView];
    _bigScrollView = bigScrollView;
    bigScrollView.delegate = self;
    bigScrollView.tag = 10;
    bigScrollView.contentSize = CGSizeMake(S_Width * 3, 0);
    bigScrollView.pagingEnabled = YES;
    [self createTableView];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    //tiao:
    CGFloat view_x = (scrollView.contentOffset.x  / S_Width);
    _lineView.frame =  CGRectMake(view_x * S_Width / 3.0,NAVIGATION_BAR_HEIGHT + 50, S_Width / 3.0, 2);
    //but：
    for (int i = 0; i < 3; i++) {
        UIButton *newBtn = [self.view viewWithTag:20 + i];
        if ((newBtn.tag) - 20 == view_x) {
            [newBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        }else{
            [newBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        }
    }
}

- (void)createTableView{
    for (int i = 0; i < 3; i ++ ) {
        UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(S_Width * i, 0, S_Width, _bigScrollView.bounds.size.height)];
        [_bigScrollView addSubview:tableView];
        [tableView registerClass:[FirstTableViewCell class] forCellReuseIdentifier:@"cell"];
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.tag = 30 + i;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSArray *arr = [DealData getdataWithCount:20];
    return arr.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    FirstTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    FirstModel *model = [[DealData getdataWithCount:20] objectAtIndex:indexPath.row];
    cell.textLabel.text = model.title;
    cell.backgroundColor = [UIColor grayColor];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.navigationController pushViewController:[[MessageViewController alloc]init] animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
