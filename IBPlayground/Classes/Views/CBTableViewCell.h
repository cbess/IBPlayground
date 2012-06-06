//
//  CBTableViewCell.h
//  IBPlayground
//
//  Created by Christopher Bess on 6/6/12.
//  Copyright (c) 2012 C. Bess. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CBTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *textLabel;
- (id)initWithReuseIdentifier:(NSString *)reuseIdentifier;
@end
