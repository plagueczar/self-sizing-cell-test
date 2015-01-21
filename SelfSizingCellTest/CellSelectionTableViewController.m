//
//  CellSelectionTableViewController.m
//  SelfSizingCellTest
//
//  Created by Plagueczar on 20/01/2015.
//  Copyright (c) 2015 Thirty4. All rights reserved.
//

#import "CellSelectionTableViewController.h"
#import "TestTableViewController.h"
#import "MixedTestTableViewController.h"

#import "SwitchTableViewCell.h"
#import "SingleLabelTableViewCell.h"
#import "DoubleLabelTableViewCell.h"
#import "HorizontalDoubleTableViewCell.h"
#import "SwitchInViewTableViewCell.h"
#import "DoubleTextSwitchInViewTableViewCell.h"

@interface CellSelectionTableViewController ()

@end

@implementation CellSelectionTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.cellTypes = @[
                       [SingleLabelTableViewCell class],
                       [DoubleLabelTableViewCell class],
                       [SwitchTableViewCell class],
                       [HorizontalDoubleTableViewCell class],
                       [SwitchInViewTableViewCell class],
                       [DoubleTextSwitchInViewTableViewCell class]
                       ];
    
    self.tableView.estimatedRowHeight = 44;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return [@[@"Single Cell Type", @"Mixed Cell Type"] objectAtIndex:section];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    switch (section) {
        case 0: return self.cellTypes.count;
        case 1: return 1;
        default: @throw [NSException exceptionWithName:@"Not Implemented"
                                                reason:@""
                                              userInfo:nil];
    }
}

- (Class) classForIndexPath:(NSIndexPath *)indexPath {
    return [self.cellTypes objectAtIndex:indexPath.row];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *cellIdentifier = @"CellIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:cellIdentifier];
    }
    
    switch (indexPath.section) {
        case 0: cell.textLabel.text = NSStringFromClass([self classForIndexPath:indexPath]); break;
        case 1: cell.textLabel.text = @"Mixed"; break;
        default: @throw [NSException exceptionWithName:@"Not Implemented"
                                                reason:@""
                                              userInfo:nil];
    }
   
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    switch (indexPath.section) {
        case 0: {
            TestTableViewController *vc = [[TestTableViewController alloc] initWithStyle:UITableViewStyleGrouped];
            vc.cellClass = [self classForIndexPath:indexPath];
            [self.navigationController pushViewController:vc
                                                 animated:YES];
        } break;
        case 1: {
            MixedTestTableViewController *vc = [[MixedTestTableViewController alloc] initWithStyle:UITableViewStyleGrouped];
            [self.navigationController pushViewController:vc
                                                 animated:YES];
        } break;
        default: @throw [NSException exceptionWithName:@"Not Implemented"
                                                reason:@""
                                              userInfo:nil];
    }
    

}


@end
