//
//  SocialAddGoalTableViewController.h
//  Balancer
//
//  Created by Catriona Scott on 5/24/13.
//  Copyright (c) 2013 Dian Hartono, Grace Jang, Chris Rovillos, Catriona Scott, Brian Yin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Step.h"
#import "FlatTableViewController.h"

@interface SocialAddGoalTableViewController : FlatTableViewController

@property (nonatomic, strong) NSArray *goals;
@property (nonatomic, strong) Step *step;
@property (nonatomic, strong) Goal* selectedGoal;

@end
