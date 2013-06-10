//
//  InvitesTableViewController.h
//  Balancer
//
//  Created by Chris Rovillos on 5/23/13.
//  Copyright (c) 2013 Dian Hartono, Grace Jang, Chris Rovillos, Catriona Scott, Brian Yin. All rights reserved.
//

#import "FlatTableViewController.h"
#import "Invite.h"

@interface InvitesTableViewController : FlatTableViewController

@property (nonatomic, strong) NSMutableArray *invites;
@property (nonatomic, strong) Invite* lastSelected;
@property (nonatomic, strong) NSMutableArray *goalsToRemove;
@property (nonatomic, strong) NSMutableArray *stepsToRemove;

@end
