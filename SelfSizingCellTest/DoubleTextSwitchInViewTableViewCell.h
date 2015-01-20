//
//  DoubleTextSwitchInViewTableViewCell.h
//  SelfSizingCellTest
//
//  Created by Benjamin Frost on 21/01/2015.
//  Copyright (c) 2015 Thirty4. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DoubleTextSwitchInViewTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *lblTitle;

@property (strong, nonatomic) IBOutlet UILabel *lblSubtitle;

@property (strong, nonatomic) IBOutlet UISwitch *switchView;

@end
