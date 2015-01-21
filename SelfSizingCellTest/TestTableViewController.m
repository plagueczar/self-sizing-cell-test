//
//  TestTableViewController.m
//  SelfSizingCellTest
//
//  Created by Plagueczar on 20/01/2015.
//  Copyright (c) 2015 Thirty4. All rights reserved.
//

#import "TestTableViewController.h"
#import "SwitchTableViewCell.h"
#import "AppDelegate.h"

@interface TestTableViewController ()

@end

@implementation TestTableViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.title = [self cellIdentifier];
    self.contents = [AppDelegate getLoremIpsum];
    
    UINib *nib = [UINib nibWithNibName:[self cellIdentifier]
                                bundle:nil];
    [self.tableView registerNib:nib
         forCellReuseIdentifier:[self cellIdentifier]];
    
    
    self.tableView.estimatedRowHeight = 44;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    

}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSIndexPath *) indexPathOfLowestRow {
    NSUInteger lastSection = [self numberOfSectionsInTableView:self.tableView]-1;
    NSUInteger rowsInSection = [self tableView:self.tableView
                         numberOfRowsInSection:lastSection]-1;
    return [NSIndexPath indexPathForRow:rowsInSection
                              inSection:lastSection];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return (section == 0) ? @"Default" : @"Lorem";
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return (section == 0) ? 3 : [self.cellClass amountOfCellsForLorem:self.contents];
}

- (NSString *) cellIdentifier {
    return NSStringFromClass(self.cellClass);
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:[self cellIdentifier]
                                                                 forIndexPath:indexPath];
    
    
    if ([cell respondsToSelector:@selector(configureCell:indexPath:)]) {
        [(id<TestableCell>)cell configureCell:self.contents
                                    indexPath:indexPath];
    }
    
    [cell layoutIfNeeded];
    
    return cell;
}

@end
