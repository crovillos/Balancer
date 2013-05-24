//
//  AppDelegate.m
//  Balancer
//
//  Created by Chris Rovillos on 5/3/13.
//  Copyright (c) 2013 Dian Hartono, Grace Jang, Chris Rovillos, Catriona Scott, Brian Yin. All rights reserved.
//

#import "AppDelegate.h"
#import "Goal.h"
#import "Step.h"
#import "GoalInvite.h"
#import "StepInvite.h"

#define BALANCER_PINK_RED 166/255.0
#define BALANCER_PINK_GREEN 36/255.0
#define BALANCER_PINK_BLUE 108/255.0

#define BALANCER_FONT_REGULAR @"Bariol-Regular"
#define BALANCER_FONT_BOLD @"Bariol-Bold"

#define DUMMY_GOALS_MAX_CREATOR_ID 100

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    
    // Set title bar tint color
    UIColor *balancerPinkColor = [UIColor colorWithRed:BALANCER_PINK_RED green:BALANCER_PINK_GREEN blue:BALANCER_PINK_BLUE alpha:1.0];
    [[UINavigationBar appearance] setTintColor:balancerPinkColor];
    
    // Set custom font for the title bar
    UIFont *titleTextFont = [UIFont fontWithName:BALANCER_FONT_BOLD size:20.0];
    [[UINavigationBar appearance] setTitleTextAttributes:
     [NSDictionary dictionaryWithObjectsAndKeys:
      titleTextFont,
      UITextAttributeFont,
      nil]];
    
    [self createDummyGoals];
    [self createDummyInvites];
    [self createDummySocialStream];
    [self createDummySteps];
    
    return YES;
}

/** Creates dummy goals and sets them to be the model for this view controller. For testing purposes only. */
- (void)createDummySteps
{
    _dummySteps = [[NSMutableArray alloc] init];
    Step *s1 = [[Step alloc] init];
    s1.activityId = 6;
    s1.name = @"Cooking Class";
    s1.description = @"May 27 (Sat) 11:00AM @ HUB 441";
    s1.startDate = [[NSDate alloc] init];
    s1.endDate = [[NSDate alloc] init];
    s1.open = YES;
    s1.creatorId = 2;
    s1.goal = nil;
    [_dummySteps addObject:s1];
    
    Step *s2 = [[Step alloc] init];
    s2.activityId = 7;
    s2.name = @"Read 5 Chapters";
    s2.description = @"May 26 (Sun) 2:00PM @ Downtown Seattle";
    s2.startDate = [[NSDate alloc] init];
    s2.endDate = [[NSDate alloc] init];
    s2.open = YES;
    s2.creatorId = 2;
    s2.goal = nil;
    [_dummySteps addObject:s2];
    
    Step *s3 = [[Step alloc] init];
    s3.activityId = 8;
    s3.name = @"Jogging";
    s3.description = @"Tomorrow 6:00AM @ Facebook Gym";
    s3.startDate = [[NSDate alloc] init];
    s3.endDate = [[NSDate alloc] init];
    s3.open = YES;
    s3.creatorId = 4;
    s3.goal = nil;
    [_dummySteps addObject:s3];
    
    
    
}

- (void)createDummyGoals
{
    _dummyGoals = [[NSMutableArray alloc] init];
    
    Goal *goal1 = [[Goal alloc] init];
    goal1.goalId = 1;
    goal1.name = @"Hangout with friends often";
    goal1.completionDate = [[NSDate alloc] init]; // sets completion date to today
    goal1.description = @"Spend more time with friends";
    goal1.open = YES;
    goal1.creatorId = arc4random_uniform(DUMMY_GOALS_MAX_CREATOR_ID);
    
    Step *goal1Activity1 = [[Step alloc] init];
    goal1Activity1.activityId = 1;
    goal1Activity1.name = @"Watch a movie";
    goal1Activity1.description = @"I want to watch a movie!";
    goal1Activity1.startDate = [[NSDate alloc] init];
    goal1Activity1.endDate = [[NSDate alloc] init];
    goal1Activity1.open = YES;
    goal1Activity1.creatorId = 1;
    goal1Activity1.goal = goal1;
    
    goal1.activities = [[NSMutableArray alloc] init];
    [goal1.activities addObject: goal1Activity1];
    Step *activity2 = [[Step alloc] init];
    activity2.activityId = 2;
    activity2.name = @"Have dinner with friends";
    activity2.startDate = [[NSDate alloc] init];
    activity2.endDate = [[NSDate alloc] init];
    activity2.description = @"May 25 (Fri) 6:00PM @ Cheesecake Factory";
    activity2.open = YES;
    activity2.creatorId = 1;
    activity2.goal = goal1;
    [goal1.activities addObject: activity2];
    goal1.inviteList = nil; // TODO: add later
    [self.dummyGoals addObject:goal1];
    
    Goal *g2 = [[Goal alloc] init];
    g2.goalId = 2;
    g2.name = [NSString stringWithFormat:@"Read the Economist"];
    g2.completionDate = [[NSDate alloc] init]; // sets completion date to today
    g2.description = [NSString stringWithFormat:@"Be smarter"];
    g2.open = YES;
    g2.creatorId = arc4random_uniform(DUMMY_GOALS_MAX_CREATOR_ID);
    g2.inviteList = nil;
    [self.dummyGoals addObject:g2];
    
    Goal *g3 = [[Goal alloc] init];
    g3.goalId = 3;
    g3.name = [NSString stringWithFormat:@"Kickboxing once"];
    g3.completionDate = [[NSDate alloc] init]; // sets completion date to today
    g2.description = [NSString stringWithFormat:@"Learn how to defend yourself"];
    g3.open = YES;
    g3.creatorId = arc4random_uniform(DUMMY_GOALS_MAX_CREATOR_ID);
    Step *a1 = [[Step alloc] init];
    a1.activityId = 3;
    a1.name = @"Kicboxing Class";
    a1.description = @"May 24 (Thur) 5:00PM @ Facebook Gym";
    a1.startDate = [[NSDate alloc] init];
    a1.endDate = [[NSDate alloc] init];
    a1.open = YES;
    a1.creatorId = 1;
    a1.goal = g3;
    g3.activities = [[NSMutableArray alloc] init];
    [g3.activities addObject: a1];
    g3.inviteList = nil;
    [self.dummyGoals addObject:g3];
}

- (void)createDummyInvites{
    _dummyInvites = [[NSMutableArray alloc] init];
    
    Goal *goal = [[Goal alloc] init];
    goal.goalId = 1;
    goal.name = [NSString stringWithFormat:@"Hangout with friends twice"];
    goal.completionDate = [[NSDate alloc] init]; // sets completion date to today
    goal.description = [NSString stringWithFormat:@"Spend more time with friends"];
    goal.open = YES;
    goal.creatorId = arc4random_uniform(DUMMY_GOALS_MAX_CREATOR_ID);
    GoalInvite *gInvite1 = [[GoalInvite alloc] init];
    gInvite1.goal = goal;
    [self.dummyInvites addObject:gInvite1];
    
    Step *a1 = [[Step alloc] init];
    a1.activityId = 4;
    a1.name = @"Kicboxing class";
    a1.description = @"May 27 (Sun) 6:00PM @ IMA";
    a1.startDate = [[NSDate alloc] init];
    a1.endDate = [[NSDate alloc] init];
    a1.open = YES;
    a1.creatorId = 4;
    a1.goal = nil;
    StepInvite *aInvite = [[StepInvite alloc] init];
    aInvite.activity = a1;
    [self.dummyInvites addObject:aInvite];
}

/** Creates the dummy social feed. */
- (void)createDummySocialStream
{
    _dummySocialStream = [[NSMutableArray alloc] init];
    
    Goal *g1 = [[Goal alloc] init];
    g1.goalId = 2;
    g1.name = [NSString stringWithFormat:@"Read the Hunger Games Read the Hunger Games Read the Hunger Games Read the Hunger Games Read the Hunger Games Read the Hunger Games Read the Hunger Games Read the Hunger Games Read the Hunger Games Read the Hunger Games Read the Hunger Games Read the Hunger Games Read the Hunger Games Read the Hunger Games Read the Hunger Games Read the Hunger Games"];
    g1.completionDate = [[NSDate alloc] init]; // sets completion date to today
    g1.description = [NSString stringWithFormat:@"Catch up on some reading"];
    g1.open = YES;
    g1.creatorId = arc4random_uniform(DUMMY_GOALS_MAX_CREATOR_ID);
    g1.inviteList = nil;
    [self.dummySocialStream addObject:g1];
    Goal *g2 = [[Goal alloc] init];
    g2.goalId = 3;
    g2.name = [NSString stringWithFormat:@"Hangout with Family"];
    g2.completionDate = [[NSDate alloc] init]; // sets completion date to today
    g2.description = [NSString stringWithFormat:@"Do fun things with your family"];
    g2.open = YES;
    g2.creatorId = arc4random_uniform(DUMMY_GOALS_MAX_CREATOR_ID);
    g2.inviteList = nil;
    g2.sponsored = YES;
    [self.dummySocialStream addObject:g2];
    Step *a1 = [[Step alloc] init];
    a1.activityId = 5;
    a1.name = @"Taking a morning art class";
    a1.description = @"May 21 (Tue) 8:00AM @ HUB";
    a1.startDate = [[NSDate alloc] init];
    a1.endDate = [[NSDate alloc] init];
    a1.open = YES;
    a1.creatorId = 2;
    a1.goal = nil;
    [self.dummySocialStream addObject:a1];
}

@end
