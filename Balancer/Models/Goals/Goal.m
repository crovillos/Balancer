//
//  Goal.m
//  Balancer
//
//  Created by Catriona Scott on 5/9/13.
//  Copyright (c) 2013 Dian Hartono, Grace Jang, Chris Rovillos, Catriona Scott, Brian Yin. All rights reserved.
//

#import "Goal.h"

@implementation Goal

@synthesize goalId, name, completionDate, description, open, creatorId, inviteList, added;

- (NSMutableArray *)activites
{
    if (!_activities) _activities = [[NSMutableArray alloc] init];
    return _activities;
}

@end
