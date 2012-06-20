//
//  MusicPlayerViewController.m
//  MusicPlayer
//
//  Created by Dennis Suratna on 6/18/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MusicPlayerViewController.h"
#import "MusicPlayerAppDelegate.h"

@interface MusicPlayerViewController ()

@end

@implementation MusicPlayerViewController
@synthesize songPosition;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        query= [MPMediaQuery songsQuery];
        musicPlayer = [MPMusicPlayerController applicationMusicPlayer];
        [musicPlayer setQueueWithQuery:query];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
- (IBAction)hideWindow:(id)sender {
    NSLog(@"Hiding Window");
    [((MusicPlayerAppDelegate *) [[UIApplication sharedApplication] delegate]) hideMusicPlayer];
}

- (void)play:(NSUInteger *) position  {
    NSLog(@"Playing Song at Position %d", position);
    NSLog(@"Song is %@", [query.items objectAtIndex:position]);

    MPMediaItem * song = (MPMediaItem *) [query.items objectAtIndex:position];
    [musicPlayer stop];
    artistLabel.text = [song valueForProperty:MPMediaItemPropertyAlbumArtist];
    songLabel.text = [song valueForProperty:MPMediaItemPropertyTitle];

    [musicPlayer setNowPlayingItem: [query.items objectAtIndex:position]];
    [musicPlayer setCurrentPlaybackTime:0];
    [musicPlayer play];
}



@end
