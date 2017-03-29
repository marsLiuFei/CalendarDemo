//
//  LFDealDateToChineseDayTool.m
//  CalendarDemo
//
//  Created by apple on 2017/3/29.
//  Copyright © 2017年 baixinxueche. All rights reserved.
//

#import "LFDealDateToChineseDayTool.h"

@implementation LFDealDateToChineseDayTool

static LFDealDateToChineseDayTool *install = nil;
+ (instancetype)sharedManager{
    static dispatch_once_t onceTocken;
    dispatch_once(&onceTocken, ^{
        install = [[LFDealDateToChineseDayTool alloc] init];
    });
    return install;
}


-(NSString*)getChineseCalendarWithDate:(NSString*)date{
    NSArray *chineseYears = [NSArray arrayWithObjects:
                             @"甲子", @"乙丑", @"丙寅", @"丁卯",  @"戊辰",  @"己巳",  @"庚午",  @"辛未",  @"壬申",  @"癸酉",
                             @"甲戌",   @"乙亥",  @"丙子",  @"丁丑", @"戊寅",   @"己卯",  @"庚辰",  @"辛己",  @"壬午",  @"癸未",
                             @"甲申",   @"乙酉",  @"丙戌",  @"丁亥",  @"戊子",  @"己丑",  @"庚寅",  @"辛卯",  @"壬辰",  @"癸巳",
                             @"甲午",   @"乙未",  @"丙申",  @"丁酉",  @"戊戌",  @"己亥",  @"庚子",  @"辛丑",  @"壬寅",  @"癸丑",
                             @"甲辰",   @"乙巳",  @"丙午",  @"丁未",  @"戊申",  @"己酉",  @"庚戌",  @"辛亥",  @"壬子",  @"癸丑",
                             @"甲寅",   @"乙卯",  @"丙辰",  @"丁巳",  @"戊午",  @"己未",  @"庚申",  @"辛酉",  @"壬戌",  @"癸亥", nil];
    
    NSArray *chineseMonths=[NSArray arrayWithObjects:
                            @"正月", @"二月", @"三月", @"四月", @"五月", @"六月", @"七月", @"八月",
                            @"九月", @"十月", @"十一月", @"腊月", nil];
    
    NSArray *chineseDays=[NSArray arrayWithObjects:
                          @"初一", @"初二", @"初三", @"初四", @"初五", @"初六", @"初七", @"初八", @"初九", @"初十",
                          @"十一", @"十二", @"十三", @"十四", @"十五", @"十六", @"十七", @"十八", @"十九", @"二十",
                          @"廿一", @"廿二", @"廿三", @"廿四", @"廿五", @"廿六", @"廿七", @"廿八", @"廿九", @"三十",  nil];

    NSDate *dateTemp = nil;
    
    NSDateFormatter *dateFormater = [[NSDateFormatter alloc]init];
    
    [dateFormater setDateFormat:@"yyyy-MM-dd"];
    
    dateTemp = [dateFormater dateFromString:date];
    
    NSCalendar *localeCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierChinese];
    
    unsigned unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth |  NSCalendarUnitDay;
    
    NSDateComponents *localeComp = [localeCalendar components:unitFlags fromDate:dateTemp];
    
 //   NSLog(@"%ld_%ld_%ld  %@",(long)localeComp.year,(long)localeComp.month,(long)localeComp.day, localeComp.date);
    
    NSString *y_str = [chineseYears objectAtIndex:localeComp.year-1];
    NSString *m_str = [chineseMonths objectAtIndex:localeComp.month-1];
    NSString *d_str = [chineseDays objectAtIndex:localeComp.day-1];
    NSString *chineseCal_str =nil;
    NSString *choose_str = [NSString stringWithFormat: @"%@%@",m_str,d_str];
    
    NSString *riqi_str = [date substringWithRange:NSMakeRange(5, 5)];
    
    if ([d_str isEqualToString:@"初一"]) {
        chineseCal_str =[NSString stringWithFormat: @"%@",m_str];
    }else{
        if ([riqi_str isEqualToString:@"01-01"]) {
            chineseCal_str = @"元旦节";
        }else if([riqi_str isEqualToString:@"04-01"]){
            chineseCal_str = @"愚人节";
        }else if([riqi_str isEqualToString:@"05-01"]){
            chineseCal_str = @"劳动节";
        }else if([riqi_str isEqualToString:@"06-01"]){
            chineseCal_str = @"儿童节";
        }else if([riqi_str isEqualToString:@"07-01"]){
            chineseCal_str = @"建军节";
        }else if([riqi_str isEqualToString:@"08-01"]){
            chineseCal_str = @"建党节";
        }else if([riqi_str isEqualToString:@"09-10"]){
            chineseCal_str = @"教师节";
        }else if([riqi_str isEqualToString:@"10-01"]){
            chineseCal_str = @"国庆节";
        }else if([riqi_str isEqualToString:@"12-25"]){
            chineseCal_str = @"圣诞节";
        }else if ([choose_str isEqualToString:@"腊月三十"]) {
            chineseCal_str = @"除夕夜";
        }else if ([choose_str isEqualToString:@"正月十五"]){
            chineseCal_str =@"元宵节";
        }else if ([choose_str isEqualToString:@"二月初二"]){
            chineseCal_str =@"龙头节";
        }else if ([choose_str isEqualToString:@"三月初八"]){
            chineseCal_str =@"清明节";
        }else if ([choose_str isEqualToString:@"五月初五"]){
            chineseCal_str =@"端午节";
        }else if ([choose_str isEqualToString:@"八月十五"]){
            chineseCal_str =@"中秋节";
        }else{
            chineseCal_str =[NSString stringWithFormat: @"%@",d_str];
        }
        
    }
    
    return chineseCal_str;
}













@end
