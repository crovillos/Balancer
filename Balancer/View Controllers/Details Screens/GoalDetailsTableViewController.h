//
//  GoalDetailsTableViewController.h
//  Balancer
//
//  Created by Chris Rovillos on 5/21/13.
//  Copyright (c) 2013 Dian Hartono, Grace Jang, Chris Rovillos, Catriona Scott, Brian Yin. All rights reserved.
//

#import "FlatTableViewController.h"

#import "Goal.h"

@interface GoalDetailsTableViewController : FlatTableViewController

@property (nonatomic, strong) Goal *goal;

@end
