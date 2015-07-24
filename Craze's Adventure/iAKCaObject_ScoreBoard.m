//
//  iAKCaObject_ScoreBoard.m
//  Craze's Adventure
//
//  Created by Xiaonan Wang on 7/25/14.
//  Copyright (c) 2014 iAK. All rights reserved.
//

#import "iAKCaObject_ScoreBoard.h"

@implementation iAKCaObject_ScoreBoard

-(instancetype)initWithScene:(iAKMyScene*)scene{
    self = [super initWithScene:scene];
    if (self) {
        self.objectID=7;
        self.imgName=nil;
        self.velocity=CGPointMake(0, 0);
        self.node = nil;
        self.scoreBoard = [SKSpriteNode spriteNodeWithImageNamed:@"ScoreBoard.png"];
        self.facebookButton = [SKSpriteNode spriteNodeWithImageNamed:@"facebook.png"];
        self.twitterButton = [SKSpriteNode spriteNodeWithImageNamed:@"twitter.png"];
        [self setNodeLocation];
        [self setNodePhysicsBody];
        [self setNodeFacebookLocation];
        [self setNodeTwitterLocation];
    }
    return self;
}


-(void)setNodeLocation{
    [_worldNode addChild:self.scoreBoard];
    self.scoreBoard.zPosition=LayerScoreBoard;
    self.scoreBoard.anchorPoint = CGPointMake(0.5, 0.5);
    self.scoreBoard.position=CGPointMake(285,160);
}

-(void)setNodeFacebookLocation{
    [_worldNode addChild:self.facebookButton];
    self.facebookButton.zPosition = LayerScoreBoardYourScore;
    self.facebookButton.anchorPoint = CGPointMake(0.5, 0.5);
    self.facebookButton.position = CGPointMake(360, 280);
}
-(void)setNodeTwitterLocation{
    [_worldNode addChild:self.twitterButton];
    self.twitterButton.zPosition=LayerScoreBoard;
    self.twitterButton.anchorPoint = CGPointMake(0.5, 0.5);
    self.twitterButton.position=CGPointMake(420,280);
}

-(void)setNodePhysicsBody{
    
}


-(void)myaction{
}


@end
