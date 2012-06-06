//
//  CBTableViewCell.m
//  IBPlayground
//
//  Created by Christopher Bess on 6/6/12.
//  Copyright (c) 2012 C. Bess. All rights reserved.
//

#import "CBTableViewCell.h"

@implementation CBTableViewCell
@synthesize imageView;
@synthesize textLabel;

- (id)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    if (self) 
    {
        [CBNib instantiateTableViewCellWithOwner:self];
    }
    return self;
}

@end
