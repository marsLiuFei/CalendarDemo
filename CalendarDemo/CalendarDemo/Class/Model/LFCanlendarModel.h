//
//  LFCanlendarModel.h
//  CalendarDemo
//
//  Created by apple on 2017/3/28.
//  Copyright © 2017年 baixinxueche. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LFCanlendarModel : NSObject

@property (strong,nonatomic) NSString *monthAllDayCount;
@property (strong,nonatomic) NSArray *monthWeekArray;

+ (instancetype)getLoadDataWithDic:(NSDictionary *)dic;

@end
