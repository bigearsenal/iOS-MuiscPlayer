//
//  MusicPlayerAppDelegate.h
//  MusicPlayer
//
//  Created by Dennis Suratna on 6/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MusicPlayerViewController;
@class MPMediaItem;

@interface MusicPlayerAppDelegate : UIResponder <UIApplicationDelegate>
{
    MusicPlayerViewController * musicPlayerViewController;
    UITabBarController * uiTabBarController;
}

@property (strong, nonatomic) UIWindow *window;

- (void) playSong:(NSUInteger *) songPosition;
- (void) hideMusicPlayer;

@end
