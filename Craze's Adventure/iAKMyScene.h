//
//  iAKMyScene.h
//  Craze's Adventure
//

//  Copyright (c) 2014 iAK. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "iAKClock.h"

typedef NS_ENUM(int, GameState)
{
    GameStateMainMenu,
    GameStateTutorial,
    GameStatePlay,
    GameStatePause,
    GameStateShowingScore,
    GameStateGameOver
};

typedef NS_ENUM(int, Layer) {
    LayerBackground,
    LayerBarrier,
    LayerFrontground,
    LayerPlayer,
    LayerScore,
    LayerClock,
    LayerScoreBoard,
    LayerScoreBoardYourScore
};

typedef NS_OPTIONS(int, EntityCategory) {
    EntityCategoryBarrier_white = 1 << 0,
    EntityCategoryBarrier_red = 1 << 1,
    EntityCategoryBarrier_yellow = 1 << 2,
    EntityCategoryBarrier_blue = 1 << 3,
    EntityCategoryBarrier_orange = (1 << 1) + (1 << 2),
    EntityCategoryBarrier_purple = (1 << 1) + (1 << 3),
    EntityCategoryBarrier_green = (1 << 2) + (1 << 3),
    EntityCategoryBarrier_black = (1 << 1) + (1 << 2) + (1 << 3),
    
    EntityCategoryPlayer = 1<<8
};

typedef NS_ENUM(int, hitFlag) {
    noHit,
    onBarrier,//on top of barrier
    hitBarrier//left or bottom of barrier
};

typedef NS_OPTIONS(int, colorCategory) {
    white = 1<<0,
    red = 1<<1,
    yellow = 1<<2,
    blue = 1<<3,
    orange = (1 << 1) + (1 << 2),
    purple = (1 << 1) + (1 << 3),
    green = (1 << 2) + (1 << 3),
    black = (1 << 1) + (1 << 2) + (1 << 3)
};

@interface iAKMyScene : SKScene

-(id)initWithSize:(CGSize)size state:(GameState)state;

@end

extern SKNode *_worldNode;
extern float playableStart,playableHeight;
extern const float kGravity;
extern const float kImpulse;
extern int pressTimes;
extern const int maxObjectNum;
extern NSTimeInterval _lastUpdateTime;
extern NSTimeInterval _dt;
extern GameState _gameState;
extern int _hitFlag;
extern iAKClock *myClock;
extern int startDay, startHour, startMinute, startSecond;
extern int score;








