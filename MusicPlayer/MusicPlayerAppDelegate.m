//
//  MusicPlayerAppDelegate.m
//  MusicPlayer
//
//  Created by Dennis Suratna on 6/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MusicPlayerAppDelegate.h"
#import "SongsListViewController.h"
#import "SettingsViewController.h"

@implementation MusicPlayerAppDelegate

@synthesize window = _window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    UITabBarController * uiTabBarController = [[UITabBarController alloc] init];

    SongsListViewController * songsListViewController = [[SongsListViewController alloc] init];
    songsListViewController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Playlists" image:[UIImage imageNamed:@"playlists.png"] tag:0];

    SettingsViewController * settingsViewController = [[SettingsViewController alloc] init];
    settingsViewController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Settings" image:[UIImage imageNamed:@"settings.png"] tag:1];

    [uiTabBarController addChildViewController:songsListViewController];
    [uiTabBarController addChildViewController:settingsViewController];

    self.window.backgroundColor = [UIColor whiteColor];
    [self.window setRootViewController: uiTabBarController];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
