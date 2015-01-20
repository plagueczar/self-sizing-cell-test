//
//  SwitchTableViewCell.h
//  SelfSizingCellTest
//
//  Created by Plagueczar on 20/01/2015.
//  Copyright (c) 2015 Thirty4. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TestableCell.h"

@interface SwitchTableViewCell : UITableViewCell<TestableCell>

@property (strong, nonatomic) IBOutlet UILabel *lblTitle;
@property (strong, nonatomic) IBOutlet UILabel *lblSubtitle;
@property (strong, nonatomic) IBOutlet UISwitch *switchView;

@end
