//
//  iAKCaObject.h
//  Craze's Adventure
//
//  Created by KangNing on 7/24/14.
//  Copyright (c) 2014 iAK. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "iAKMyScene.h"
#import "Paint.h"

@interface iAKCaObject : NSObject

@property NSInteger objectID;
@property (strong,nonatomic) NSString *imgName;
@property CGPoint velocity;
@property (strong,nonatomic) SKSpriteNode* node;
@property iAKMyScene* scene;

-(instancetype)initWithScene: (iAKMyScene*)scene;

//how the object act/updates
-(void)myaction;

//manually set the node's location
-(void)setNodeLocation:(CGPoint)position;

//manually set the node's color
-(void)setColorTo:(UIColor*)color;
@end
