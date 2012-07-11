//
//  MusicPlayerViewController.h
//  MusicPlayer
//
//  Created by Dennis Suratna on 6/18/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>

@interface MusicPlayerViewController : UIViewController
{
    IBOutlet UILabel * artistLabel;
    IBOutlet UILabel * songLabel;
    IBOutlet UILabel * timePast;
    IBOutlet UIBarButtonItem * hideButton;
    IBOutlet UIImageView * albumImageView;
    IBOutlet UIToolbar * controlBar;
    IBOutlet UISlider * songSlider;
    IBOutlet UIButton * playButton;
    IBOutlet UIButton * forwardButton;
    IBOutlet UIButton * backButton;

    BOOL isPlaying;
    NSInteger songPosition;
    MPMusicPlayerController* musicPlayer;
}

@property (nonatomic) NSInteger songPosition;
@property (nonatomic, strong) MPMediaQuery * query;

- (IBAction) hideWindow: (id) sender;
- (IBAction) play: (id) sender;
- (IBAction) back: (id) sender;
- (IBAction) forward: (id) sender;

- (void)playFromBeginning:(NSInteger) position;

@end
