//
//  VocabulousAppDelegate.m
//  Vocabulous
//
//  Created by Mike Goodspeed on 7/2/11.
//  Copyright 2011 Mike Goodspeed. All rights reserved.
//

#import "VocabulousAppDelegate.h"
#import "WordListTableViewController.h"

@implementation VocabulousAppDelegate

@synthesize window=_window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    nav_ = [[UINavigationController alloc] init];
    WordListTableViewController *wltvc = [[WordListTableViewController alloc] init];
    [nav_ pushViewController:wltvc animated:NO];
    [wltvc release];
    [self.window addSubview:nav_.view];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)dealloc
{
    [_window release];
    [nav_ release];
    [super dealloc];
}

@end
