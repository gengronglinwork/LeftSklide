//
//  DealData.m
//  LeftSlide
//
//  Created by 耿荣林 on 2018/7/26.
//  Copyright © 2018年 耿荣林. All rights reserved.
//

#import "DealData.h"
#import "FirstModel.h"

@implementation DealData
+ (NSArray *)getdataWithCount:(NSInteger)count{
    NSMutableArray *dataarr = [NSMutableArray array];
    NSDictionary *dic = @{@"title":@"是淡粉色的",@"des":@"是淡粉色的",@"pic":@"是淡粉色的"};
    for (int i = 0; i < count; i++) {
        FirstModel *model = [[FirstModel alloc]init];
        [model setValuesForKeysWithDictionary:dic];
        [dataarr addObject:model];
    }
    return dataarr;
}
@end
