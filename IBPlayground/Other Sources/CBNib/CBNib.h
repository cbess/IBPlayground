//
//  CBNib.h
//  IBPlayground
//
//  Created by Christopher Bess on 6/5/12.
//  Copyright (c) 2012 C. Bess. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CBNibHelpers.h"

@interface CBNib : NSObject

/**
 * Returns the name of the nib for the current device.
 */
+ (NSString *)deviceNibNamed:(NSString *)name;

#pragma mark - Generic

/**
 * Returns the instantiated object tree from the nib with the specified name.
 */
+ (NSArray *)instantiateNibNamed:(NSString *)nibName owner:(id<NSObject>)owner;
+ (NSArray *)instantiateNibNamed:(NSString *)nibName owner:(id<NSObject>)owner proxyObjects:(NSDictionary *)proxyObjects;

/**
 * Loads the object tree for the current device's nib with the target name.
 */
+ (NSArray *)instantiateDeviceNibNamed:(NSString *)name owner:(id<NSObject>)owner;
+ (NSArray *)instantiateDeviceNibNamed:(NSString *)name owner:(id<NSObject>)owner proxyObjects:(NSDictionary *)proxyObjects;

/**
 * Loads the instantiated object tree from a nib with the specified owner class name.
 * @return Instantiated object tree from the loaded nib.
 * @discussion Uses the given owner for the class name and nib's owner.
 */
+ (NSArray *)loadSelfNibWithOwner:(id<NSObject>)owner;
+ (NSArray *)loadSelfNibWithOwner:(id<NSObject>)owner proxyObjects:(NSDictionary *)proxyObjects;
+ (NSArray *)loadSelfDeviceNibWithOwner:(id<NSObject>)owner;
+ (NSArray *)loadSelfDeviceNibWithOwner:(id<NSObject>)owner proxyObjects:(NSDictionary *)proxyObjects;

#pragma mark - Type Specific

/**
 * Instantiates the nib object tree with the given owner's class name. It loads the outlets and adds the root UIView
 * from the nib object tree as the first UIView of the UITableViewCell content view.
 * @return The UIView object that represents the UITableVieCell content view.
 */
+ (id)instantiateTableViewCellWithOwner:(UITableViewCell *)owner;

/**
 * Instantiates the nib object tree with the given owner's class name. It loads the outlets for the target UIView and
 * moves the root UIView's subviews into the owner.
 * @return The UIView object that represented the view in IB (first root object).
 * @discussion It pass along common property values from the reprenseted view (frame, background color, autoresizing mask, etc)
 */
+ (id)instantiateViewWithOwner:(UIView *)owner;
@end
