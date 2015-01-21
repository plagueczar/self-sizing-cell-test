//
//  DoubleTextSwitchInViewTableViewCell.m
//  SelfSizingCellTest
//
//  Created by Benjamin Frost on 21/01/2015.
//  Copyright (c) 2015 Thirty4. All rights reserved.
//

#import "DoubleTextSwitchInViewTableViewCell.h"

@implementation DoubleTextSwitchInViewTableViewCell

- (void)awakeFromNib {
    self.lblTitle.text = @"Default title.";
    self.lblSubtitle.text = @"Default subtitle text is a little longer to try to provoke a resize.";
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void) configureCell:(NSArray *)array
             indexPath:(NSIndexPath *)indexPath {
    
//    self.lblTitle.preferredMaxLayoutWidth = CGRectGetWidth(self.lblTitle.frame);
//    self.lblSubtitle.preferredMaxLayoutWidth = CGRectGetWidth(self.lblSubtitle.frame);
    
    self.lblTitle.text = [array objectAtIndex:indexPath.row * 2];
    self.lblSubtitle.text = [array objectAtIndex:(indexPath.row * 2)+1];
    self.switchView.on = ((indexPath.row % 2) == 1);
}

+ (NSUInteger) amountOfCellsForLorem:(NSArray *)array {
    return array.count/2;
}

@end
