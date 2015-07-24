//
//  iAKCaObject_Clock.m
//  Craze's Adventure
//
//  Created by KangNing on 7/24/14.
//  Copyright (c) 2014 iAK. All rights reserved.
//

#import "iAKCaObject_Clock.h"

@implementation iAKCaObject_Clock

-(instancetype)initWithScene:(iAKMyScene*)scene{
    self = [super initWithScene:scene];
    if (self) {
        self.objectID=5;
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
    self.labelNode.zPosition=LayerClock;
    self.labelNode.position=CGPointMake(80, self.scene.size.height-self.labelNode.frame.size.height-30);
}

-(void)setNodePhysicsBody{
    
}


-(void)myaction{
    NSString *minute = [NSString stringWithFormat:@"%02d", (int)myClock.min];
    NSString *second = [NSString stringWithFormat:@"%02d", (int)myClock.sec];
    self.labelNode.text = [[minute stringByAppendingString:@":"]stringByAppendingString:second];
    self.labelNode.fontName = @"AmericanTypewriter-bold";
    self.labelNode.fontSize = 30;
    self.labelNode.fontColor = [UIColor colorWithRed:234/255.0 green:104/255.0 blue:162/255.0 alpha:1];
}



@end
