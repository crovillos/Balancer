//
//  TodayTableViewController.m
//  Balancer
//
//  Created by Dian Hartono on 5/11/13.
//  Copyright (c) 2013 Dian Hartono, Grace Jang, Chris Rovillos, Catriona Scott, Brian Yin. All rights reserved.
//

#import "TodayTableViewController.h"
#import "Activity.h"
#import "Goal.h"
#import "InviteList.h"

@interface TodayTableViewController ()

@end

@implementation TodayTableViewController

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

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (void)setActivities:(NSArray *)activity
{
    _activities = activity;
    [self.tableView reloadData];
}

/** Creates dummy activities and sets them to be the model for this view controller. 
 @param - The number of dummy goals to create.
 */
- (void)createDummyGoals:(NSUInteger)numberOfDummyActivities 
{
    NSMutableArray *dummyActivities = [[NSMutableArray alloc] init];
    
    for (int i = 1; i <= numberOfDummyActivities; i++)
    {
        Activity *activity = [[Activity alloc] init];
        activity.activityId = i;
        activity.name = [NSString stringWithFormat:@"Activity %u", activity.activityId];
        activity.startDate = [[NSDate alloc] init]; // sets completion date to today
        activity.endDate = [[NSDate alloc] init];
        activity.description = [NSString stringWithFormat:@"This is activity %u.", activity.activityId];
        activity.open = (i % 2) ? YES : NO;
        activity.creatorId = arc4random_uniform(100);
        activity.goal = [[Goal alloc] init];
        activity.inviteList = nil; // TODO: add later
        
        [dummyActivities addObject:activity];
    }
    
    [self setActivities:dummyActivities];
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
    Activity *activityAtRow = (Activity *)self.activities[row];
    return [activityAtRow.name description];
}

- (NSString *)subtitleForRow:(NSUInteger) row {
    Goal *goalAtRow = (Goal *)self.goals[row];
    return [goalAtRow.description description];
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
