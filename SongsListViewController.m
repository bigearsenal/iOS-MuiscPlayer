//
//  SongsListViewController.m
//  MusicPlayer
//
//  Created by Dennis Suratna on 6/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SongsListViewController.h"
#import "SongListTableViewCell.h"
#import <MediaPlayer/MediaPlayer.h>

@interface SongsListViewController ()

@end

@implementation SongsListViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        isEditing = false;
        [[self tableView] setContentInset:UIEdgeInsetsMake(44.0, 0, 0, 0)];
        UINavigationBar * uiNavigationBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0.0f, -44, 320.0f, 44.0f)];
        [uiNavigationBar setTintColor:[UIColor blackColor]];
        UINavigationItem * item = [[UINavigationItem alloc] initWithTitle:@"Playlists"];
//        editButton = [[UIBarButtonItem alloc] initWithTitle:@"Edit" style:UIBarButtonItemStyleDone target:nil action:@selector(editPlaylists:)];
//        [item setLeftBarButtonItem:editButton];
        [uiNavigationBar pushNavigationItem:item animated:NO];
        [[self tableView] addSubview:uiNavigationBar];
        [[self tableView] setRowHeight:75.0];

        [[self tableView] setBackgroundView:nil];

        MPMediaQuery * allSongsQuery = [[MPMediaQuery alloc] init];
        songs = [allSongsQuery items];
        NSLog(@"There are %d songs", [songs count]);
    }
    return self;
}

- (IBAction)editPlaylists:(id)sender {

    if (isEditing){
        NSLog(@"Finished editing Playlists");
        editButton.title = @"Edit";
        [self setEditing:false animated:true];
     }else{
        NSLog(@"Editing Playlists");
        editButton.title = @"Done";
        [self setEditing:true animated:true];
    }
    isEditing = !isEditing;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated {
    [self.tableView setSeparatorColor:[UIColor darkGrayColor]];
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

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSLog(@"Called with section: %d", section);
    return [songs count];
//    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"Called with row: %d", indexPath.row);
    static NSString * identifier = @"SongItem";
    UITableViewCell * reusableCell=  (SongListTableViewCell *) [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!reusableCell){
        NSLog(@"No reusable cell found");
        [[NSBundle mainBundle] loadNibNamed:@"SongListViewCell" owner:self options:nil];
        reusableCell = songCell;
        songCell = nil;
    }


    reusableCell.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"cellBackground.png"]];
    reusableCell.selectedBackgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"cellBackgroundActive.png"]];

    UILabel * songTitleLabel = (UILabel *)[reusableCell viewWithTag:1];
    UILabel * artistLabel = (UILabel *)[reusableCell viewWithTag:2];

    MPMediaItem * song = [songs objectAtIndex:[indexPath row]];
    songTitleLabel.text = [song valueForProperty:MPMediaItemPropertyTitle];
    artistLabel.text = [song valueForProperty:MPMediaItemPropertyArtist];

    return reusableCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"Song at position %d is selected. Title: %@", indexPath.row, [[songs objectAtIndex:indexPath.row] valueForProperty:MPMediaItemPropertyTitle]);
}


- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    [cell setBackgroundColor:[UIColor blackColor]];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}




@end
