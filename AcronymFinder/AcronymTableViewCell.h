//
//  AcronymTableViewCell.h
//  AcronymFinder
//
//  Created by Sarvesh Joshi on 11/8/15.
//  Copyright (c) 2015 SelfWork. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AcronymTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *fullFormLabel;
@property (weak, nonatomic) IBOutlet UILabel *frequencyLabel;
@property (weak, nonatomic) IBOutlet UILabel *yearSinceLabel;

@end
