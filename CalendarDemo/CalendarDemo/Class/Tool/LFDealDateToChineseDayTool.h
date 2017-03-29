//
//  LFDealDateToChineseDayTool.h
//  CalendarDemo
//
//  Created by apple on 2017/3/29.
//  Copyright © 2017年 baixinxueche. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LFDealDateToChineseDayTool : NSObject


+ (instancetype)sharedManager;


// 获取date当天的农历
-(NSString*)getChineseCalendarWithDate:(NSString*)date;

@end
