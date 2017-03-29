//
//  LFGetAllYearDateTool.m
//  CalendarDemo
//
//  Created by apple on 2017/3/28.
//  Copyright © 2017年 baixinxueche. All rights reserved.
//

#import "LFGetAllYearDateTool.h"

@implementation LFGetAllYearDateTool

static LFGetAllYearDateTool *install = nil;
+ (instancetype)sharedManager{
    static dispatch_once_t onceTocken;
    dispatch_once(&onceTocken, ^{
        install = [[LFGetAllYearDateTool alloc] init];
    });
    return install;
}

// 获取一年中每月的总天数
- (NSMutableArray *)getNumberOfDaysInMonthByYear:(NSString *)whichYear
{
    NSCalendar * calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian]; // 指定日历的算法
    NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSMutableArray *allYaerMonthDayCountArray = [[NSMutableArray alloc] init];

    for (int j=0; j<12; j++) {
        NSMutableDictionary *dicM = [[NSMutableDictionary alloc] init];
        NSString * dateStr = [NSString stringWithFormat:@"%@-%02d-01",whichYear,j+1];
        NSDate * currentDate = [formatter dateFromString:dateStr];
        NSRange range = [calendar rangeOfUnit:NSCalendarUnitDay
                                       inUnit: NSCalendarUnitMonth
                                      forDate:currentDate];
        
        [formatter setDateFormat:@"yyyy-MM"];
        NSString * str = [formatter stringFromDate:currentDate];
        [formatter setDateFormat:@"yyyy-MM-dd"];
        NSMutableArray * allDaysArray = [[NSMutableArray alloc] init];
        for (NSInteger i = 1; i <= range.length; i++) {
            NSString * sr = [NSString stringWithFormat:@"%@-%ld",str,i];
            NSDate *suDate = [formatter dateFromString:sr];
            [allDaysArray addObject:[self getweekDayWithDate:suDate]];
        }
        
        [dicM setObject:@(range.length) forKey:@"monthAllDayCount"];
        [dicM setObject:allDaysArray forKey:@"monthWeekArray"];
        [allYaerMonthDayCountArray addObject:dicM];
    }

    return allYaerMonthDayCountArray;
}

/**
 *  获得某天的数据
 *
 *  获取指定的日期是星期几
 */
- (id) getweekDayWithDate:(NSDate *) date
{
    NSCalendar * calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian]; // 指定日历的算法
    NSDateComponents *comps = [calendar components:NSCalendarUnitWeekday fromDate:date];
    // 1 是周日，2是周一 3.以此类推
    return @([comps weekday]);
    
}









@end
