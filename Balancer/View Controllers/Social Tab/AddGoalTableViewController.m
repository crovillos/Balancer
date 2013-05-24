//
//  AddGoalTableViewController.m
//  Balancer
//
//  Created by Catriona Scott on 5/24/13.
//  Copyright (c) 2013 Dian Hartono, Grace Jang, Chris Rovillos, Catriona Scott, Brian Yin. All rights reserved.
//

#import "AddGoalTableViewController.h"
#import "AppDelegate.h"
#import "Goal.h"

@implementation AddGoalTableViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    
    [self setGoals:appDelegate.dummyGoals];

}

- (void)setGoals:(NSArray *)goals
{
    _goals = goals;
    [self.tableView reloadData];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.goals count];
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
    if ([[segue identifier] isEqualToString:@"DoneInput"]) {
        [self dismissViewControllerAnimated:YES completion:NULL];
    }
}

@end
