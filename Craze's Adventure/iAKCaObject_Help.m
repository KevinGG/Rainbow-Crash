//
//  iAKCaObject_Help.m
//  Color Crash
//
//  Created by KangNing on 7/26/14.
//  Copyright (c) 2014 iAK. All rights reserved.
//

#import "iAKCaObject_Help.h"

@implementation iAKCaObject_Help

-(instancetype)initWithScene:(iAKMyScene*)scene{
    self = [super initWithScene:scene];
    if (self) {
        self.objectID=12;
        self.imgName=@"ColorComp.png";
        self.velocity=CGPointMake(0, 0);
        self.node = nil;
        self.helpPage1 = [SKSpriteNode spriteNodeWithImageNamed:@"ColorComp.png"];
        self.helpPage2 = [SKSpriteNode spriteNodeWithImageNamed:@"formular.png"];
        self.helpPage3 = [SKSpriteNode spriteNodeWithImageNamed:@"jump.png"];
        self.helpPage4 = [SKSpriteNode spriteNodeWithImageNamed:@"indication.png"];


        self.homeButton = [SKSpriteNode spriteNodeWithImageNamed:@"homebutton.png"];
        self.next = [SKSpriteNode spriteNodeWithImageNamed:@"next.png"];
        self.previous = [SKSpriteNode spriteNodeWithImageNamed:@"previous"];
    }
    return self;
}


-(void)setup{
    SKScene *newScene = [[iAKMyScene alloc]initWithSize:CGSizeMake(569, 320)];
    SKTransition *transition = [SKTransition fadeWithColor:[UIColor whiteColor] duration:0.5];
    [self.scene.view presentScene:newScene transition:transition];
    newScene.backgroundColor=[UIColor colorWithRed:0.99 green:0.97 blue:0.69 alpha:1];
    self.world = [SKNode node];
    [newScene addChild:self.world];
    [self setNodeHelpPageLocation];
    [self setNodeHomeButtonLocation];

}

-(void)setNodeHelpPageLocation{
    [self.world  addChild:self.helpPage1];
    self.helpPage1.zPosition=LayerScoreBoard;
    self.helpPage1.anchorPoint = CGPointMake(0.5, 0.5);
    self.helpPage1.position=CGPointMake(80,240);
    self.helpPage1.size=CGSizeMake(160,160);
    [self.world  addChild:self.helpPage2];
    self.helpPage2.zPosition=LayerScoreBoard;
    self.helpPage2.anchorPoint = CGPointMake(0.5, 0.5);
    self.helpPage2.position=CGPointMake(200,88);
    self.helpPage2.size=CGSizeMake(320,160);
    [self.world  addChild:self.helpPage3];
    self.helpPage3.zPosition=LayerScoreBoard;
    self.helpPage3.anchorPoint = CGPointMake(0.5, 0.5);
    self.helpPage3.position=CGPointMake(450,160);
    self.helpPage3.size=CGSizeMake(180,180);
    [self.world  addChild:self.helpPage4];
    self.helpPage4.zPosition=LayerScoreBoard;
    self.helpPage4.anchorPoint = CGPointMake(0.5, 0.5);
    self.helpPage4.position=CGPointMake(300,240);
    self.helpPage4.size=CGSizeMake(100,100);

}

-(void)setNodeHomeButtonLocation{
    [self.world addChild:self.homeButton];
    self.homeButton.zPosition=LayerScoreBoard;
    self.homeButton.anchorPoint = CGPointMake(0.5, 0.5);
    self.homeButton.position=CGPointMake(530,290);
}


@end
