//
//  iAKCaObject_Score.m
//  Craze's Adventure
//
//  Created by Xiaonan Wang on 7/25/14.
//  Copyright (c) 2014 iAK. All rights reserved.
//

#import "iAKCaObject_Score.h"

@implementation iAKCaObject_Score

-(instancetype)initWithScene:(iAKMyScene*)scene{
    self = [super initWithScene:scene];
    if (self) {
        self.objectID=6;
        self.imgName=nil;
        self.velocity=CGPointMake(0, 0);
        self.node = nil;
        self.labelNode = [SKLabelNode labelNodeWithFontNamed:@"Mistral"];
        [self setNodeLocation];
        [self setNodePhysicsBody];
    }
    return self;
}


-(void)setNodeLocation{
    [_worldNode addChild:self.labelNode];
    self.labelNode.zPosition=LayerScore;
    self.labelNode.position=CGPointMake(65, 8);
}

-(void)setNodePhysicsBody{
    
}


-(void)myaction{
    int scoreDay = (int)myClock.getCurrentDay;
    int scoreHour = (int)myClock.getCurrentHour;
    int scoreMinute = (int)myClock.getCurrentMinute;
    int scoreSecond = (int)myClock.getCurrentSecond;
    int score = (scoreDay - startDay) * 3600 * 24 + (scoreHour - startHour) * 3600 + (scoreMinute - startMinute) * 60 + (scoreSecond - startSecond);
    self.labelNode.fontSize = 16;
    self.labelNode.fontName = @"AmericanTypewriter-bold";
    self.labelNode.text = [NSString stringWithFormat:@"Score:%05d", score];
}


@end
