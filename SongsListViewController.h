//
//  SongsListViewController.h
//  MusicPlayer
//
//  Created by Dennis Suratna on 6/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SongsListViewController : UITableViewController
{
    BOOL isEditing;
    UIBarButtonItem * editButton;
}

- (IBAction) editPlaylists: (id) sender;

@end
