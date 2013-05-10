//
//  Activity.h
//  Balancer
//
//  Created by Dian Hartono on 5/9/13.
//  Copyright (c) 2013 Dian Hartono, Grace Jang, Chris Rovillos, Catriona Scott, Brian Yin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Goal.h"


@interface Activity : NSObject

@property (nonatomic) NSInteger activityID;
@property (nonatomic, strong) NSString* name;
@property (nonatomic, strong) NSDate* startDate;
@property (nonatomic, strong) NSDate* endDate;
@property (nonatomic, strong) NSString* description;
@property (nonatomic) BOOL open;
@property (nonatomic) NSInteger creatorID;
@property (nonatomic, strong) Goal* goal;

@end
