//
//  DoubleLabelTableViewCell.h
//  SelfSizingCellTest
//
//  Created by Benjamin Frost on 20/01/2015.
//  Copyright (c) 2015 Thirty4. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TestableCell.h"

@interface DoubleLabelTableViewCell : UITableViewCell<TestableCell>

@property (strong, nonatomic) IBOutlet UILabel *lblTitle;
@property (strong, nonatomic) IBOutlet UILabel *lblSubtitle;

@end
