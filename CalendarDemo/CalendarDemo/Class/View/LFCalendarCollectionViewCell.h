//
//  LFCalendarCollectionViewCell.h
//  CalendarDemo
//
//  Created by apple on 2017/3/28.
//  Copyright © 2017年 baixinxueche. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LFCalendarCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UILabel *dayLabel;

@property (weak, nonatomic) IBOutlet UILabel *chinaDayLabel;

- (void)setCellStylebyIndexPath:(NSIndexPath *)indexPath withNowInteger:(NSInteger)Integer withYear:(NSString *)year;

@end
