//
//  iAKCaObject_Player.m
//  Craze's Adventure
//
//  Created by KangNing on 7/23/14.
//  Copyright (c) 2014 iAK. All rights reserved.
//

#import "iAKCaObject_Player.h"

@interface iAKCaObject_Player()
@end

@implementation iAKCaObject_Player



-(instancetype)initWithScene:(iAKMyScene*)scene{
    self = [super initWithScene:scene];
    if (self) {
        self.objectID=3;
        self.imgName=@"player.png";
        self.velocity=CGPointMake(0, 0);
        self.color = white;
        self.node = [SKSpriteNode spriteNodeWithImageNamed:self.imgName];
        [self setNodeLocation];
        [self setNodePhysicsBody];
    }
    return self;
}


-(void)setNodeLocation{
    self.node.anchorPoint = CGPointMake(0.5, 0.5);
    self.node.position = CGPointMake(self.scene.size.width*0.2, playableStart+self.node.size.height/2);
    self.node.zPosition = LayerPlayer;
    [_worldNode addChild:self.node];
    }

-(void)setNodePhysicsBody{
    CGFloat offsetX = self.node.frame.size.width * self.node.anchorPoint.x;
    CGFloat offsetY = self.node.frame.size.height * self.node.anchorPoint.y;
    
    CGMutablePathRef path = CGPathCreateMutable();
    
    CGPathMoveToPoint(path, NULL, 0 - offsetX, 0 - offsetY);
    CGPathAddLineToPoint(path, NULL, 0 - offsetX, 50 - offsetY);
    CGPathAddLineToPoint(path, NULL, 25 - offsetX, 50 - offsetY);
    CGPathAddLineToPoint(path, NULL, 25 - offsetX, 0 - offsetY);
    
    CGPathCloseSubpath(path);
    
    self.node.physicsBody = [SKPhysicsBody bodyWithPolygonFromPath:path];
    //[self.node skt_attachDebugFrameFromPath:path color:[SKColor blackColor]];
    
    self.node.physicsBody.categoryBitMask = EntityCategoryPlayer;
    self.node.physicsBody.collisionBitMask = 0;
    self.node.physicsBody.contactTestBitMask = (EntityCategoryBarrier_white | EntityCategoryBarrier_red | EntityCategoryBarrier_yellow | EntityCategoryBarrier_blue);
}


-(void)myaction{
    //Apply Gravity
    CGPoint gravity = CGPointMake(0, kGravity);
    CGPoint gravityStep = CGPointMultiplyScalar(gravity, _dt);
    self.velocity = CGPointAdd(self.velocity, gravityStep);
    
    CGPoint velocityStep = CGPointMultiplyScalar(self.velocity, _dt);
    self.node.position = CGPointAdd(self.node.position, velocityStep);
    
    //stop falling if hit the ground
    if (self.node.position.y <= playableStart + self.node.size.height/2) {
        self.node.position = CGPointMake(self.node.position.x, playableStart + self.node.size.height/2);
        pressTimes = 0;
    }

}

@end
