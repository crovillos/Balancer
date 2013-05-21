//
//  AddCustomGoalTableViewController.h
//  Balancer
//
//  Created by Chris Rovillos on 5/21/13.
//  Copyright (c) 2013 Dian Hartono, Grace Jang, Chris Rovillos, Catriona Scott, Brian Yin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Goal.h"
@class Goal;

@interface AddCustomGoalTableViewController : UITableViewController <UITextFieldDelegate>

@property (strong, nonatomic) Goal *goal;

@end
