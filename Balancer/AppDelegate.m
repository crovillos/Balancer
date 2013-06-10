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
    [self createUsers];
   
    
    
    return YES;
}

- (void) createUsers
{
    _userNames = [[NSMutableArray alloc] init];
    NSString* s0 = @"";
    [self.userNames addObject: @""];
    NSString* s1 = @"Dian";
    [self.userNames addObject: s1];
    NSString* s2 = @"Perry";
    [self.userNames addObject: s2];
    NSString* s3 = @"John";
    [self.userNames addObject: s3];
    NSString* s4 = @"Catriona";
    [self.userNames addObject: s4];
    NSString* s5 = @"Grace";
    [self.userNames addObject: s5];
    NSString* s6 = @"Brian";
    [self.userNames addObject: s6];
    NSString* s7 = @"Facebook";
    [self.userNames addObject: s7];
    NSString* s8 = @"You!";
    [self.userNames addObject: s8];
    NSString* s9 = @"Chris";
    [self.userNames addObject: s9];
}

/** Creates dummy goals and sets them to be the model for this view controller. For testing purposes only. */
- (void)createDummySteps
{
    _dummySteps = [[NSMutableArray alloc] init];
    Step *a4 = [[Step alloc] init];
    a4.activityId = 4;
    a4.name = @"7-mile run";
    a4.description = @"Let's go running outside when it is nice outside";
    a4.startDate = [[NSDate alloc] init];
    a4.endDate = [[NSDate alloc] init];
    a4.open = YES;
    a4.creatorId = 7;
    a4.goal = nil;
    a4.sponsored = YES;
    [self.dummySteps addObject:a4];
    
    Goal *g5 = [[Goal alloc] init];
    g5.goalId = 3;
    g5.name = @"exercise three times";
    g5.description = @"Do something that involves moving my legs";
    g5.completionDate = [[NSDate alloc] init];
    g5.open = YES;
    g5.creatorId = 3;
    g5.inviteList = nil;
    
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
    [self.dummySteps addObject:a1];

    

}

//Shown on the Goals page 
- (void)createDummyGoals
{
    _dummyGoals = [[NSMutableArray alloc] init];
    Goal *g1 = [[Goal alloc] init];
    g1.goalId = 5;
    g1.name = @"Stay up to date with current events";
    g1.completionDate = [[NSDate alloc] init]; // sets completion date to today
    g1.description = @"Read CNN.com or BBC.com anything to keep you in the loop";
    g1.open = YES;
    g1.creatorId = 8;
    
    Step *step1 = [[Step alloc] init];
    step1.activityId = 5;
    step1.name = @"Read an article in Economists";
    step1.description = @"get up to date with new information";
    step1.startDate = [[NSDate alloc] init];
    step1.endDate = [[NSDate alloc] init];
    step1.open = YES;
    step1.creatorId = 8;
    step1.goal = g1;
    [g1.activities addObject:step1];
    
    
    Step *step2 = [[Step alloc] init];
    step2.activityId = 6;
    step2.name = @"Read an article in New York Times";
    step2.description = @"Read interesting articles";
    step2.startDate = [[NSDate alloc] init];
    step2.endDate = [[NSDate alloc] init];
    step2.open = YES;
    step2.creatorId = 8;
    step2.goal = g1;
    [g1.activities addObject:step2];
    
    [self.dummyGoals addObject:g1];
    
    Goal *g2 = [[Goal alloc] init];
    g2.goalId = 6;
    g2.name = @"Discover new restaurants";
    g2.completionDate = [[NSDate alloc] init]; // sets completion date to today
    g2.description = @"don't eat indian all the time";
    g2.open = YES;
    g2.creatorId = 8;
    
    Step *step3 = [[Step alloc] init];
    step3.activityId = 7;
    step3.name = @"Try a new Chinese restaurant";
    step3.description = @"Get some culture in you!";
    step3.startDate = [[NSDate alloc] init];
    step3.endDate = [[NSDate alloc] init];
    step3.open = YES;
    step3.creatorId = 8;
    step3.goal = g2;
    [g2.activities addObject:step3];
    
    Step *step4 = [[Step alloc] init];
    step4.activityId = 8;
    step4.name = @"Ask friends to recommend a restaurant";
    step4.description = @"Find out what's hot to eat in town";
    step4.startDate = [[NSDate alloc] init];
    step4.endDate = [[NSDate alloc] init];
    step4.open = YES;
    step4.creatorId = 8;
    step4.goal = g2;
    [g2.activities addObject:step4];
    
    [self.dummyGoals addObject:g2];

    
 
}

//Used in the invite page 
- (void)createDummyInvites{
    _dummyInvites = [[NSMutableArray alloc] init];

    Step *a1 = [[Step alloc] init];
    a1.activityId = 9;
    a1.name = @"Run 3 miles";
    a1.description = @"Run with us!";
    a1.startDate = [[NSDate alloc] init];
    a1.endDate = [[NSDate alloc] init];
    a1.open = YES;
    a1.creatorId = 2;
    a1.goal = nil;
    StepInvite *aInvite = [[StepInvite alloc] init];
    aInvite.activity = a1;
    aInvite.title = a1.name;
    aInvite.inviteObject = a1;
    [self.dummyInvites addObject:aInvite];
    

    Goal *g1 = [[Goal alloc] init];
    g1.goalId = 7;
    g1.name = @"swim twice a week";
    g1.description = @"Running is boring let's try swimming";
    g1.completionDate = [[NSDate alloc] init];
    g1.open = YES;
    g1.creatorId = 9;
    g1.inviteList = nil;
    GoalInvite *gInvite = [[GoalInvite alloc] init];
    gInvite.goal = g1;
    gInvite.title = a1.name;
    gInvite.inviteObject = a1;
    [self.dummyInvites addObject:gInvite];
    
    Step *a2 = [[Step alloc] init];
    a2.activityId = 9;
    a2.name = @"Take the bus to work once per week";
    a2.description = @"Let's go green!";
    a2.startDate = [[NSDate alloc] init];
    a2.endDate = [[NSDate alloc] init];
    a2.open = YES;
    a2.creatorId = 1;
    a2.goal = nil;
    StepInvite *aInvite1 = [[StepInvite alloc] init];
    aInvite1.activity = a1;
    aInvite1.title = a1.name;
    aInvite1.inviteObject = a1;
    [self.dummyInvites addObject:aInvite1];


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
//Seen in added goals page
- (void)createDummyAvailableGoals {
    _dummyAvailableGoals = [[NSMutableArray alloc] init];
    
    Goal *g2 = [[Goal alloc] init];
    g2.goalId = 4;
    g2.name = @"Early Bird Worm Hun";
    g2.description = @"come to work early (recommended to add a step that accompanies this goal";
    g2.completionDate = [[NSDate alloc] init];
    g2.open = YES;
    g2.creatorId = 7;
    g2.inviteList = nil;
    [self.dummyAvailableGoals addObject:g2];
    
    Goal *g4 = [[Goal alloc] init];
    g4.goalId = 2;
    g4.name = @"Finish 2 chapters";
    g4.description = @"Finish 2 chapter of Fifty Shades of Gray";
    g4.completionDate = [[NSDate alloc] init];
    g4.open = YES;
    g4.creatorId = 2;
    g4.inviteList = nil;
    [self.dummyAvailableGoals addObject:g4];
    
    Goal *g5 = [[Goal alloc] init];
    g5.goalId = 3;
    g5.name = @"exercise three times";
    g5.description = @"Do something that involves moving my legs";
    g5.completionDate = [[NSDate alloc] init];
    g5.open = YES;
    g5.creatorId = 3;
    g5.inviteList = nil;
    [self.dummyAvailableGoals addObject:g5];
    
    Goal *g1 = [[Goal alloc] init];
    g1.goalId = 7;
    g1.name = @"INVITE: Swim twice a week";
    g1.description = @"Running is boring let's try swimming";
    g1.completionDate = [[NSDate alloc] init];
    g1.open = YES;
    g1.creatorId = 9;
    g1.inviteList = nil;
    [self.dummyAvailableGoals addObject:g1];
    
    
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
