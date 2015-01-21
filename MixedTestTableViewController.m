//
//  MixedTestTableViewController.m
//  SelfSizingCellTest
//
//  Created by Benjamin Frost on 21/01/2015.
//  Copyright (c) 2015 Thirty4. All rights reserved.
//

#import "MixedTestTableViewController.h"
#import "DoubleTextSwitchInViewTableViewCell.h"
#import "DoubleLabelTableViewCell.h"
#import "AppDelegate.h"

@interface MixedTestTableViewController ()

@end

@implementation MixedTestTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self registerNib:NSStringFromClass([DoubleLabelTableViewCell class])];
    [self registerNib:NSStringFromClass([DoubleTextSwitchInViewTableViewCell class])];
    
    self.contents = [AppDelegate getLoremIpsum];
    
    self.tableView.estimatedRowHeight = 44;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
}

- (void) registerNib:(NSString *)nibName {
    UINib *nib = [UINib nibWithNibName:nibName
                                bundle:nil];
    [self.tableView registerNib:nib
         forCellReuseIdentifier:nibName];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.contents.count/2;
}

- (NSString *)identifierForIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row % 2) {
        case 0: return NSStringFromClass([DoubleLabelTableViewCell class]);
        case 1: return NSStringFromClass([DoubleTextSwitchInViewTableViewCell class]);
        default: return nil;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *identifier = [self identifierForIndexPath:indexPath];
    
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:identifier
                                                                 forIndexPath:indexPath];
    
    
    if ([cell respondsToSelector:@selector(configureCell:indexPath:)]) {
        [(id<TestableCell>)cell configureCell:self.contents
                                    indexPath:indexPath];
    }
    
    [cell layoutIfNeeded];
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
