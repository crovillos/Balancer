//
//  GoalList.m
//  Balancer
//
//  Created by Dian Hartono on 5/9/13.
//  Copyright (c) 2013 Dian Hartono, Grace Jang, Chris Rovillos, Catriona Scott, Brian Yin. All rights reserved.
//

#import "GoalList.h"

@implementation GoalList

- (NSArray *)goals
{
    if (!_goals) _goals = [[NSArray alloc] init];
    return _goals;
}

@end
