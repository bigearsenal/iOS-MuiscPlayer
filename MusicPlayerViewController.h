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
    IBOutlet UIBarButtonItem * hideButton;
    IBOutlet UIImageView * albumImageView;
    IBOutlet UIToolbar * controlBar;

    NSUInteger songPosition;
    MPMusicPlayerController* musicPlayer;
    MPMediaQuery * query;

}

@property (nonatomic) NSUInteger songPosition;

- (IBAction) hideWindow: (id) sender;
- (void)play:(NSUInteger) position;

@end
