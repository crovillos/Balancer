//
//  AppDelegate.h
//  Balancer
//
//  Created by Chris Rovillos on 5/3/13.
//  Copyright (c) 2013 Dian Hartono, Grace Jang, Chris Rovillos, Catriona Scott, Brian Yin. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import <RestKit/RestKit.h>
#import <FacebookSDK/FacebookSDK.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) NSMutableArray *dummyGoals;
@property (strong, nonatomic) NSMutableArray *dummyInvites;
@property (strong, nonatomic) NSMutableArray *dummySocialStream;
@property (strong, nonatomic) NSMutableArray *dummySteps;

@property (strong, nonatomic) NSMutableArray *dummyAvailableGoals;
@property (strong, nonatomic) NSMutableArray *dummyAvailableSteps;

@end
