//
//  AddGoalTableViewController.h
//  Balancer
//
//  Created by Chris Rovillos on 5/21/13.
//  Copyright (c) 2013 Dian Hartono, Grace Jang, Chris Rovillos, Catriona Scott, Brian Yin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Goal.h"
@class Goal;
@class AddGoalTableViewController;

@protocol AddGoalTableViewControllerDelegate <NSObject>
- (void)addGoalTableViewController:
(AddGoalTableViewController *)controller
                   didSelectGoal:(Goal *)goal;
@end


@interface AddGoalTableViewController : UITableViewController

@property (strong, nonatomic) Goal *goal;

@property (nonatomic, weak) id <AddGoalTableViewControllerDelegate> delegate;

/** The model for this view controller, obtained from the network */

@property (nonatomic, strong) NSArray *availableGoals; // of Goal

- (IBAction)cancel:(UIStoryboardSegue *)segue;
- (IBAction)done:(UIStoryboardSegue *)segue;

@end
