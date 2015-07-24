//
//  iAKCaObject_BackGround.m
//  Craze's Adventure
//
//  Created by KangNing on 7/23/14.
//  Copyright (c) 2014 iAK. All rights reserved.
//

#import "iAKCaObject_BackGround.h"

@interface iAKCaObject_BackGround()
@end

@implementation iAKCaObject_BackGround

-(instancetype)initWithScene:(iAKMyScene*)scene{
    self = [super initWithScene:scene];
    
    if (self) {
        self.objectID=0;
        self.imgName=@"background.png";
        self.velocity=CGPointMake(-30.0f, 0);
        self.node = [SKSpriteNode spriteNodeWithImageNamed:self.imgName];
        [self setNodeLocation];
        [self setNodePhysicsBody];
    }
    
    return self;
}


-(void)setNodeLocation{
    SKSpriteNode *background;
    for (int i = 0; i < 3; i++) {
        background = [SKSpriteNode spriteNodeWithImageNamed:self.imgName];
        background.anchorPoint = CGPointMake(0, 1);
        background.position = CGPointMake(i * background.size.width,self.scene.size.height);
        background.zPosition = LayerBackground;
        background.name = @"Background";
        [_worldNode addChild:background];
    }
}

-(void)setNodePhysicsBody{

}


-(void)myaction{
    [_worldNode enumerateChildNodesWithName:@"Background" usingBlock:^(SKNode *node, BOOL *stop) {
        SKSpriteNode *background = (SKSpriteNode *)node;
        CGPoint moveAmt = CGPointMake(self.velocity.x * _dt, 0);
        background.position = CGPointAdd(background.position, moveAmt);
        
        if (background.position.x < -background.size.width) {
            background.position = CGPointAdd(background.position, CGPointMake(background.size.width*3, 0));
        }
    }];
}

@end
