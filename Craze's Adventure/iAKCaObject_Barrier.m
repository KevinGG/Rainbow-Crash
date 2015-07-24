//
//  iAKCaObject_Barrier.m
//  Craze's Adventure
//
//  Created by KangNing on 7/24/14.
//  Copyright (c) 2014 iAK. All rights reserved.
//

#import "iAKCaObject_Barrier.h"

@implementation iAKCaObject_Barrier

-(instancetype)initWithScene:(iAKMyScene*)scene{
    self = [super initWithScene:scene];
    if (self) {
        self.objectID=2;
        self.imgName=@"barrier.png";
        self.velocity=CGPointMake(-300.0f, 0);
        self.node = [SKSpriteNode spriteNodeWithImageNamed:self.imgName];
        [self setNodeLocation];
        [self setNodePhysicsBody];
    }
    
    return self;
}


-(void)setNodeLocation{
    self.node.anchorPoint = CGPointMake(0, 0);
    self.node.position = CGPointMake(self.scene.size.width + self.scene.size.width * 0.4 , playableStart+playableHeight*RandomFloatRange(0, 1));
    self.node.zPosition = LayerBarrier;
    self.node.name = @"Barrier";
    int colorIndex=arc4random()%4;
    self.color = (1<<colorIndex);
    switch (self.color) {
        case white:
            [self setColorTo:[UIColor whiteColor]];
            break;
        case red:
            [self setColorTo:[UIColor redColor]];
            break;
        case yellow:
            [self setColorTo:[UIColor yellowColor]];
            break;
        case blue:
            [self setColorTo:[UIColor blueColor]];
            break;
        default:
            break;
    }
    [_worldNode addChild:self.node];
}

-(void)setNodePhysicsBody{
    CGFloat offsetX = self.node.frame.size.width * self.node.anchorPoint.x;
    CGFloat offsetY = self.node.frame.size.height * self.node.anchorPoint.y;
    
    CGMutablePathRef path = CGPathCreateMutable();
    
    CGPathMoveToPoint(path, NULL, 0 - offsetX, 0 - offsetY);
    CGPathAddLineToPoint(path, NULL, 0 - offsetX, 40 - offsetY);
    CGPathAddLineToPoint(path, NULL, 40 - offsetX, 40 - offsetY);
    CGPathAddLineToPoint(path, NULL, 40 - offsetX, 0 - offsetY);
    
    CGPathCloseSubpath(path);
    
    self.node.physicsBody = [SKPhysicsBody bodyWithPolygonFromPath:path];
    
    //[self.node skt_attachDebugFrameFromPath:path color:[SKColor blackColor]];
    
    self.node.physicsBody.categoryBitMask = self.color;
    //self.node.physicsBody.collisionBitMask = 0;
    self.node.physicsBody.contactTestBitMask = EntityCategoryPlayer;
}


-(void)myaction{
        CGPoint moveAmt = CGPointMake(self.velocity.x * _dt, 0);
        self.node.position = CGPointAdd(self.node.position, moveAmt);
        
        if (self.node.position.x < -self.node.size.width) {
            self.node.position = CGPointAdd(self.node.position, CGPointMake(self.scene.size.width * 1.2 - self.node.size.width, -self.node.position.y+playableStart+playableHeight*RandomFloatRange(0, 1)-self.node.size.height));
            int colorIndex=arc4random()%4;
            self.color = (1<<colorIndex);
            self.node.physicsBody.categoryBitMask = self.color;
            switch (self.color) {
                case white:
                    [self setColorTo:[UIColor whiteColor]];
                    break;
                case red:
                    [self setColorTo:[UIColor redColor]];
                    break;
                case yellow:
                    [self setColorTo:[UIColor yellowColor]];
                    break;
                case blue:
                    [self setColorTo:[UIColor blueColor]];
                    break;
                default:
                    break;
            }
            
        }
}

@end
