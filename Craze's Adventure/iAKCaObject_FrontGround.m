//
//  iAKCaObject_FrontGround.m
//  Craze's Adventure
//
//  Created by KangNing on 7/24/14.
//  Copyright (c) 2014 iAK. All rights reserved.
//

#import "iAKCaObject_FrontGround.h"

@implementation iAKCaObject_FrontGround

-(instancetype)initWithScene:(iAKMyScene*)scene{
    self = [super initWithScene:scene];
    if (self) {
        self.objectID=1;
        self.imgName=@"frontground.png";
        self.velocity=CGPointMake(-150.0f, 0);
        self.node = [SKSpriteNode spriteNodeWithImageNamed:self.imgName];
        [self setNodeLocation];
        [self setNodePhysicsBody];
    }
    return self;
}


-(void)setNodeLocation{
    for (int i = 0; i < 2; i++) {
        SKSpriteNode *frontground = [SKSpriteNode spriteNodeWithImageNamed:@"frontground.png"];
        frontground.anchorPoint = CGPointMake(0, 1);
        frontground.position = CGPointMake(self.scene.size.width * i * 2, playableStart);
        frontground.zPosition = LayerFrontground;
        frontground.name = @"Frontground";
        [_worldNode addChild:frontground];
    }
}

-(void)setNodePhysicsBody{
    
}


-(void)myaction{
    [_worldNode enumerateChildNodesWithName:@"Frontground" usingBlock:^(SKNode *node, BOOL *stop) {
        SKSpriteNode *frontground = (SKSpriteNode *)node;
        CGPoint moveAmt = CGPointMake(self.velocity.x * _dt, 0);
        frontground.position = CGPointAdd(frontground.position, moveAmt);
        
        if (frontground.position.x < -frontground.size.width) {
            frontground.position = CGPointAdd(frontground.position, CGPointMake(frontground.size.width*2, 0));
        }
    }];
}

@end
