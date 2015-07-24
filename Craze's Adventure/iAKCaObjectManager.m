//
//  iAKCaObjectManager.m
//  Craze's Adventure
//
//  Created by KangNing on 7/23/14.
//  Copyright (c) 2014 iAK. All rights reserved.
//

#import "iAKCaObjectManager.h"


@interface iAKCaObjectManager()

@property iAKMyScene* scene;

@end

@implementation iAKCaObjectManager


-(instancetype)initWithScene:(iAKMyScene*)scene{
    self = [super init];
    if(self){
        self.scene=scene;
    }
    return self;
}

-(id)newObjectWithID:(NSInteger)i{
    switch (i) {
        case 0://background.png
            return [[iAKCaObject_BackGround alloc]initWithScene:self.scene ];
            break;
        case 1://frontground.png
            return [[iAKCaObject_FrontGround alloc]initWithScene:self.scene];
            break;
        case 2://barrier.png
            return [[iAKCaObject_Barrier alloc]initWithScene:self.scene];
            break;
        case 3://player.png
            return [[iAKCaObject_Player alloc]initWithScene:self.scene ];
            break;
        case 4://clock view
            return [[iAKCaObject_Clock alloc]initWithScene:self.scene];
            break;
        case 5://target view
            return [[iAKCaObject_Sign alloc]initWithScene:self.scene];
            break;
        case 6://score view
            return [[iAKCaObject_Score alloc]initWithScene:self.scene];
            break;
        case 7:
            return [[iAKCaObject_ScoreBoard alloc]initWithScene:self.scene];
            break;
        case 8:
            return [[iAKCaObject_ScoreBoardYourScore alloc]initWithScene:self.scene];
            break;
        case 9:
            return [[iAKCaObjectScoreBoardBestScore alloc]initWithScene:self.scene];
            break;
        case 10:
            return [[iAKCaObject_Restart alloc]initWithScene:self.scene];
            break;
        case 11:
            return [[iAKCaObject_MainMenu alloc] initWithScene:self.scene];
            break;
        case 12:
            return [[iAKCaObject_Help alloc] initWithScene:self.scene];
            break;
        default:
            return nil;
            break;
    }
}

@end
