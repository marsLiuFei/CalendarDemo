//
//  LFCalendarManager.h
//  CalendarDemo
//
//  Created by apple on 2017/3/28.
//  Copyright © 2017年 baixinxueche. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LFCalendarManager : NSObject
/**
 *  创建单例
 */
+ (instancetype)sharedManager;

- (NSMutableArray *)getDateModelArrayByYear:(NSString *)year;

@end
