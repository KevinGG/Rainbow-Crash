//
//  iAKCaObjectScoreBoardBestScore.m
//  Craze's Adventure
//
//  Created by Xiaonan Wang on 7/25/14.
//  Copyright (c) 2014 iAK. All rights reserved.
//

#import "iAKCaObjectScoreBoardBestScore.h"
@implementation iAKCaObjectScoreBoardBestScore


-(instancetype)initWithScene:(iAKMyScene*)scene{
    self = [super initWithScene:scene];
    if (self) {
        self.objectID=9;
        self.imgName=nil;
        self.velocity=CGPointMake(0, 0);
        self.node= nil;
        self.labelNode=[SKLabelNode labelNodeWithFontNamed:@"AmericanTypewriter-bold"];
    }
    return self;
}

-(void)setThisNode:(int)score{
    self.labelNode.text = [NSString stringWithFormat:@"%05d",score];
    self.labelNode.fontSize = 30;
    self.labelNode.fontColor = [UIColor colorWithRed:243/255.0 green:151/255.0 blue:0/255.0 alpha:1];
    [_worldNode addChild:self.labelNode];
    self.labelNode.zPosition=LayerScoreBoardYourScore;
    self.labelNode.position=CGPointMake(365, 120);
}

-(void)setNodeLocation{
    
}

-(void)setNodePhysicsBody{
    
}


-(void)myaction{
    
}


@end
