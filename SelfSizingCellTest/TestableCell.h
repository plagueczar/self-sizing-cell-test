//
//  TestableCell.h
//  SelfSizingCellTest
//
//  Created by Plagueczar on 20/01/2015.
//  Copyright (c) 2015 Thirty4. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol TestableCell <NSObject>

+ (NSUInteger) amountOfCellsForLorem:(NSArray *)array;

- (void) configureCell:(NSArray *)array
             indexPath:(NSIndexPath *)indexPath;

@end
