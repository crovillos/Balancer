//
//  Goal.h
//  Balancer
//
//  Created by Catriona Scott on 5/9/13.
//  Copyright (c) 2013 Dian Hartono, Grace Jang, Chris Rovillos, Catriona Scott, Brian Yin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "InviteList.h"

@interface Goal : NSObject

@property (nonatomic) NSInteger goalID;
@property (nonatomic, strong) NSString* name;
@property (nonatomic, strong) NSDate* completionDate;
@property (nonatomic, strong) NSString* description;
@property (nonatomic) BOOL open;
@property (nonatomic) NSInteger creatorID;
@property (nonatomic) NSInteger numberActivitiesForCompletion;
@property (nonatomic, strong) NSArray* activities;
@property (nonatomic, strong) InviteList* inviteList;

@end
