//
//  CBAppDelegate.h
//  IBPlayground
//
//  Created by Christopher Bess on 6/5/12.
//  Copyright (c) 2012 Bottle Rocket Apps. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CBViewController;

@interface CBAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) CBViewController *viewController;

@end
