//
//  WordListTableViewController.m
//  Vocabulous
//
//  Created by Mike Goodspeed on 7/2/11.
//  Copyright 2011 Mike Goodspeed. All rights reserved.
//

#import "WordListTableViewController.h"
#import "DefinitionViewController.h"

@interface WordListTableViewController()
@property (nonatomic, retain) NSMutableDictionary *words;
@property (nonatomic, retain) NSArray *sections;
@end

@implementation WordListTableViewController

@synthesize words = words_;
@synthesize sections = sections_;

- (NSMutableDictionary *)words
{
    if (!words_)
    {
        NSURL *url = [NSURL URLWithString:@"http://www.stanford.edu/class/cs193p/vocabwords.txt"];
        words_ = [[NSMutableDictionary dictionaryWithContentsOfURL:url] retain]; 
    }
    return words_;
}

- (NSArray *)sections
{
    if (!sections_)
    {
        sections_ = [[[self.words allKeys] sortedArrayUsingSelector:@selector(compare:)] retain];
    }
    return sections_;
}

- (void)dealloc
{
    [words_ dealloc];
    [sections_ dealloc];
    [super dealloc];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Vocabulous";
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.sections.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray *wordsInSection = [self.words objectForKey:[self.sections objectAtIndex:section]];
    return wordsInSection.count;
}

- (NSString *)wordAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray *wordsInSection = [self.words objectForKey:[self.sections objectAtIndex:indexPath.section]];
    return [wordsInSection objectAtIndex:indexPath.row];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"WordListTableViewCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    cell.textLabel.text = [self wordAtIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DefinitionViewController *dvc = [[DefinitionViewController alloc] init];
    dvc.word = [self wordAtIndexPath:indexPath];
    [self.navigationController pushViewController:dvc animated:YES];
    [dvc release];
}

@end
