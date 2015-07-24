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
- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    
    //test
    sn = [[iAKSocialNetwork alloc]initWithUIViewController:self];
    //[sn TwitterPost];
    
    //background music
    NSError *error;
    NSURL * backgroundMusicURL = [[NSBundle mainBundle] URLForResource:@"backgroundMusic" withExtension:@"mp3"];
    self.backgroundMusicPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:backgroundMusicURL error:&error];
    self.backgroundMusicPlayer.numberOfLoops = -1;
    [self.backgroundMusicPlayer prepareToPlay];
    [self.backgroundMusicPlayer play];
    
    // Configure the view.
    SKView * skView = (SKView *)self.view;
    if (!skView.scene) {
        skView.showsFPS = NO;
        skView.showsNodeCount = NO;
        
        // Create and configure the scene.
        SKScene * scene = [[iAKMyScene alloc]initWithSize:skView.bounds.size state:GameStateMainMenu];
        scene.scaleMode = SKSceneScaleModeAspectFill;
        
        // Present the scene.
        [skView presentScene:scene];
    }
}
- (BOOL)shouldAutorotate
{
    return YES;
}

- (NSUInteger)supportedInterfaceOrientations
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
    // Release any cached data, images, etc that aren't in use.
}

-(BOOL)prefersStatusBarHidden
{
    return YES;
}

@end
