//
//  SingleLabelTableViewCell.h
//  SelfSizingCellTest
//
//  Created by Benjamin Frost on 20/01/2015.
//  Copyright (c) 2015 Thirty4. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TestableCell.h"

@interface SingleLabelTableViewCell : UITableViewCell<TestableCell>

@property (strong, nonatomic) IBOutlet UILabel *lblTitle;

@end
