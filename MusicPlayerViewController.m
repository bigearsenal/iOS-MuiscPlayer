//
//  MusicPlayerViewController.m
//  MusicPlayer
//
//  Created by Dennis Suratna on 6/18/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MusicPlayerViewController.h"

@interface MusicPlayerViewController ()

@end

@implementation MusicPlayerViewController
@synthesize songPosition, query;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        musicPlayer = [MPMusicPlayerController applicationMusicPlayer];
        [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(updateTime:) userInfo:nil repeats:YES];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated
{
    [controlBar setFrame:CGRectMake(0, 372, 320, 88)];
    MPMediaItem * song = (MPMediaItem *) [query.items objectAtIndex:songPosition];

    NSNumber * duration = [song valueForProperty:MPMediaItemPropertyPlaybackDuration];
    [songSlider setMaximumValue:duration.floatValue];
    [songSlider setMinimumValue:0.0];
    artistLabel.text = [song valueForProperty:MPMediaItemPropertyAlbumArtist];
    songLabel.text = [song valueForProperty:MPMediaItemPropertyTitle];
    UIImage * albumImage = [[song valueForProperty:MPMediaItemPropertyArtwork] imageWithSize:CGSizeMake(320, 328)];

    if(albumImage){
        [albumImageView setImage:albumImage];
    }
    [super viewWillAppear:animated];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)setQuery:(MPMediaQuery *)aQuery {
    query = aQuery;
    [musicPlayer setQueueWithQuery:query];
}

- (IBAction)hideWindow:(id)sender {
    NSLog(@"Hiding Window");
    [musicPlayer stop];
    [self dismissModalViewControllerAnimated:YES];
}

- (void) updateTime: (id) sender
{
    NSInteger newValue = (NSInteger) [musicPlayer currentPlaybackTime] ;
    [songSlider setValue:newValue animated:YES];
    NSInteger minutes = newValue / 60;
    NSInteger seconds = newValue % 60;
    [timePast setText:[NSString stringWithFormat:@"%d:%d", minutes, seconds]];
}

- (void)playFromBeginning:(NSUInteger) position  {
    NSLog(@"Playing Song at Position %d", position);
    NSLog(@"Song is %@", [query.items objectAtIndex:position]);
    isPlaying = true;
    songPosition = position;
    MPMediaItem * song = (MPMediaItem *) [query.items objectAtIndex:position];
    [musicPlayer stop];
    [musicPlayer setNowPlayingItem: [query.items objectAtIndex:position]];

    [musicPlayer setCurrentPlaybackTime:0];
    [songSlider setValue:0];

    [musicPlayer play];
}

- (IBAction)play:(id) sender{
    if (isPlaying){
        [musicPlayer pause];
    }else{
        [musicPlayer play];
    }
    isPlaying = !isPlaying;
}


- (IBAction)back:(id)sender {

}

- (IBAction)forward:(id)sender {

}


@end
