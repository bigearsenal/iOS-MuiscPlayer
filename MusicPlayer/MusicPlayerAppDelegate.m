//
//  MusicPlayerAppDelegate.m
//  MusicPlayer
//
//  Created by Dennis Suratna on 6/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <MediaPlayer/MediaPlayer.h>
#import "MusicPlayerAppDelegate.h"
#import "SongsListViewController.h"
#import "SettingsViewController.h"
#import "MusicPlayerViewController.h"

@implementation MusicPlayerAppDelegate

@synthesize window = _window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    UITabBarController * uiTabBarController = [[UITabBarController alloc] init];

    SongsListViewController * songsListViewController = [[SongsListViewController alloc] init];
    UINavigationController * songsListNavController = [[UINavigationController alloc] initWithRootViewController:songsListViewController];
    songsListNavController.navigationBar.tintColor = [UIColor blackColor];
    [songsListNavController.navigationBar.topItem setTitle:@"Playlists"];
    songsListNavController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Playlists" image:[UIImage imageNamed:@"playlists.png"] tag:0];

    SettingsViewController * settingsViewController = [[SettingsViewController alloc] init];
    UINavigationController * settingsNavController = [[UINavigationController alloc] initWithRootViewController:settingsViewController];
    settingsNavController.navigationBar.tintColor = [UIColor blackColor];
    [settingsNavController.navigationBar.topItem setTitle:@"Settings"];
    settingsViewController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Settings" image:[UIImage imageNamed:@"settings.png"] tag:1];

    [uiTabBarController addChildViewController:songsListNavController];
    [uiTabBarController addChildViewController:settingsNavController];

    self.window.backgroundColor = [UIColor whiteColor];
    [self.window setRootViewController: uiTabBarController];
    [self.window makeKeyAndVisible];
    return YES;
}
@end
