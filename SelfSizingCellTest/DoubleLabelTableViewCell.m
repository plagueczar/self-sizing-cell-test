//
//  DoubleLabelTableViewCell.m
//  SelfSizingCellTest
//
//  Created by Plagueczar on 20/01/2015.
//  Copyright (c) 2015 Thirty4. All rights reserved.
//

#import "DoubleLabelTableViewCell.h"

@implementation DoubleLabelTableViewCell

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
}

+ (NSUInteger) amountOfCellsForLorem:(NSArray *)array {
    return array.count/2;
}

@end
