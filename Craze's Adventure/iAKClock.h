//
//  iAKClock.h
//  testClock
//
//  Created by Xiaonan Wang on 7/22/14.
//  Copyright (c) 2014 iAK. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface iAKClock : NSObject

//TIMER
@property NSInteger endCDFlag;
@property (strong) NSTimer *timer;
@property (nonatomic) float currentSecond, currentMinute, currentHour, currentDay, currentMonth, currentYear,countDownSecond, countDownMinute,countDownHour,countDownDay,countDownMonth,countDownYear;
@property NSDateComponents *d;
@property NSInteger year, month, day, hour, min, sec;
//all informations for current time, and return them as float
-(NSDateComponents *) getCurrentTime;
-(float) getCurrentSecond;
-(float) getCurrentMinute;
-(float) getCurrentHour;
-(float) getCurrentDay;
-(float) getCurrentMonth;
-(float) getCurrentWeekday;
-(float) getCurrentYear;

//time in string
//"HH:MM:SS"
-(NSString *)getTimeofDay;
//"yyyy-mm-dd HH:MM:SS"
-(NSString *)getCompleteTime;

//countdown
-(void)startCountDown:()start second:(float)s minute:(float)m hour:(float)h day:(float)d month:(float)mo year:(float)y;

-(void)addCountDownMinute:()add minute:(float)minute second:(float)second;
-(void)subCountDownMinute:()sub minute:(float)minute second:(float)second;
@end
