//
//  CBViewController.m
//  IBPlayground
//
//  Created by Christopher Bess on 6/5/12.
//  Copyright (c) 2012 C. Bess. All rights reserved.
//

#import "CBViewController.h"

@interface CBViewController ()
@property (weak, nonatomic) IBOutlet UILabel *messageLabel;
@property (nonatomic, weak) UITabBarController *controller;
@end

@implementation CBViewController
@synthesize messageLabel;
@synthesize messageText;
@synthesize delegate;
@synthesize controller = _controller;

- (id)initWithController:(UITabBarController *)controller
{
    self = [super initWithNibName:nil bundle:nil];
    if (self) 
    {
        self.controller = controller;
    }
    return self;
}

- (void)loadView
{
    [CBNib loadSelfDeviceNibWithOwner:self proxyObjects:[NSDictionary dictionaryWithObject:self.controller forKey:@"tabbar"]];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    if (self.messageText)
        self.messageLabel.text = self.messageText;
}

- (void)viewDidUnload
{
    [self setMessageLabel:nil];
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
