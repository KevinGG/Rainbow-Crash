//
//  iAKCaObjectManager.h
//  Craze's Adventure
//
//  Created by KangNing on 7/23/14.
//  Copyright (c) 2014 iAK. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "iAKMyScene.h"
#import "iAKCaObject_Player.h"
#import "iAKCaObject_BackGround.h"
#import "iAKCaObject_FrontGround.h"
#import "iAKCaObject_Barrier.h"
#import "iAKCaObject_Clock.h"
#import "iAKCaObject_Sign.h"
#import "iAKCaObject_Score.h"
#import "iAKCaObject_ScoreBoard.h"
#import "iAKCaObject_ScoreBoardYourScore.h"
#import "iAKCaObjectScoreBoardBestScore.h"
#import "iakcaobject_Restart.h"
#import "iAKCaObject_MainMenu.h"
#import "iAKCaObject_Help.h"
@interface iAKCaObjectManager:NSObject



-(instancetype)initWithScene:(iAKMyScene*)scene;
-(id)newObjectWithID:(NSInteger)i;

@end
