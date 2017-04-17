//
//  iAKMyScene.m
//  Craze's Adventure
//
//  Created by Xiaonan Wang on 7/20/14.
//  Copyright (c) 2014 iAK. All rights reserved.
//

#import "iAKMyScene.h"
#import "iAKCaObjectManager.h"
#import "iAKCaObject.h"
#import "Paint.h"
#import "iAKViewController.h"


//game play- player movement

//extern
SKNode *_worldNode;
float playableStart, playableHeight;
const float kGravity = -1500.0;
const float kImpulse = 600.0;
int pressTimes = 0;
iAKSocialNetwork *sn;
//------Alina's code_gamestarttime
int startDay, startHour, startMinute, startSecond;
int score;
//------
const int maxObjectNum = 5;
NSTimeInterval _lastUpdateTime;
NSTimeInterval _dt;
GameState _gameState;
int _hitFlag;
iAKClock *myClock;


@interface iAKMyScene() <SKPhysicsContactDelegate>
@end

@implementation iAKMyScene{
    SKSpriteNode *player;
    iAKCaObjectManager *manager;
    iAKCaObject_Player *CaPlayer;
    iAKCaObject_BackGround *CaBackGround;
    iAKCaObject_FrontGround *CaFrontGround;
    NSMutableArray *CaBarrier;
    iAKCaObject_Clock *CaClock;
    iAKCaObject_Sign *CaTarget;
    iAKCaObject_Score *CaScore;
    iAKCaObject_ScoreBoard *CaScoreBoard;
    iAKCaObject_MainMenu *CaMainMenu;
    iAKCaObject_Help *CaHelp;
    iAKCaObject_ScoreBoardYourScore *yourScore;
    iAKCaObjectScoreBoardBestScore *CaBestScore;
    SKAction *jumpSoundAction;
    SKAction *crashSoundAction;
}



-(id)initWithSize:(CGSize)size state:(GameState)state{
    if (self = [super initWithSize:size]) {
        _worldNode = [SKNode node];
        [self addChild:_worldNode];
        jumpSoundAction = [SKAction playSoundFileNamed:@"jumpSound.mp3" waitForCompletion:NO];
        crashSoundAction = [SKAction playSoundFileNamed:@"crashSound.mp3" waitForCompletion:NO];
        manager = [[iAKCaObjectManager alloc]initWithScene:self];
        self.physicsWorld.gravity = CGVectorMake(0, 0);
        self.physicsWorld.contactDelegate = self;
        if (state == GameStateMainMenu) {
            [self setupMainMenu];
        }else if(state == GameStatePlay){
            [self setupPlay];
        }
    }
    return self;
}

#pragma mark - setup methods
-(void)setupPlay{
    [self setupClock];
    [self setupTarget];
    [self setupBackground];
    [self setupFrontground];
    [self setupBarrier];
    [self setupPlayer];
    [self setupScore];
    //start countDown
    [myClock startCountDown: nil second:30 minute:0 hour:0 day:0 month:0 year:0];
    startDay = myClock.getCurrentDay;
    startHour = myClock.getCurrentHour;
    startMinute = myClock.getCurrentMinute;
    startSecond = myClock.getCurrentSecond;
}

-(void)setupMainMenu{
    [self setupBackground];
    [self setupFrontground];
    [self setupBarrier];
    CaMainMenu = [manager newObjectWithID:11];
}

-(void)setupScoreBoard{
    CaScoreBoard = [manager newObjectWithID:7];
}

-(void)setupScoreBoardYourScore{
    yourScore = [manager newObjectWithID:8];
}

-(void)setupRestartButton{
    iAKCaObject_Restart *restartButton;
    restartButton = [manager newObjectWithID:10];
}

-(void)setupScoreBoardBestScore{
    CaBestScore = [manager newObjectWithID:9];
    [CaBestScore setThisNode:[self bestScore]];
}

-(void)setupScore{
    CaScore = [manager newObjectWithID:6];
}

-(void)setupClock{
    myClock=[[iAKClock alloc] init];
    CaClock=[manager newObjectWithID:4];
}

-(void)setupTarget{
    CaTarget=[manager newObjectWithID:5];
}

-(void)setupBackground{
    CaBackGround=[manager newObjectWithID:0];
    playableStart = self.size.height - CaBackGround.node.size.height;
    playableHeight = CaBackGround.node.size.height;
}

-(void)setupBarrier{
    CaBarrier=[[NSMutableArray alloc]init];
    for (int i=0; i<maxObjectNum; i++) {
        iAKCaObject_Barrier *b=[manager newObjectWithID:2];
        [b setNodeLocation:CGPointMake(self.size.width + self.size.width * 0.4 *i , playableStart+playableHeight*RandomFloatRange(0, 1))];
        [CaBarrier addObject:b];
    }
}

-(void)setupFrontground{
    CaFrontGround = [manager newObjectWithID:1];
}

-(void)setupPlayer{
    CaPlayer=[manager newObjectWithID:3];
    player = CaPlayer.node;
}


#pragma mark - gameplay section
-(void)jump{
    CaPlayer.velocity = CGPointMake(0, kImpulse);
    [self playJumpSound];
}

-(void)playJumpSound{
    [self runAction:jumpSoundAction];
}

-(void)playCrashSound{
    [self runAction:crashSoundAction];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint touchLocation = [touch locationInNode:self];
    
    switch (_gameState) {
        case GameStateMainMenu:
            if (touchLocation.x >= 175 && touchLocation.x <= 225 && touchLocation.y <= 135 && touchLocation.y >= 85) {
                [self switchToPlay];
            }else if (touchLocation.x >=345 && touchLocation.x <=395 && touchLocation.y >=85 && touchLocation.y <= 135){
                [self switchToHelp];
            }else if(touchLocation.x >= 342 && touchLocation.x <=392 && touchLocation.y>=215 && touchLocation.y<=265){
                [sn FacebookPost];
            }else if(touchLocation.x >=395 && touchLocation.x <=445 && touchLocation.y>=215 && touchLocation.y<=265){
                [sn TwitterPost];
            }
            break;
        case GameStatePause:
            break;
        case GameStateGameOver:
            break;
        case GameStatePlay:
            if (pressTimes < 2) {
                [self jump];
                pressTimes++;
            }else{
                if (player.position.y == player.size.height/2+playableStart) {
                    pressTimes = 0;
                }
            }
            break;
        case GameStateShowingScore:
            if (touchLocation.x >= 155 && touchLocation.x <= 205 && touchLocation.y <= 105 && touchLocation.y >= 55) {
                [self switchToPlay];
            }else if (touchLocation.x >= 345 && touchLocation.x <= 395 && touchLocation.y <= 105 && touchLocation.y >= 55){
                _gameState = GameStateMainMenu;
                SKScene *newScene = [[iAKMyScene alloc]initWithSize:self.size state:_gameState];
                SKTransition *transition = [SKTransition fadeWithColor:[UIColor blackColor] duration:0.5];
                [self.view presentScene:newScene transition:transition];
            }else if(touchLocation.x >= 335 && touchLocation.x <=385 && touchLocation.y>=255 && touchLocation.y<=305){
                [sn FacebookPost:yourScore.score];
            }else if(touchLocation.x >=395 && touchLocation.x <=445 && touchLocation.y>=255 && touchLocation.y<=305){
                [sn TwitterPost:yourScore.score];
            }
            break;
        case GameStateTutorial:
            if (touchLocation.x >= 505 && touchLocation.x <=555 && touchLocation.y >= 265 && touchLocation.y <= 315) {
                _gameState = GameStateMainMenu;
                SKScene *newScene = [[iAKMyScene alloc]initWithSize:self.size state:_gameState];
                SKTransition *transition = [SKTransition fadeWithColor:[UIColor blackColor] duration:0.5];
                [self.view presentScene:newScene transition:transition];
            }
            break;
    }
    
}
#pragma mark - switch to other gamestate
-(void)switchToMainMenu{
    _gameState = GameStateMainMenu;
    [self setupMainMenu];
}

-(void)switchToShowingScore{
    _gameState = GameStateShowingScore;
    [self setupScoreBoard];
    [self setupScoreBoardYourScore];
    if (yourScore.score>[self bestScore]) {
        [self setBestScore:yourScore.score];
    }
    [self setupScoreBoardBestScore];
    [self setupRestartButton];
}

-(void)switchToPlay{
    _gameState = GameStatePlay;
    SKScene *newScene = [[iAKMyScene alloc]initWithSize:self.size state:GameStatePlay];
    SKTransition *transition = [SKTransition fadeWithColor:[UIColor blackColor] duration:0.5];
    [self.view presentScene:newScene transition:transition];
}

-(void)switchToHelp{
    _gameState = GameStateTutorial;
    CaHelp=[manager newObjectWithID:12];
    [CaHelp setup];
}

#pragma mark - update section

- (int)bestScore {
    return (int)[[NSUserDefaults standardUserDefaults] integerForKey:@"BestScore"];
}

- (void)setBestScore:(int)bestScore {
    [[NSUserDefaults standardUserDefaults] setInteger:bestScore forKey:@"BestScore"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

-(void)updatePlayer{
    [CaPlayer myaction];
}

-(void)updateFrontground{
    [CaFrontGround myaction];
}

-(void)updateBarrier{
    for (iAKCaObject_Barrier *b in CaBarrier) {
        [b myaction];
    }
}

-(void)updateBackground{
    [CaBackGround myaction];
}

-(void)updateClock{
    [CaClock myaction];
    if (myClock.min==0 && myClock.sec==0) {
        [self switchToShowingScore];
    }
}

-(void)updateScore{
    [CaScore myaction];
}

-(void)updateTarget{
    if (CaTarget.color == CaPlayer.color) {
        [CaTarget myaction];
        [myClock addCountDownMinute:nil minute:0 second:3];
    }
}

-(void)update:(CFTimeInterval)currentTime {
    if (_lastUpdateTime) {
        _dt = currentTime - _lastUpdateTime;
    }else{
        _dt = 0;
    }
    _lastUpdateTime = currentTime;
    
    switch (_gameState) {
        case GameStateMainMenu:
            [self updatePlayer];
            [self updateFrontground];
            [self updateBarrier];
            [self updateBackground];
            break;
        case GameStatePause:
            break;
        case GameStateGameOver:
            break;
        case GameStatePlay:
            [self updatePlayer];
            [self updateFrontground];
            [self updateBarrier];
            [self updateBackground];
            [self hitEffect];
            [self updateTarget];
            [self updateClock];
            [self updateScore];
            break;
        case GameStateShowingScore:
            break;
        case GameStateTutorial:
            break;
    }
}

#pragma mark -Collision Detection


-(void)hitEffect{
    if (_hitFlag==hitBarrier) {
        _hitFlag = noHit;
        CaPlayer.velocity = CGPointZero;
    }else if(_hitFlag==onBarrier){
        _hitFlag = noHit;
        CaPlayer.velocity = CGPointZero;
    }
    switch (CaPlayer.color) {
        case white:
            [CaPlayer setColorTo:[UIColor whiteColor]];
            break;
        case red:
            [CaPlayer setColorTo:[UIColor redColor]];
            break;
        case yellow:
            [CaPlayer setColorTo:[UIColor yellowColor]];
            break;
        case blue:
            [CaPlayer setColorTo:[UIColor blueColor]];
            break;
        case orange:
            [CaPlayer setColorTo:[UIColor orangeColor]];
            break;
        case purple:
            [CaPlayer setColorTo:[UIColor purpleColor]];
            break;
        case green:
            [CaPlayer setColorTo:[UIColor greenColor]];
            break;
        case black:
            [CaPlayer setColorTo:[UIColor blackColor]];
        default:
            break;
    }
}

-(void)didBeginContact:(SKPhysicsContact *)contact
{
    [self playCrashSound];
    SKPhysicsBody *other = (contact.bodyA.categoryBitMask == EntityCategoryPlayer? contact.bodyB : contact.bodyA);
    SKNode *otherNode = (contact.bodyA.categoryBitMask == EntityCategoryPlayer? contact.bodyB.node : contact.bodyA.node);
    
    if ((other.categoryBitMask & (EntityCategoryBarrier_white | EntityCategoryBarrier_red | EntityCategoryBarrier_yellow | EntityCategoryBarrier_blue)) > 0 ) {
        NSLog(@"%f",otherNode.position.y+otherNode.frame.size.height);
        NSLog(@"%f",player.position.y-player.frame.size.height/2);
        if ((player.position.y-player.frame.size.height/2+5)>=(otherNode.position.y+otherNode.frame.size.height)) {
            _hitFlag = onBarrier;
        }else{
            _hitFlag = hitBarrier;
        }
        //white gets other color, other color + or -
        if (CaPlayer.color == white) {
            CaPlayer.color = other.categoryBitMask;
        }else if(CaPlayer.color == other.categoryBitMask){
            CaPlayer.color = white;
        }else if(other.categoryBitMask == white){
            CaPlayer.color = white;
        }else{
            CaPlayer.color ^= other.categoryBitMask;
        }
        
        return;
    }
}

@end
