//
//  CBViewController.h
//  IBPlayground
//
//  Created by Christopher Bess on 6/5/12.
//  Copyright (c) 2012 C. Bess. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CBViewControllerDelegate;

@interface CBViewController : UIViewController
@property (nonatomic, copy) NSString *messageText; // the label is hidden, but its text can still be set from IB
@property (nonatomic, weak) IBOutlet id<CBViewControllerDelegate> delegate;
- (id)initWithController:(UITabBarController *)controller;
@end

@protocol CBViewControllerDelegate <NSObject>
- (void)controllerViewTapped:(CBViewController *)controller;
@end