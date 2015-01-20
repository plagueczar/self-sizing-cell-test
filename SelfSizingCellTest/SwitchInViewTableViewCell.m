//
//  SwitchInViewTableViewCell.m
//  SelfSizingCellTest
//
//  Created by Benjamin Frost on 21/01/2015.
//  Copyright (c) 2015 Thirty4. All rights reserved.
//

#import "SwitchInViewTableViewCell.h"

@implementation SwitchInViewTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void) configureCell:(NSArray *)array
             indexPath:(NSIndexPath *)indexPath {
    
    self.lblTitle.text = [array objectAtIndex:indexPath.row];
}

+ (NSUInteger) amountOfCellsForLorem:(NSArray *)array {
    return array.count;
}

@end
