//
//  CBNib.m
//  IBPlayground
//
//  Created by Christopher Bess on 6/5/12.
//  Copyright (c) 2012 C. Bess. All rights reserved.
//

#import "CBNib.h"

@implementation CBNib

+ (NSString *)deviceNibNamed:(NSString *)nibName
{
    return (IsPhone() ? [nibName stringByAppendingString:@"_iPhone"] : [nibName stringByAppendingString:@"_iPad"]);
}

#pragma mark - Generic

#pragma mark Instantiate Nib

+ (NSArray *)instantiateNibNamed:(NSString *)nibName owner:(id<NSObject>)owner proxyObjects:(NSDictionary *)proxyObjects
{
    NSDictionary *options = nil;
    if (proxyObjects)
        options = [NSDictionary dictionaryWithObject:proxyObjects forKey:UINibExternalObjects];
    
    return [[UINib nibWithNibName:nibName bundle:nil] instantiateWithOwner:owner options:options];
}

+ (NSArray *)instantiateNibNamed:(NSString *)nibName owner:(id<NSObject>)owner
{
    return [CBNib instantiateNibNamed:nibName owner:owner proxyObjects:nil];
}

+ (NSArray *)instantiateDeviceNibNamed:(NSString *)name owner:(id<NSObject>)owner proxyObjects:(NSDictionary *)proxyObjects
{
    return [CBNib instantiateNibNamed:[CBNib deviceNibNamed:name] owner:owner proxyObjects:proxyObjects];
}

+ (NSArray *)instantiateDeviceNibNamed:(NSString *)name owner:(id<NSObject>)owner
{
    return [CBNib instantiateDeviceNibNamed:name owner:owner proxyObjects:nil];
}

#pragma mark Load Nib

+ (NSArray *)loadSelfNibWithOwner:(id<NSObject>)owner proxyObjects:(NSDictionary *)proxyObjects
{
    return [CBNib instantiateNibNamed:NSStringFromClass([owner class]) owner:owner proxyObjects:proxyObjects];
}

+ (NSArray *)loadSelfNibWithOwner:(id<NSObject>)owner
{
    return [CBNib loadSelfNibWithOwner:owner proxyObjects:nil];
}

+ (NSArray *)loadSelfDeviceNibWithOwner:(id<NSObject>)owner proxyObjects:(NSDictionary *)proxyObjects
{
    return [CBNib instantiateDeviceNibNamed:NSStringFromClass([owner class]) owner:owner proxyObjects:proxyObjects];
}

+ (NSArray *)loadSelfDeviceNibWithOwner:(id<NSObject>)owner
{
    return [CBNib loadSelfDeviceNibWithOwner:owner proxyObjects:nil];
}

#pragma mark - Type Specific

+ (id)instantiateTableViewCellWithOwner:(UITableViewCell *)owner
{
    UIView *view = [[CBNib loadSelfNibWithOwner:owner] lastObject];
    [owner.contentView addSubview:view];
    return view;
}

+ (id)instantiateViewWithOwner:(UIView *)owner
{
    UIView *view = [[CBNib loadSelfNibWithOwner:owner] lastObject];
    MoveSubviewsToView(view, owner);
    
    // pass along common property values
    owner.frame = view.bounds;
    owner.autoresizingMask = view.autoresizingMask;
    owner.backgroundColor = view.backgroundColor;
    
    return view;
}
@end
