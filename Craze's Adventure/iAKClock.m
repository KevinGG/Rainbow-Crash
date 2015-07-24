//
//  iAKClock.m
//  testClock
//
//  Created by Xiaonan Wang on 7/22/14.
//  Copyright (c) 2014 iAK. All rights reserved.
//

#import "iAKClock.h"

@implementation iAKClock


-(NSDateComponents *) getCurrentTime
{
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDate *now;
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    NSInteger unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSWeekdayCalendarUnit |
    NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    now=[NSDate date];
    comps = [calendar components:unitFlags fromDate:now];
    return comps;
}

//time in float
-(float) getCurrentYear
{
    NSDateComponents *comps =self.getCurrentTime;
    int year = (int)[comps year];
    return year;
}

-(float) getCurrentWeekday
{
    NSDateComponents *comps =self.getCurrentTime;
    int week= (int)[comps weekday];
    return week;
}

-(float) getCurrentMonth
{
    NSDateComponents *comps =self.getCurrentTime;
    int month= (int)[comps month];
    return month;
}

-(float) getCurrentDay
{
    NSDateComponents *comps =self.getCurrentTime;
    int day = (int)[comps day];
    return day;
}

-(float) getCurrentSecond
{
    CFAbsoluteTime currentTime =   CFAbsoluteTimeGetCurrent();
    float currentSecond = (int)currentTime % 60;
    return currentSecond;
}

-(float) getCurrentMinute
{
    CFAbsoluteTime currentTime =   CFAbsoluteTimeGetCurrent();
    float currentMinute = (int)currentTime%3600/60;
    return currentMinute;
}

-(float) getCurrentHour
{
    NSDateComponents *comps =self.getCurrentTime;
    int hour = (int)[comps hour];
    return hour;
}

//time in string
//"HH:MM:SS"
-(NSString *)getTimeofDay
{
    NSString *H = [NSString stringWithFormat:@"%d",(int)self.getCurrentHour/10];
    NSString *h = [NSString stringWithFormat:@"%d",(int)self.getCurrentHour%10];
    NSString *M = [NSString stringWithFormat:@"%d",(int)self.getCurrentMinute/10];
    NSString *m = [NSString stringWithFormat:@"%d",(int)self.getCurrentMinute%10];
    NSString *S = [NSString stringWithFormat:@"%d",(int)self.getCurrentSecond/10];
    NSString *s = [NSString stringWithFormat:@"%d",(int)self.getCurrentSecond%10];
    NSString *time = [NSString stringWithFormat:@"%@%@:%@%@:%@%@",H,h,M,m,S,s];
    return time;
}

//"yyyy-mm-dd HH:MM:SS"
-(NSString *)getCompleteTime
{
    NSString *time = self.getTimeofDay;
    NSString *dateYear = [NSString stringWithFormat:@"%d",(int)self.getCurrentYear];
    NSString *dateMonth = [NSString stringWithFormat:@"%d%d",(int)self.getCurrentMonth/10,(int)self.getCurrentMonth%10];
    NSString *dateDay = [NSString stringWithFormat:@"%d%d",(int)self.getCurrentDay/10,(int)self.getCurrentDay%10];
    NSString *completeTime = [NSString stringWithFormat:@"%@-%@-%@ %@",dateYear,dateMonth,dateDay,time];
    return completeTime;
}

//count down
-(void)startCountDown:()start second:(float)s minute:(float)m hour:(float)h day:(float)d month:(float)mo year:(float)y
{
    self.endCDFlag = 0;
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timeFireMethod:) userInfo:nil repeats:YES];
    self.currentSecond = self.getCurrentSecond;
    self.currentMinute = self.getCurrentMinute;
    self.currentHour = self.getCurrentHour;
    self.currentDay = self.getCurrentDay;
    self.currentMonth = self.getCurrentMonth;
    self.currentYear = self.getCurrentYear;
    self.countDownSecond = s;
    self.countDownMinute = m;
    self.countDownHour = h;
    self.countDownDay = d;
    self.countDownMonth = mo;
    self.countDownYear = y;
    [self.timer fire];
}

-(void)timeFireMethod:(NSTimer *)t
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [[NSDateComponents alloc] init];
    [components setYear:self.countDownYear+self.currentYear];
    [components setMonth:self.countDownMonth+self.currentMonth];
    [components setDay:self.countDownDay+self.currentDay];
    [components setHour:self.countDownHour+self.currentHour];
    [components setMinute:self.countDownMinute+self.currentMinute];
    [components setSecond:self.countDownSecond+self.currentSecond];
    NSDate *fireDate = [calendar dateFromComponents:components];//目标时间
    NSDate *today = [NSDate date];//当前时间
    
    //unitFlags相当于一个比较的格式，如果去掉NSYearCalendarUnit 和NSMonthCalendarUnit ，那么间隔的年和月都会被换算为日
    
    unsigned int unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    
    //计算时间差
    self.d = [calendar components:unitFlags fromDate:today toDate:fireDate options:0];
    
    self.year = [self.d year];
    self.month = [self.d month];
    self.day = [self.d day];
    self.hour = [self.d hour];
    self.min = [self.d minute];
    self.sec = [self.d second];
    
    NSLog(@"%@",[NSString stringWithFormat:@"距离倒计时结束还有:%d年%d月%d天%d小时%d分%d秒",(int)self.year,(int)self.month,(int)self.day, (int)self.hour,(int)self.min, (int)self.sec]);//倒计时显示
    if ((self.year == 0 && self.month == 0 && self.day == 0 && self.hour == 0 && self.min == 0 && self.sec== 0) ||(self.year < 0 || self.month < 0 || self.day < 0 || self.hour < 0 || self.min < 0 || self.sec < 0))
    {
        [self.timer invalidate];
        self.endCDFlag = 1;
    }
}

-(void)addCountDownMinute:()add minute:(float)minute second:(float)second
{
    self.countDownSecond = self.countDownSecond+second;
    self.countDownMinute = self.countDownMinute+minute;
}

-(void)subCountDownMinute:(id)sub minute:(float)minute second:(float)second
{
    self.countDownMinute = self.countDownMinute - minute;
    self.countDownSecond = self.countDownSecond - second;
}


@end
