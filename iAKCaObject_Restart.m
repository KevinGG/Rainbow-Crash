//
//  iAKCaObject_Restart.m
//  Craze's Adventure
//
//  Created by Xiaonan Wang on 7/25/14.
//  Copyright (c) 2014 iAK. All rights reserved.
//

#import "iAKCaObject_Restart.h"

@implementation iAKCaObject_Restart

-(instancetype)initWithScene:(iAKMyScene*)scene{
    self = [super initWithScene:scene];
    if (self) {
        self.objectID=10;
        self.imgName=nil;
        self.velocity=CGPointMake(0, 0);
        self.node = nil;
        self.restart = [SKSpriteNode spriteNodeWithImageNamed:@"restart.png"];
        self.homeButton = [SKSpriteNode spriteNodeWithImageNamed:@"homebutton.png"];
        [self setNodeRestartLocation];
        [self setNodeHomeButtonLocation];
    }
    return self;
}


-(void)setNodeRestartLocation{
    [_worldNode addChild:self.restart];
    self.restart.zPosition=LayerScoreBoard;
    self.restart.anchorPoint = CGPointMake(0.5, 0.5);
    self.restart.position=CGPointMake(180,80);
}

-(void)setNodeHomeButtonLocation{
    [_worldNode addChild:self.homeButton];
    self.homeButton.zPosition=LayerScoreBoard;
    self.homeButton.anchorPoint = CGPointMake(0.5, 0.5);
    self.homeButton.position=CGPointMake(370,80);
}


-(void)myaction{
}


@end
