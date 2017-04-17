//
//  iAKViewController.m
//  Craze's Adventure
//
//  Created by Xiaonan Wang on 7/20/14.
//  Copyright (c) 2014 iAK. All rights reserved.
//

#import "iAKViewController.h"
#import "iAKMyScene.h"

@import AVFoundation;
@interface iAKViewController()

@property (nonatomic) AVAudioPlayer *backgroundMusicPlayer;

@end

@implementation iAKViewController
iAKSocialNetwork *sn;

- (void)loadView{
    [super loadView];
    self.view = [[SKView alloc]initWithFrame:self.view.bounds];
}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    
    sn = [[iAKSocialNetwork alloc]initWithUIViewController:self];
    //background music
    NSError *error;
    NSURL * backgroundMusicURL = [[NSBundle mainBundle] URLForResource:@"backgroundMusic" withExtension:@"mp3"];
    self.backgroundMusicPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:backgroundMusicURL error:&error];
    self.backgroundMusicPlayer.numberOfLoops = -1;
    [self.backgroundMusicPlayer prepareToPlay];
    [self.backgroundMusicPlayer play];
    
    SKView *gameView = (SKView *)self.view;
    
    // Configure the view.
    gameView.showsFPS = NO;
    gameView.showsNodeCount = NO;
    
    // Create and configure the scene.
    SKScene * scene = [[iAKMyScene alloc]initWithSize:CGSizeMake(569, 320) state:GameStateMainMenu];
    [gameView presentScene:scene];
}

- (BOOL)shouldAutorotate
{
    return YES;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return UIInterfaceOrientationMaskAllButUpsideDown;
    } else {
        return UIInterfaceOrientationMaskAll;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(BOOL)prefersStatusBarHidden
{
    return YES;
}

@end
