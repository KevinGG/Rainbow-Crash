//
//  iAKCaObject_Sign.m
//  Craze's Adventure
//
//  Created by KangNing on 7/24/14.
//  Copyright (c) 2014 iAK. All rights reserved.
//

#import "iAKCaObject_Sign.h"

@implementation iAKCaObject_Sign
-(instancetype)initWithScene: (iAKMyScene*)scene{
    self=[super init];
    if (self) {
        self.scene=scene;
        self.objectID=5;
        self.imgName=nil;
        self.velocity=CGPointMake(0,0);
        [self setNodeLocation];
    }
    
    return self;
}

 -(void)setNodeLocation{
     self.color=arc4random()%8;
     switch (self.color) {
         case 0:
             self.color = white;
             self.node = [SKSpriteNode spriteNodeWithColor:[UIColor whiteColor] size:CGSizeMake(25, 25)] ;
             break;
         case 1:
             self.color = red;
             self.node = [SKSpriteNode spriteNodeWithColor:[UIColor redColor] size:CGSizeMake(25, 25)];
             break;
         case 2:
             self.color = yellow;
             self.node = [SKSpriteNode spriteNodeWithColor:[UIColor yellowColor] size:CGSizeMake(25, 25)] ;
             break;
         case 3:
             self.color = orange;
             self.node = [SKSpriteNode spriteNodeWithColor:[UIColor orangeColor] size:CGSizeMake(25, 25)] ;
             break;
         case 4:
             self.color = blue;
             self.node = [SKSpriteNode spriteNodeWithColor:[UIColor blueColor] size:CGSizeMake(25, 25)] ;
             break;
         case 5:
             self.color = purple;
             self.node = [SKSpriteNode spriteNodeWithColor:[UIColor purpleColor] size:CGSizeMake(25, 25)] ;
             break;
         case 6:
             self.color = green;
             self.node = [SKSpriteNode spriteNodeWithColor:[UIColor greenColor] size:CGSizeMake(25, 25)] ;
             break;
         case 7:
             self.color = black;
             self.node = [SKSpriteNode spriteNodeWithColor:[UIColor blackColor] size:CGSizeMake(25, 25)] ;
             break;
         default:
             break;
     }
     self.node.zPosition=LayerClock;
     self.node.position=CGPointMake(20, self.scene.size.height-self.node.frame.size.height+8);
     [_worldNode addChild:self.node];
 }
 
 -(void)setNodePhysicsBody{
     
 }
 
 
 -(void)myaction{
     self.color=arc4random()%8;
     switch (self.color) {
         case 0:
             self.color = white;
             self.node.color = [UIColor whiteColor];
             break;
         case 1:
             self.color = red;
             self.node.color = [UIColor redColor];
             break;
         case 2:
             self.color = yellow;
             self.node.color = [UIColor yellowColor];
             break;
         case 3:
             self.color = orange;
             self.node.color = [UIColor orangeColor];
             break;
         case 4:
             self.color = blue;
             self.node.color = [UIColor blueColor];
             break;
         case 5:
             self.color = purple;
             self.node.color = [UIColor purpleColor];
             break;
         case 6:
             self.color = green;
             self.node.color = [UIColor greenColor];
             break;
         case 7:
             self.color = black;
             self.node.color = [UIColor blackColor];
             break;
         default:
             break;
     }

 }


@end
