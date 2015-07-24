//
//  iAKCaObject.m
//  Craze's Adventure
//
//  Created by KangNing on 7/24/14.
//  Copyright (c) 2014 iAK. All rights reserved.
//

#import "iAKCaObject.h"

@implementation iAKCaObject

extern SKNode *_worldNode;
extern float playableStart,playableHeight;
extern const float kGravity;
extern const float kImpulse;
extern int pressTimes;
extern const int maxObjectNum;
extern NSTimeInterval _lastUpdateTime;
extern NSTimeInterval _dt;
extern GameState _gameState;
extern int _hitFlag;
extern iAKClock *myClock;
extern int startDay, startHour, startMinute, startSecond;
extern int score;


-(instancetype)initWithScene: (iAKMyScene*)scene{
    self=[super init];
    if (self) {
        self.scene=scene;
        self.objectID=-1;
        self.imgName=nil;
        self.velocity=CGPointMake(-300.0f,0);
        self.node=nil;
    }
    return self;
}

-(void)myaction{
    
}

-(void)setNodeLocation:(CGPoint)position{
    self.node.position = position;
}

-(void)setColorTo:(UIColor*)color{
    SKAction *changeColorAction = [SKAction colorizeWithColor:color colorBlendFactor:1 duration:0];
    [self.node runAction:changeColorAction];
}


@end
