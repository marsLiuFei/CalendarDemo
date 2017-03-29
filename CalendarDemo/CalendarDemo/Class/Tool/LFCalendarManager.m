//
//  LFCalendarManager.m
//  CalendarDemo
//
//  Created by apple on 2017/3/28.
//  Copyright © 2017年 baixinxueche. All rights reserved.
//

#import "LFCalendarManager.h"
#import "LFGetAllYearDateTool.h"
#import "LFCanlendarModel.h"

@implementation LFCalendarManager

static LFCalendarManager *install = nil;
+ (instancetype)sharedManager{
    static dispatch_once_t onceTocken;
    dispatch_once(&onceTocken, ^{
        install = [[LFCalendarManager alloc] init];
    });
    return install;
}

- (NSMutableArray *)getDateModelArrayByYear:(NSString *)year{
    NSMutableArray *arrayM = [[LFGetAllYearDateTool sharedManager] getNumberOfDaysInMonthByYear:year];
    NSMutableArray *modelArray = [[NSMutableArray alloc] init];
    for (NSDictionary *dic in arrayM) {
        LFCanlendarModel *model = [LFCanlendarModel getLoadDataWithDic:dic];
        [modelArray addObject:model];
    }
    return modelArray;
}



@end
