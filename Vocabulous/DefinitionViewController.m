//
//  DefinitionViewController.m
//  Vocabulous
//
//  Created by Mike Goodspeed on 7/2/11.
//  Copyright 2011 Mike Goodspeed. All rights reserved.
//

#import "DefinitionViewController.h"

@implementation DefinitionViewController

@synthesize word = word_;

- (NSURLRequest *)urlRequest
{
    NSString *urlString = @"http://www.google.com/search?tbs=dfn:1&q=";
    if (self.word)
    {
        urlString = [urlString stringByAppendingString:self.word];
    }
    return [NSURLRequest requestWithURL:[NSURL URLWithString:urlString]];
    
}

- (void)setWord:(NSString *)word
{
    if (word != word_)
    {
        [word_ release];
        word_ = [word copy];
    }
    self.title = word;
    if (webView_.window)
    {
        [webView_ loadRequest:[self urlRequest]];
    }
}

- (void)dealloc
{
    [word_ release];
    [webView_ release];
    [super dealloc];
}

#pragma mark - View lifecycle

- (void)loadView
{
    webView_ = [[UIWebView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
    webView_.scalesPageToFit = YES;
    self.view = webView_;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [webView_ loadRequest:[self urlRequest]];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
