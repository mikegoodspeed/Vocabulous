//
//  DefinitionViewController.h
//  Vocabulous
//
//  Created by Mike Goodspeed on 7/2/11.
//  Copyright 2011 Mike Goodspeed. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface DefinitionViewController : UIViewController
{
    UIWebView *webView_;
    NSString *word_;
}

@property (nonatomic, copy) NSString *word;
@end
