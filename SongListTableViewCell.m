//
//  SongListTableViewCell.m
//  MusicPlayer
//
//  Created by Dennis Suratna on 6/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SongListTableViewCell.h"

@implementation SongListTableViewCell

- (id)init
{
    self = [super initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"SongItem"];
    if (self) {
        [self setBackgroundColor:[UIColor greenColor]];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
}

@end
