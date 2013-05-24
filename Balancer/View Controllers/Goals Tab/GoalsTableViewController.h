//
//  GoalsTableViewController.h
//  Balancer
//
//  Created by Chris Rovillos on 5/11/13.
//  Copyright (c) 2013 Dian Hartono, Grace Jang, Chris Rovillos, Catriona Scott, Brian Yin. All rights reserved.
//

#import "FlatTableViewController.h"
#import "AddGoalTableViewController.h"

@interface GoalsTableViewController : FlatTableViewController <AddGoalTableViewControllerDelegate>

/** The model for this view controller, obtained from the network */

@property (nonatomic, strong) NSArray *goals; // of Goal

- (IBAction)cancel:(UIStoryboardSegue *)segue;

- (void) reloadData;

@end
