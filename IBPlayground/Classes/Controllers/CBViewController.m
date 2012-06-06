//
//  CBViewController.m
//  IBPlayground
//
//  Created by Christopher Bess on 6/5/12.
//  Copyright (c) 2012 C. Bess. All rights reserved.
//

#import "CBViewController.h"

@interface CBViewController ()

@end

@implementation CBViewController
@synthesize messageText;
@synthesize delegate;

- (id)initWithController:(UITabBarController *)controller
{
    self = [super init];
    if (self) 
    {
        [CBNib loadSelfDeviceNibWithOwner:self proxyObjects:[NSDictionary dictionaryWithObject:controller forKey:@"tabbar"]];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

#pragma mark - Events

- (IBAction)viewTapped:(id)sender 
{
    [self.delegate controllerViewTapped:self];
}

@end
