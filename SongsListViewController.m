//
//  SongsListViewController.m
//  MusicPlayer
//
//  Created by Dennis Suratna on 6/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SongsListViewController.h"

@interface SongsListViewController ()

@end

@implementation SongsListViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        isEditing = false;
        UINavigationBar * uiNavigationBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 320.0f, 44.0f)];
        UINavigationItem * item = [[UINavigationItem alloc] initWithTitle:@"Playlists"];
        editButton = [[UIBarButtonItem alloc] initWithTitle:@"Edit" style:UIBarButtonItemStyleDone target:nil action:@selector(editPlaylists:)];
        [item setLeftBarButtonItem:editButton];
        [uiNavigationBar pushNavigationItem:item animated:NO];
        [[self tableView] addSubview:uiNavigationBar];
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


@end
