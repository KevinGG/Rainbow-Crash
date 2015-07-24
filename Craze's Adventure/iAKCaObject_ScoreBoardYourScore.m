//
//  iAKCaObject_ScoreBoardYourScore.m
//  Craze's Adventure
//
//  Created by Xiaonan Wang on 7/25/14.
//  Copyright (c) 2014 iAK. All rights reserved.
//

#import "iAKCaObject_ScoreBoardYourScore.h"

@implementation iAKCaObject_ScoreBoardYourScore

-(instancetype)initWithScene:(iAKMyScene*)scene{
    self = [super initWithScene:scene];
    if (self) {
        self.objectID=8;
        self.imgName=nil;
        self.velocity=CGPointMake(0, 0);
        self.node = nil;
        int scoreDay = (int)myClock.getCurrentDay;
        int scoreHour = (int)myClock.getCurrentHour;
        int scoreMinute = (int)myClock.getCurrentMinute;
        int scoreSecond = (int)myClock.getCurrentSecond;
        int score = (scoreDay - startDay) * 3600 * 24 + (scoreHour - startHour) * 3600 + (scoreMinute - startMinute) * 60 + (scoreSecond - startSecond);
        self.score=score;
        self.labelNode = [SKLabelNode labelNodeWithFontNamed:@"AmericanTypewriter-bold"];
        self.labelNode.text = [NSString stringWithFormat:@"%05d",score];
        self.labelNode.fontSize = 30;
        self.labelNode.fontColor = [UIColor colorWithRed:243/255.0 green:151/255.0 blue:0/255.0 alpha:1];
        [self setNodeLocation];
        [self setNodePhysicsBody];
    }
    return self;
}


-(void)setNodeLocation{
    [_worldNode addChild:self.labelNode];
    self.labelNode.zPosition=LayerScoreBoardYourScore;
    self.labelNode.position=CGPointMake(180, 120);
}

-(void)setNodePhysicsBody{
    
}


-(void)myaction{
    
}


@end
