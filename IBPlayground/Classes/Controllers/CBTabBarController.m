//
//  CBTabBarController.m
//  IBPlayground
//
//  Created by Christopher Bess on 6/5/12.
//  Copyright (c) 2012 C. Bess. All rights reserved.
//

#import "CBTabBarController.h"
#import "CBTableViewCell.h"
#import "CBViewController.h"

@interface CBTabBarController () <UITableViewDataSource, CBViewControllerDelegate>
@property (weak, nonatomic) IBOutlet UIButton *buttonOne;
@end

@implementation CBTabBarController
@synthesize buttonOne;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Events

- (IBAction)buttonOnePressed:(id)sender 
{
    CBViewController *viewController = [[CBViewController alloc] initWithController:self];
    viewController.delegate = self;
    [self presentModalViewController:viewController animated:YES];
}

// iphone only
- (IBAction)modalViewTapped:(id)sender
{
    [self dismissModalViewControllerAnimated:YES];
}

#pragma mark - CBViewControllerDelegate

- (void)controllerViewTapped:(CBViewController *)controller
{
    [self dismissModalViewControllerAnimated:YES];
}

#pragma mark - UITableViewDataSource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *localIdentifier = [[NSLocale availableLocaleIdentifiers] objectAtIndex:indexPath.row];
    CBTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"."];
    if (cell == nil)
        cell = [[CBTableViewCell alloc] initWithReuseIdentifier:@"."];
    cell.textLabel.text = localIdentifier;
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [NSLocale availableLocaleIdentifiers].count;
}

@end
