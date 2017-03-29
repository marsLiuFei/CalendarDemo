//
//  LFCalendarCollectionViewCell.m
//  CalendarDemo
//
//  Created by apple on 2017/3/28.
//  Copyright © 2017年 baixinxueche. All rights reserved.
//

#import "LFCalendarCollectionViewCell.h"
#import "LFDealDateToChineseDayTool.h"

@implementation LFCalendarCollectionViewCell

- (void)setCellStylebyIndexPath:(NSIndexPath *)indexPath withNowInteger:(NSInteger)Integer withYear:(NSString *)year{
    if (Integer==0) {
        self.dayLabel.text = @"";
        self.chinaDayLabel.text = @"";
    }else{
        self.dayLabel.text = [NSString stringWithFormat:@"%ld",Integer];
        
//        NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
        NSString * dateStr = [NSString stringWithFormat:@"%@-%02ld-%02ld",year,(long)indexPath.section+1,Integer];
//        [formatter setDateFormat:@"yyyy-MM-dd"];
//        NSDate * currentDate = [formatter dateFromString:dateStr];
        
        
        self.chinaDayLabel.text = [[LFDealDateToChineseDayTool sharedManager] getChineseCalendarWithDate:dateStr];
    }
}



- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

@end
