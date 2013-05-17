//
//  GoalsTableViewController.m
//  Balancer
//
//  Created by Chris Rovillos on 5/11/13.
//  Copyright (c) 2013 Dian Hartono, Grace Jang, Chris Rovillos, Catriona Scott, Brian Yin. All rights reserved.
//

#import "GoalsTableViewController.h"
#import "Goal.h"

#define DUMMY_GOALS_COUNT 10
#define DUMMY_GOALS_MAX_CREATOR_ID 100

@implementation GoalsTableViewController

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self createDummyGoals:DUMMY_GOALS_COUNT]; // TODO: remove when networking is implemented
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

#pragma mark - Setters

/** Sets the model for this view controller.
 @param - The array of Goal objects that comprise the model.
 */
- (void)setGoals:(NSArray *)goals
{
    _goals = goals;
    [self.tableView reloadData];
}

#pragma mark - Helper methods

/** Creates dummy goals and sets them to be the model for this view controller. For testing purposes only.
  @param - The number of dummy goals to create.
 */
- (void)createDummyGoals:(NSUInteger)numberOfDummyGoals
{
    NSMutableArray *dummyGoals = [[NSMutableArray alloc] init];
    
    for (int i = 1; i <= numberOfDummyGoals; i++)
    {
        Goal *goal = [[Goal alloc] init];
        goal.goalId = i;
        goal.name = [NSString stringWithFormat:@"Goal %u", goal.goalId];
        goal.completionDate = [[NSDate alloc] init]; // sets completion date to today
        goal.description = [NSString stringWithFormat:@"This is goal %u.", goal.goalId];
        goal.open = (i % 2) ? YES : NO;
        goal.creatorId = arc4random_uniform(DUMMY_GOALS_MAX_CREATOR_ID);
        goal.numberActivitiesForCompletion = 2; // TODO: figure out what this is for?
        goal.activities = nil; // TODO: add later
        goal.inviteList = nil; // TODO: add later
        
        [dummyGoals addObject:goal];
    }
    
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

/** Returns the goal title for a given table row.
 @param - The row number of the goal for which to get the title.
 */
- (NSString *)titleForRow:(NSUInteger) row {
    Goal *goalAtRow = (Goal *)self.goals[row];
    return [goalAtRow.name description];
}

/** Returns the goal subtitle for a given table row.
 @param - The row number of the goal for which to get the subtitle.
 */
- (NSString *)subtitleForRow:(NSUInteger) row {
    Goal *goalAtRow = (Goal *)self.goals[row];
    return [goalAtRow.description description];
}

#pragma mark - Table view delegate


#pragma mark - Segue

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([sender isKindOfClass:[UITableViewCell class]]) {
        NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
        if (indexPath) {
            if ([segue.identifier isEqualToString:@"Show Goal Detail"]) {
                if ([segue.destinationViewController respondsToSelector:@selector(setGoal:)]) {
                    [segue.destinationViewController performSelector:@selector(setGoal:) withObject:((Goal *)self.goals[indexPath.row])];
                }
            }
        }
    }
}

@end
