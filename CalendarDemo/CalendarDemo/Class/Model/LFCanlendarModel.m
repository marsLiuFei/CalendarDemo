//
//  LFCanlendarModel.m
//  CalendarDemo
//
//  Created by apple on 2017/3/28.
//  Copyright © 2017年 baixinxueche. All rights reserved.
//

#import "LFCanlendarModel.h"

@implementation LFCanlendarModel
+ (instancetype)getLoadDataWithDic:(NSDictionary *)dic {
    return [[self alloc]initWithDic:dic];
}
- (instancetype)initWithDic:(NSDictionary *)dic {
    if (self = [super init]) {
        self.monthAllDayCount = dic[@"monthAllDayCount"];
        self.monthWeekArray  = dic[@"monthWeekArray"];
    }
    return self;
}
@end
