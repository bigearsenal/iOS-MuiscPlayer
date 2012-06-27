//
//  SongsListViewController.h
//  MusicPlayer
//
//  Created by Dennis Suratna on 6/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MusicPlayerViewController;

@interface SongsListViewController : UITableViewController <UITableViewDataSource, UITableViewDelegate>
{
    BOOL isEditing;
    UIBarButtonItem * editButton;
    NSArray * songs;
    IBOutlet UITableViewCell * songCell;
    MusicPlayerViewController *musicPlayerViewController;
}

- (IBAction) editPlaylists: (id) sender;

@end
