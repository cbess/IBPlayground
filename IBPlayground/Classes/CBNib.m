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
    return (IsPhone() ? nibName : [nibName stringByAppendingString:@"_iPad"]);
}

#pragma mark - Generic

+ (NSArray *)instantiateNibNamed:(NSString *)nibName owner:(id<NSObject>)owner
{
    return [[UINib nibWithNibName:nibName bundle:nil] instantiateWithOwner:owner options:nil];
}

+ (NSArray *)instantiateDeviceNibNamed:(NSString *)name owner:(id<NSObject>)owner
{
    return [CBNib instantiateNibNamed:[CBNib deviceNibNamed:name] owner:owner];
}

+ (NSArray *)loadSelfNibWithOwner:(id<NSObject>)owner
{
    return [CBNib instantiateNibNamed:NSStringFromClass([owner class]) owner:owner];
}

+ (NSArray *)loadSelfDeviceNibWithOwner:(id<NSObject>)owner
{
    return [CBNib instantiateDeviceNibNamed:NSStringFromClass([owner class]) owner:owner];
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
