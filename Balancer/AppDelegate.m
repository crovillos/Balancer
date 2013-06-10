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

#import "UIBarButtonItem+FlatUI.h"
#import "UIColor+Balancer.h"

#define BALANCER_FONT_REGULAR @"Bariol-Regular"
#define BALANCER_FONT_BOLD @"Bariol-Bold"

#define DUMMY_GOALS_MAX_CREATOR_ID 5

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    
    // Set custom font for the title bar
    UIFont *titleTextFont = [UIFont fontWithName:BALANCER_FONT_BOLD size:20.0];
    [[UINavigationBar appearance] setTitleTextAttributes:
     [NSDictionary dictionaryWithObjectsAndKeys:
      titleTextFont,
      UITextAttributeFont,
      nil]];
    
    UIFont *tabBarTextFont = [UIFont fontWithName:BALANCER_FONT_BOLD size:[UIFont smallSystemFontSize]];
    [[UITabBarItem appearance] setTitleTextAttributes:
     [NSDictionary dictionaryWithObjectsAndKeys:
      tabBarTextFont,
      UITextAttributeFont,
      nil] forState:UIControlStateNormal];
    
    UIFont *titleBarButtonTextFont = [UIFont fontWithName:BALANCER_FONT_BOLD size:13.0];
    
    [[UIBarButtonItem appearance] setTitleTextAttributes:
     [NSDictionary dictionaryWithObjectsAndKeys:
      titleBarButtonTextFont,
      UITextAttributeFont,
      nil] forState:UIControlStateNormal];
    
    // Customize buttons in title bar
    [UIBarButtonItem configureFlatButtonsWithColor:[UIColor balancerLightPinkColor]
                                  highlightedColor:[UIColor balancerDarkPinkColor]
                                      cornerRadius:3];
    
    [self createDummyGoals];
    [self createDummyInvites];
    [self createDummySocialStream];
    [self createDummySteps];
    [self createDummyAvailableGoals];
    [self createDummyAvailableSteps];
    
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
    s1.endDate = [[[NSDate alloc] init] dateByAddingTimeInterval: 86400];
    s1.open = YES;
    s1.creatorId = 2;
    s1.goal = nil;
    [_dummySteps addObject:s1];
    
    Step *s2 = [[Step alloc] init];
    s2.activityId = 7;
    s2.name = @"Read 5 Chapters";
    s2.description = @"May 26 (Sun) 2:00PM @ Downtown Seattle";
    s2.startDate = [[NSDate alloc] init];
    s2.endDate = [[[NSDate alloc] init] dateByAddingTimeInterval: 86400];
    //s2.endDate = [NSDate dateWithNaturalLanguageString : @"12/31/01"];
    s2.open = YES;
    s2.creatorId = 2;
    s2.goal = nil;
    [_dummySteps addObject:s2];
    
    Step *s3 = [[Step alloc] init];
    s3.activityId = 8;
    s3.name = @"Jogging";
    s3.description = @"Tomorrow 6:00AM @ Facebook Gym";
    s3.startDate = [[NSDate alloc] init];
    s3.endDate = [[[NSDate alloc] init] dateByAddingTimeInterval: 86400];
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
    goal1.name = @"Get Started With Balancer";
    goal1.completionDate = [[NSDate alloc] init]; // sets completion date to today
    goal1.description = @"Explore each tab and find a goal and step";
    goal1.open = YES;
    goal1.creatorId = arc4random_uniform(DUMMY_GOALS_MAX_CREATOR_ID);
    
    Step *step1 = [[Step alloc] init];
    step1.activityId = 1;
    step1.name = @"Find a goal";
    step1.description = @"Find a goal that fits your needs";
    step1.startDate = [[NSDate alloc] init];
    step1.endDate = [[NSDate alloc] init];
    step1.open = YES;
    step1.creatorId = 1;
    step1.goal = goal1;
    [goal1.activities addObject:step1];
    
    
    Step *step2 = [[Step alloc] init];
    step2.activityId = 1;
    step2.name = @"Find a step";
    step2.description = @"Find a step and step it to your goal";
    step2.startDate = [[NSDate alloc] init];
    step2.endDate = [[NSDate alloc] init];
    step2.open = YES;
    step2.creatorId = 1;
    step2.goal = goal1;
    [goal1.activities addObject:step2];
    
    [self.dummyGoals addObject:goal1];
    /*
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
    [self.dummyGoals addObject:g3];*/
}

- (void)createDummyInvites{
    _dummyInvites = [[NSMutableArray alloc] init];

    Goal *goal = [[Goal alloc] init];
    goal.goalId = 1;
    goal.name = [NSString stringWithFormat:@"Cooking class!"];
    goal.completionDate = [[NSDate alloc] init]; // sets completion date to today
    goal.description = [NSString stringWithFormat:@"I want to learn how to cook!"];
    goal.open = YES;
    goal.creatorId = arc4random_uniform(DUMMY_GOALS_MAX_CREATOR_ID);
    GoalInvite *gInvite1 = [[GoalInvite alloc] init];
    gInvite1.goal = goal;
    gInvite1.title = goal.name;
    gInvite1.inviteObject = goal;
    [self.dummyInvites addObject:gInvite1];
    
    Step *a1 = [[Step alloc] init];
    a1.activityId = 4;
    a1.name = @"Facebook 5k Marathon";
    a1.description = @"Run with us!";
    a1.startDate = [[NSDate alloc] init];
    a1.endDate = [[NSDate alloc] init];
    a1.open = YES;
    a1.creatorId = 4;
    a1.goal = nil;
    StepInvite *aInvite = [[StepInvite alloc] init];
    aInvite.activity = a1;
    aInvite.title = a1.name;
    aInvite.inviteObject = a1;
    [self.dummyInvites addObject:aInvite];
}

/** Creates the dummy social feed. */
- (void)createDummySocialStream
{
    _dummySocialStream = [[NSMutableArray alloc] init];
    Goal *g3 = [[Goal alloc] init];
    g3.goalId = 1;
    g3.name = @"learn to cook a new dish";
    g3.description = @"learn how to make dinner at home";
    g3.completionDate = [[NSDate alloc] init];
    g3.open = YES;
    g3.creatorId = 1;
    g3.inviteList = nil;
    [self.dummySocialStream addObject:g3];
    
    Goal *g4 = [[Goal alloc] init];
    g4.goalId = 2;
    g4.name = @"Finish 2 chapters";
    g4.description = @"Finish 2 chapter of Fifty Shades of Gray";
    g4.completionDate = [[NSDate alloc] init];
    g4.open = YES;
    g4.creatorId = 2;
    g4.inviteList = nil;
    [self.dummySocialStream addObject:g4];
    
    Goal *g5 = [[Goal alloc] init];
    g5.goalId = 3;
    g5.name = @"exercise three times";
    g5.description = @"Do something that involves moving my legs";
    g5.completionDate = [[NSDate alloc] init];
    g5.open = YES;
    g5.creatorId = 3;
    g5.inviteList = nil;
    [self.dummySocialStream addObject:g5];
    
    Step *a1 = [[Step alloc] init];
    a1.activityId = 1;
    a1.name = @"Do hot yoga";
    a1.description = @"It's our monthly hot yoga class for beginners! Take a break from coding and do some yoga!";
    a1.startDate = [[NSDate alloc] init];
    a1.endDate = [[NSDate alloc] init];
    a1.open = YES;
    a1.creatorId = 4;
    a1.goal = g5;
    a1.sponsored = YES;
    [self.dummySocialStream addObject:a1];
    
    
    Step *a2 = [[Step alloc] init];
    a2.activityId = 2;
    a2.name = @"eat a fruit every day";
    a2.description = @"I'm trying to keep track of what I'm eating";
    a2.startDate = [[NSDate alloc] init];
    a2.endDate = [[NSDate alloc] init];
    a2.open = YES;
    a2.creatorId = 5;
    a2.goal = g3;
    a2.sponsored = YES;
    [self.dummySocialStream addObject:a2];
    
    Step *a3 = [[Step alloc] init];
    a3.activityId = 3;
    a3.name = @"ab exercise";
    a3.description = @"Getting toned for the summer!!!";
    a3.startDate = [[NSDate alloc] init];
    a3.endDate = [[NSDate alloc] init];
    a3.open = YES;
    a3.creatorId = 6;
    a3.goal = g5;
    a3.sponsored = YES;
    [self.dummySocialStream addObject:a3];
    
    Step *a4 = [[Step alloc] init];
    a4.activityId = 4;
    a4.name = @"7-mile run";
    a4.description = @"Let's go running outside when it is nice outside";
    a4.startDate = [[NSDate alloc] init];
    a4.endDate = [[NSDate alloc] init];
    a4.open = YES;
    a4.creatorId = 7;
    a4.goal = g5;
    a4.sponsored = YES;
    [self.dummySocialStream addObject:a4];
    
    Goal *g2 = [[Goal alloc] init];
    g2.goalId = 4;
    g2.name = @"Early Bird Worm Hun";
    g2.description = @"come to work early";
    g2.completionDate = [[NSDate alloc] init];
    g2.open = YES;
    g2.creatorId = 7;
    g2.inviteList = nil;
    [self.dummySocialStream addObject:g2];
    
    
}

- (void)createDummyAvailableGoals {
    _dummyAvailableGoals = [[NSMutableArray alloc] init];
    
    Goal *g1 = [[Goal alloc] init];
    g1.goalId = 10;
    g1.name = @"Check in to 80% of the available cafeterias at Facebook!";
    g1.completionDate = [[NSDate alloc] init]; // sets completion date to today
    g1.description = [NSString stringWithFormat:@"Facebook has some great cafeterias, but have you tried them all?"];
    g1.open = YES;
    g1.creatorId = arc4random_uniform(DUMMY_GOALS_MAX_CREATOR_ID);
    g1.inviteList = nil;
    g1.sponsored = YES;
    [self.dummyAvailableGoals addObject:g1];
    
    Goal *g2 = [[Goal alloc] init];
    g2.goalId = 11;
    g2.name = [NSString stringWithFormat:@"Catriona's Goal: Take more micro breaks during the work day"];
    g2.completionDate = [[NSDate alloc] init]; // sets completion date to today
    g2.description = [NSString stringWithFormat:@"I need rest time!"];
    g2.open = YES;
    g2.creatorId = arc4random_uniform(DUMMY_GOALS_MAX_CREATOR_ID);
    g2.inviteList = nil;
    g2.sponsored = NO;
    [self.dummyAvailableGoals addObject:g2];
}

- (void)createDummyAvailableSteps {
    _dummyAvailableSteps = [[NSMutableArray alloc] init];
    
    Step *s1 = [[Step alloc] init];
    s1.activityId = 10;
    s1.name = @"Facebook Early Bird Run!";
    s1.description = @"May 21 (Tue) 8:00AM";
    s1.startDate = [[NSDate alloc] init];
    s1.endDate = [[NSDate alloc] init];
    s1.open = YES;
    s1.creatorId = 2;
    s1.goal = nil;
    s1.sponsored = YES;
    [self.dummyAvailableSteps addObject:s1];
}

@end
