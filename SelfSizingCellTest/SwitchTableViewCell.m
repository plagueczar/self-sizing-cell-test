//
//  SwitchTableViewCell.m
//  SelfSizingCellTest
//
//  Created by Benjamin Frost on 20/01/2015.
//  Copyright (c) 2015 Thirty4. All rights reserved.
//

#import "SwitchTableViewCell.h"

@implementation SwitchTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void) configureCell:(NSArray *)array
             indexPath:(NSIndexPath *)indexPath {
    
    self.lblTitle.text = [array objectAtIndex:indexPath.row * 2];
    self.lblSubtitle.text = [array objectAtIndex:(indexPath.row * 2)+1];
    self.switchView.on = ((indexPath.row % 2) == 0);
}

+ (NSUInteger) amountOfCellsForLorem:(NSArray *)array {
    return array.count/2;
}

@end
