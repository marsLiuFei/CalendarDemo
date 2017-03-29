//
//  LFGetAllYearDateTool.h
//  CalendarDemo
//
//  Created by apple on 2017/3/28.
//  Copyright © 2017年 baixinxueche. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LFGetAllYearDateTool : NSObject

/**
 *  创建单例
 */
+ (instancetype)sharedManager;
- (NSMutableArray *)getNumberOfDaysInMonthByYear:(NSString *)whichYear;


@end
