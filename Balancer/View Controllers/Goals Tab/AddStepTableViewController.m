//
//  AddStepTableViewController.m
//  Balancer
//
//  Created by Chris Rovillos on 5/21/13.
//  Copyright (c) 2013 Dian Hartono, Grace Jang, Chris Rovillos, Catriona Scott, Brian Yin. All rights reserved.
//

#import "AddStepTableViewController.h"
#import "Step.h"
#import "AppDelegate.h"

@implementation AddStepTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSMutableArray *dummyActivities = [[NSMutableArray alloc] init];
    
    for (int i = 1; i <= 10; i++)
    {
        Step *activity = [[Step alloc] init];
        
        activity.activityId = i;
        activity.name = [NSString stringWithFormat:@"Activity %u", activity.activityId];
        activity.startDate = [[NSDate alloc] init]; // sets start date to today
        activity.endDate = [[NSDate alloc] init];
        activity.description = [NSString stringWithFormat:@"This is activity %u.", activity.activityId];
        activity.open = (i % 2) ? YES : NO;
        activity.goal = nil;
        activity.inviteList = nil; //TODO
        
        [dummyActivities addObject:activity];
    }
    
    _availableSteps = dummyActivities;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [_availableSteps count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Available Step";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    cell.textLabel.text = _availableSteps[indexPath.row];
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
	
	NSInteger selectedIndex = indexPath.row;
	UITableViewCell *cell =
    [tableView cellForRowAtIndexPath:indexPath];
	cell.accessoryType = UITableViewCellAccessoryCheckmark;
	Step *activity = [_availableSteps objectAtIndex:indexPath.row];
    
    
    AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    
    [appDelegate.dummyGoals[0] addObject:activity]; //TODO: fix
    
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

@end
