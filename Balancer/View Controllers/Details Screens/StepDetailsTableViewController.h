//
//  StepDetailTableViewController.h
//  Balancer
//
//  Created by Chris Rovillos on 5/21/13.
//  Copyright (c) 2013 Dian Hartono, Grace Jang, Chris Rovillos, Catriona Scott, Brian Yin. All rights reserved.
//

#import "FlatTableViewController.h"

#import "Step.h"

@interface StepDetailsTableViewController : FlatTableViewController

@property (nonatomic, strong) Step *step;

@end
