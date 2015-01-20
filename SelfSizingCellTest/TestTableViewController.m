//
//  TestTableViewController.m
//  SelfSizingCellTest
//
//  Created by Plagueczar on 20/01/2015.
//  Copyright (c) 2015 Thirty4. All rights reserved.
//

#import "TestTableViewController.h"
#import "SwitchTableViewCell.h"

@interface TestTableViewController ()

@end

@implementation TestTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = [self cellIdentifier];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"lorem"
                                                     ofType:@"txt"];
    NSError *error;
    NSString *fileContents = [NSString stringWithContentsOfFile:path
                                                       encoding:NSUTF8StringEncoding
                                                          error:&error];
    
    UINib *nib = [UINib nibWithNibName:[self cellIdentifier]
                                bundle:nil];
    [self.tableView registerNib:nib
         forCellReuseIdentifier:[self cellIdentifier]];
    
    self.tableView.estimatedRowHeight = 44;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
    if (!error) {
        self.contents = [fileContents componentsSeparatedByString:@"."];
        
        NSMutableArray *stripped = [[NSMutableArray alloc] init];
        for (NSString *string in self.contents) {
            [stripped addObject:[[string stringByTrimmingCharactersInSet:[NSCharacterSet newlineCharacterSet]] stringByAppendingString:@"."]];
        }
        
        self.contents = stripped;
        
    } else {
        self.contents = [[NSArray alloc] init];
    }
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
    return [self.cellClass amountOfCellsForLorem:self.contents];
}

- (NSString *) cellIdentifier {
    return NSStringFromClass(self.cellClass);
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    id<TestableCell> cell = [self.tableView dequeueReusableCellWithIdentifier:[self cellIdentifier]
                                                                 forIndexPath:indexPath];
    
    [cell configureCell:self.contents
              indexPath:indexPath];
    
    return (UITableViewCell *)cell;
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
