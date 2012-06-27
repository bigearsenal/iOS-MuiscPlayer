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
    NSLog(@"NibName: %@",nibNameOrNil);
    NSLog(@"NibBundle: %@",nibBundleOrNil);
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        musicPlayer = [MPMusicPlayerController applicationMusicPlayer];
    }
    NSLog(@"Song label %@", songLabel);
    NSLog(@"Artist label %@", artistLabel);
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
}

- (void)play:(NSUInteger) position  {
    NSLog(@"Playing Song at Position %d", position);
    NSLog(@"Song is %@", [query.items objectAtIndex:position]);

    songPosition = position;
    MPMediaItem * song = (MPMediaItem *) [query.items objectAtIndex:position];
    [musicPlayer stop];
    [musicPlayer setNowPlayingItem: [query.items objectAtIndex:position]];
    [musicPlayer setCurrentPlaybackTime:0];
    [musicPlayer play];
}



@end
