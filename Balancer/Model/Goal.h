//
//  Goal.h
//  Balancer
//
//  Created by Catriona Scott on 5/9/13.
//  Copyright (c) 2013 Dian Hartono, Grace Jang, Chris Rovillos, Catriona Scott, Brian Yin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Goal : NSObject

@property (nonatomic) NSInteger goalID;
@property (nonatomic, strong) NSString* name;
@property (nonatomic, strong) NSDate* completionDate;
@property (nonatomic, strong) NSString* description;
@property (nonatomic) BOOL open;
@property (nonatomic, strong) NSString* createID;
@property (nonatomic) NSInteger numberActivitiesForCompletion;

@end
