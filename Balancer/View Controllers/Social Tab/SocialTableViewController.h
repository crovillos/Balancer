//
//  SocialTableViewController.h
//  Balancer
//
//  Created by Dian Hartono on 5/11/13.
//  Copyright (c) 2013 Dian Hartono, Grace Jang, Chris Rovillos, Catriona Scott, Brian Yin. All rights reserved.
//

#import "Step.h"

@interface SocialTableViewController : UITableViewController

/** The model for this view controller, obtained from the network */
@property (nonatomic, strong) NSMutableArray *socialStream; // of Goal
@property (nonatomic, strong) Step* lastSelected;
@property (nonatomic, strong) UITableViewCell* header;
@property (nonatomic, strong) NSMutableArray *goalsToRemove;
@property (nonatomic, strong) NSMutableArray *stepsToRemove;
@property (nonatomic) BOOL stepJustAdded;
@end
