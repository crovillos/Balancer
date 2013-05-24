//
//  GoalDetailsTableViewController.m
//  Balancer
//
//  Created by Chris Rovillos on 5/21/13.
//  Copyright (c) 2013 Dian Hartono, Grace Jang, Chris Rovillos, Catriona Scott, Brian Yin. All rights reserved.
//

#import "GoalDetailsTableViewController.h"
#import "Goal.h"

@interface GoalDetailsTableViewController ()

@property (weak, nonatomic) IBOutlet UILabel *goalDescriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *completeByLabel;
@property (weak, nonatomic) IBOutlet UILabel *goaledLabel;

@end

@implementation GoalDetailsTableViewController

- (void)setGoal:(Goal *)goal
{
    _goal= goal;
    [self configureView];
}

- (void)configureView
{
    self.goalDescriptionLabel.text = self.goal.description;
    self.completeByLabel.text = self.goal.completionDate.description;
    self.goaledLabel.text = @"Goaled!";
}

@end
