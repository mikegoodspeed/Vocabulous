//
//  VocabulousAppDelegate.h
//  Vocabulous
//
//  Created by Mike Goodspeed on 7/2/11.
//  Copyright 2011 Mike Goodspeed. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VocabulousAppDelegate : NSObject <UIApplicationDelegate>
{
    UINavigationController *nav_;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@end
