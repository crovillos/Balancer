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

@interface AddGoalTableViewController ()

@end

@implementation AddGoalTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)setAvailableGoals:(NSArray *)availableGoals
{
    _availableGoals=  availableGoals;
    [self.tableView reloadData];
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    Goal *goal = [[Goal alloc] init];
    goal.goalId = 1;
    goal.name = [NSString stringWithFormat:@"Hangout with friends twice"];
    goal.completionDate = [[NSDate alloc] init]; // sets completion date to today
    goal.description = [NSString stringWithFormat:@"Spend more time with friends"];
    goal.open = YES;
    goal.creatorId = arc4random_uniform(10);
    goal.numberActivitiesForCompletion = 2;
    
    NSMutableArray *goals = [[NSMutableArray alloc] init];;
    [goals addObject:goal];
    
    [self setAvailableGoals:goals];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
	
	NSInteger selectedIndex = indexPath.row;
	UITableViewCell *cell =
    [tableView cellForRowAtIndexPath:indexPath];
	cell.accessoryType = UITableViewCellAccessoryCheckmark;
	Goal *goal = [self.availableGoals objectAtIndex:indexPath.row];
	[self.delegate addGoalTableViewController:self didSelectGoal:goal];
    
    AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    
    [appDelegate.dummyGoals addObject:goal];
    GoalsTableViewController *presenting = (GoalsTableViewController *)self.presentingViewController.presentingViewController;
    [presenting reloadData];
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
    
}

- (IBAction)cancel:(UIStoryboardSegue *)segue
{
    if ([[segue identifier] isEqualToString:@"CancelInput"]) {
        [self dismissViewControllerAnimated:YES completion:NULL];
    }
}

// called from the add custom goal screen
- (IBAction)done:(UIStoryboardSegue *)segue
{
    if ([[segue identifier] isEqualToString:@"ReturnInput"]) {
        AddCustomGoalTableViewController *addController = [segue sourceViewController];
        if (addController.goal) {
            self.goal = addController.goal;
            AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
            [appDelegate.dummyGoals addObject:self.goal];

            // need to now pass this goal to the main goals screen
        }
        [self dismissViewControllerAnimated:YES completion:NULL];
                    [self.presentingViewController.presentingViewController dismissViewControllerAnimated:YES completion:nil];

    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // nothing?
}

@end
