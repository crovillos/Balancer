//
//  GoalsTableViewController.m
//  Balancer
//
//  Created by Chris Rovillos on 5/11/13.
//  Copyright (c) 2013 Dian Hartono, Grace Jang, Chris Rovillos, Catriona Scott, Brian Yin. All rights reserved.
//

#import "GoalsTableViewController.h"
#import "Goal.h"
#import "Activity.h"
#import "AppDelegate.h" //TODO: remove

#import "DTCustomColoredAccessory.h"

#define DUMMY_GOALS_COUNT 10
#define DUMMY_GOALS_MAX_CREATOR_ID 100

@interface GoalsTableViewController()
@property (nonatomic, strong) NSMutableIndexSet *expandedSections;

@end

@implementation GoalsTableViewController

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    
    [self setGoals:appDelegate.dummyGoals];
    
    if (!_expandedSections)
    {
        _expandedSections = [[NSMutableIndexSet alloc] init];
    }
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

#pragma mark - Expanding

- (BOOL)tableView:(UITableView *)tableView canCollapseSection:(NSInteger)section
{
    return YES;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([self tableView:tableView canCollapseSection:indexPath.section])
    {
        if (!indexPath.row) // indexPath.row == 0; the first row
        {
            return 100;
        }
        else
        {
            // all other rows
            return 44;
        }
    }
    else
    {
        return 44;
        
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.goals count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if ([self tableView:tableView canCollapseSection:section])
    {
        if ([self.expandedSections containsIndex:section])
        {
            Goal *goal = (Goal*)self.goals[section];
            
            return [goal.activities count] + 1; // return rows when expanded
        }
        
        return 1; // only top row showing
    }
    
    // Return the number of rows in the section.
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *GoalCellIdentifier = @"Goal";
    static NSString *StepCellIdentifier = @"Step";
    
    UITableViewCell *cell;
    
    // Configure the cell...
    
    if ([self tableView:tableView canCollapseSection:indexPath.section])
    {
        if (!indexPath.row) // indexPath.row == 0; the first row
        {
            cell = [tableView dequeueReusableCellWithIdentifier:GoalCellIdentifier];
            assert(cell != nil);
            
            
            UILabel *goalLabel = (UILabel *)[cell viewWithTag:999];
            UIButton *addButton = (UIButton *)[cell viewWithTag:1];
            UIButton *editButton = (UIButton *)[cell viewWithTag:2];
            UIButton *searchButton = (UIButton *)[cell viewWithTag:3];
            
            goalLabel.text = [self titleForGoalAtSection:indexPath.section];
            
            // [btn addTarget:self action:@selector(onClicked:) forControlEvents:UIControlEventTouchUpInside];
            
            if ([self.expandedSections containsIndex:indexPath.section])
            {
                //    cell.accessoryView = [DTCustomColoredAccessory accessoryWithColor:[UIColor grayColor] type:DTCustomColoredAccessoryTypeUp];
            }
            else
            {
                //   cell.accessoryView = [DTCustomColoredAccessory accessoryWithColor:[UIColor grayColor] type:DTCustomColoredAccessoryTypeDown];
            }
        }
        else
        {
            cell = [tableView dequeueReusableCellWithIdentifier:StepCellIdentifier];
            // all other rows
            Goal *goalAtSection = (Goal *)self.goals[indexPath.section];
            // have activity id row within goal section
            Activity *activityAtRow = (Activity *)goalAtSection.activities[indexPath.row - 1];
            cell.textLabel.text = activityAtRow.name;
        }
    }
    else
    {
        cell = [tableView dequeueReusableCellWithIdentifier:StepCellIdentifier];
        cell.textLabel.text = @"Normal Cell";
        
    }
    
    return cell;
    //static NSString *CellIdentifier = @"Goal";
    //UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    //cell.textLabel.text = [self titleForRow:indexPath.row];
    //cell.detailTextLabel.text = [self subtitleForRow:indexPath.row];
    
    //return cell;
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self tableView:tableView canCollapseSection:indexPath.section])
    {
        if (!indexPath.row)
        {
            [self.tableView beginUpdates];
            
            // only first row toggles exapand/collapse
            [tableView deselectRowAtIndexPath:indexPath animated:YES];
            
            NSInteger section = indexPath.section;
            BOOL currentlyExpanded = [self.expandedSections containsIndex:section];
            NSInteger rows;
            
            NSMutableArray *tmpArray = [NSMutableArray array];
            
            if (currentlyExpanded)
            {
                rows = [self tableView:tableView numberOfRowsInSection:section];
                [self.expandedSections removeIndex:section];
                
            }
            else
            {
                [self.expandedSections addIndex:section];
                rows = [self tableView:tableView numberOfRowsInSection:section];
            }
            
            for (int i=1; i<rows; i++)
            {
                NSIndexPath *tmpIndexPath = [NSIndexPath indexPathForRow:i inSection:section];
                [tmpArray addObject:tmpIndexPath];
            }
            
            UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
            
            if (currentlyExpanded)
            {
                [tableView deleteRowsAtIndexPaths:tmpArray
                                 withRowAnimation:UITableViewRowAnimationTop];
                
                cell.accessoryView = [DTCustomColoredAccessory accessoryWithColor:[UIColor grayColor] type:DTCustomColoredAccessoryTypeDown];
                
            }
            else
            {
                [tableView insertRowsAtIndexPaths:tmpArray
                                 withRowAnimation:UITableViewRowAnimationTop];
                cell.accessoryView =  [DTCustomColoredAccessory accessoryWithColor:[UIColor grayColor] type:DTCustomColoredAccessoryTypeUp];
                
            }
            
            [self.tableView endUpdates];
        }
    }
}

/** Returns the goal title for a given table row.
 @param - The row number of the goal for which to get the title.
 */
- (NSString *)titleForGoalAtSection:(NSUInteger) section {
    Goal *goalAtRow = (Goal *)self.goals[section];
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
            if ([segue.identifier isEqualToString:@"Show Goal Details"]) {
                if ([segue.destinationViewController respondsToSelector:@selector(setGoal:)]) {
                    [segue.destinationViewController performSelector:@selector(setGoal:) withObject:((Goal *)self.goals[indexPath.row])];
                }
            }
            if ([segue.identifier isEqualToString:@"Add Goal"])
            {
                //TODO
            }
            if ([segue.identifier isEqualToString:@"Edit Goal"])
            {
                if ([segue.destinationViewController respondsToSelector:@selector(setGoal:)]) {
                    [segue.destinationViewController performSelector:@selector(setGoal:) withObject:((Goal *)self.goals[indexPath.row])];
                }
                //UINavigationController *navigationController =
                ////segue.destinationViewController;
                //PlayerDetailsViewController
                //*playerDetailsViewController =
                //[[navigationController viewControllers]
                // objectAtIndex:0];
                //playerDetailsViewController.delegate = self;
            }
        }
    }
    
}

@end
