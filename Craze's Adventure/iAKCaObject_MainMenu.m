//
//  iAKCaObject_MainMenu.m
//  Craze's Adventure
//
//  Created by Xiaonan Wang on 7/25/14.
//  Copyright (c) 2014 iAK. All rights reserved.
//

#import "iAKCaObject_MainMenu.h"

@implementation iAKCaObject_MainMenu

-(instancetype)initWithScene:(iAKMyScene*)scene{
    self = [super initWithScene:scene];
    if (self) {
        self.objectID=11;
        self.imgName=@"mainmenu.png";
        self.velocity=CGPointMake(0, 0);
        self.node = nil;
        self.mainMenu = [SKSpriteNode spriteNodeWithImageNamed:@"mainmenu.png"];
        self.startButton = [SKSpriteNode spriteNodeWithImageNamed:@"start.png"];
        self.helpButton = [SKSpriteNode spriteNodeWithImageNamed:@"help.png"];
        self.facebookButton = [SKSpriteNode spriteNodeWithImageNamed:@"facebook.png"];
        self.twitterButton = [SKSpriteNode spriteNodeWithImageNamed:@"twitter.png"];
        
        [self setNodeMainMenuLocation];
        [self setNodeStartButtonLocation];
        [self setNodeHelpButtonLocation];
        [self setNodeFacebookLocation];
        [self setNodeTwitterLocation];
    }
    return self;
}

-(void)setNodeHelpButtonLocation{
    [_worldNode addChild:self.helpButton];
    self.helpButton.zPosition = LayerScoreBoardYourScore;
    self.helpButton.anchorPoint = CGPointMake(0.5, 0.5);
    self.helpButton.position = CGPointMake(370, 110);
}

-(void)setNodeStartButtonLocation{
    [_worldNode addChild:self.startButton];
    self.startButton.zPosition = LayerScoreBoardYourScore;
    self.startButton.anchorPoint = CGPointMake(0.5, 0.5);
    self.startButton.position = CGPointMake(200, 110);
}
-(void)setNodeMainMenuLocation{
    [_worldNode addChild:self.mainMenu];
    self.mainMenu.zPosition=LayerScoreBoard;
    self.mainMenu.anchorPoint = CGPointMake(0.5, 0.5);
    self.mainMenu.position=CGPointMake(285,160);
}

-(void)setNodeFacebookLocation{
    [_worldNode addChild:self.facebookButton];
    self.facebookButton.zPosition = LayerScoreBoardYourScore;
    self.facebookButton.anchorPoint = CGPointMake(0.5, 0.5);
    self.facebookButton.position = CGPointMake(367, 240);
}
-(void)setNodeTwitterLocation{
    [_worldNode addChild:self.twitterButton];
    self.twitterButton.zPosition=LayerScoreBoard;
    self.twitterButton.anchorPoint = CGPointMake(0.5, 0.5);
    self.twitterButton.position=CGPointMake(420,240);
}

@end
