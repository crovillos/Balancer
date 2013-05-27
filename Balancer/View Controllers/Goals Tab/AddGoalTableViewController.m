//
//  AddGoalTableViewController.m
//  Balancer
//
//  Created by Chris Rovillos on 5/21/13.
//  Copyright (c) 2013 Dian Hartono, Grace Jang, Chris Rovillos, Catriona Scott, Brian Yin. All rights reserved.
//

#import "AddGoalTableViewController.h"
#import "AddCustomGoalTableViewController.h"
#import "AppDelegate.h"
#import "GoalsTableViewController.h"

@implementation AddGoalTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    self.availableGoals = appDelegate.dummyAvailableGoals;
}

-(void)setAvailableGoals:(NSArray *)availableGoals
{
    _availableGoals = availableGoals;
    [self.tableView reloadData];
}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.availableGoals count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Available Goal";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    Goal *goal = (Goal *)self.availableGoals[indexPath.row];
    cell.textLabel.text = goal.name;
    
    return cell;
}

#pragma mark - Table view delegate

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"Add Goal"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
        Goal *goal = [self.availableGoals objectAtIndex:indexPath.row];
        self.selectedGoal = goal;
    } else if ([[segue identifier] isEqualToString:@"Add Custom Goal"]) {
    }
}

- (IBAction)addCustomGoal:(UIStoryboardSegue *)segue {
    AddCustomGoalTableViewController *vc = (AddCustomGoalTableViewController *)segue.sourceViewController; // get results out of vc, which I presented
    self.selectedGoal = vc.customGoal;
    [self performSegueWithIdentifier:@"Add Custom Goal" sender:self];
}

@end
