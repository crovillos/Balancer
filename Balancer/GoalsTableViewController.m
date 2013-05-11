//
//  GoalsTableViewController.m
//  Balancer
//
//  Created by Chris Rovillos on 5/11/13.
//  Copyright (c) 2013 Dian Hartono, Grace Jang, Chris Rovillos, Catriona Scott, Brian Yin. All rights reserved.
//

#import "GoalsTableViewController.h"
#import "Goal.h"

@implementation GoalsTableViewController

// Sets the model
- (void)setGoals:(NSArray *)goals
{
    _goals = goals;
    [self.tableView reloadData];
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // create the dummy goal data and add it
    Goal *goal1 = [[Goal alloc] init];
    goal1.goalID = 0;
    goal1.name = @"Goal 1";
    goal1.completionDate = [[NSDate alloc] init];
    goal1.description = @"This is goal 1.";
    goal1.open = YES;
    goal1.creatorID = 1;
    goal1.numberActivitiesForCompletion = 2;
    goal1.activities = nil; //TODO: add later
    goal1.inviteList = nil; //TODO: add later
    
    Goal *goal2 = [[Goal alloc] init];
    goal2.goalID = 0;
    goal2.name = @"Goal 2";
    goal2.completionDate = [[NSDate alloc] init];
    goal2.description = @"This is goal 2.";
    goal2.open = YES;
    goal2.creatorID = 1;
    goal2.numberActivitiesForCompletion = 2;
    goal2.activities = nil; //TODO: add later
    goal2.inviteList = nil; //TODO: add later
    
    NSArray *dummyGoals = [[NSArray alloc] initWithObjects:goal1, goal2, nil];
    [self setGoals:dummyGoals];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.goals count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Goal";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    cell.textLabel.text = [self titleForRow:indexPath.row];
    cell.detailTextLabel.text = [self subtitleForRow:indexPath.row];
    
    return cell;
}

- (NSString *)titleForRow:(NSUInteger) row {
    Goal *goalAtRow = (Goal *)self.goals[row];
    return [goalAtRow.name description];
}

- (NSString *)subtitleForRow:(NSUInteger) row {
    Goal *goalAtRow = (Goal *)self.goals[row];
    return [goalAtRow.name description];
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

@end
