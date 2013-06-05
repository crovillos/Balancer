//
//  StepList.m
//  Balancer
//
//  Created by Dian Hartono on 5/9/13.
//  Copyright (c) 2013 Dian Hartono, Grace Jang, Chris Rovillos, Catriona Scott, Brian Yin. All rights reserved.
//

#import "StepList.h"

@implementation StepList

- (NSArray *)activity
{
    if (!_activity) _activity = [[NSArray alloc] init];
    return _activity;
}

@end
