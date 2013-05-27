//
//  AddGoalTableViewController.h
//  Balancer
//
//  Created by Chris Rovillos on 5/21/13.
//  Copyright (c) 2013 Dian Hartono, Grace Jang, Chris Rovillos, Catriona Scott, Brian Yin. All rights reserved.
//

#import "FlatTableViewController.h"

#import "Goal.h"

@interface AddGoalTableViewController : FlatTableViewController

@property (strong, nonatomic) Goal *selectedGoal;

@property (nonatomic, strong) NSArray *availableGoals; // of Goal

- (IBAction)addCustomGoal:(UIStoryboardSegue *)segue;

@end
