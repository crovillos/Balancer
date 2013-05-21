//
//  AppDelegate.m
//  Balancer
//
//  Created by Chris Rovillos on 5/3/13.
//  Copyright (c) 2013 Dian Hartono, Grace Jang, Chris Rovillos, Catriona Scott, Brian Yin. All rights reserved.
//

#import "AppDelegate.h"
#import "Goal.h"
#import "Activity.h"
#import "GoalInvite.h"
#import "ActivityInvite.h"

#define BALANCER_PINK_RED 166/255.0
#define BALANCER_PINK_GREEN 36/255.0
#define BALANCER_PINK_BLUE 108/255.0

#define BALANCER_FONT_REGULAR @"Bariol-Regular"
#define BALANCER_FONT_BOLD @"Bariol-Bold"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    
    // Set title bar tint color
    UIColor *balancerPinkColor = [UIColor colorWithRed:BALANCER_PINK_RED green:BALANCER_PINK_GREEN blue:BALANCER_PINK_BLUE alpha:1.0];
    [[UINavigationBar appearance] setTintColor:balancerPinkColor];
    
    // Set custom fonts for UILabels
    UIFont *titleTextFont = [UIFont fontWithName:BALANCER_FONT_BOLD size:20.0];
    //UIFont *mainFont = [UIFont fontWithName:BALANCER_FONT_REGULAR size:[UIFont systemFontSize]];
    
    [[UINavigationBar appearance] setTitleTextAttributes:
     [NSDictionary dictionaryWithObjectsAndKeys:
      titleTextFont,
      UITextAttributeFont,
      nil]];
    
    UIImage* tabBarBackground = [UIImage imageNamed:@"tabbar.png"];
    [[UITabBar appearance] setBackgroundImage:tabBarBackground];
    
    //[[UILabel appearance] setFont:mainFont]; // TODO: change; uses deprecated method
    
    [self createDummyGoals:10];
    [self createDummySocial];
    [self createDummyInvites];
    
    return YES;
}

/** Create dummy social */
- (void)createDummySocial{
    _dummySocial = [[NSMutableArray alloc] init];
    Goal *g1 = [[Goal alloc] init];
    g1.goalId = 2;
    g1.name = [NSString stringWithFormat:@"Read the Hunger Games"];
    g1.completionDate = [[NSDate alloc] init]; // sets completion date to today
    g1.description = [NSString stringWithFormat:@"Catch up on some reading"];
    g1.open = YES;
    g1.creatorId = arc4random_uniform(10);
    g1.numberActivitiesForCompletion = 1;
    g1.inviteList = nil;
    [_dummySocial addObject:g1];
    Goal *g2 = [[Goal alloc] init];
    g2.goalId = 3;
    g2.name = [NSString stringWithFormat:@"Hangout with Family"];
    g2.completionDate = [[NSDate alloc] init]; // sets completion date to today
    g2.description = [NSString stringWithFormat:@"Do fun things with your family"];
    g2.open = YES;
    g2.creatorId = arc4random_uniform(10);
    g2.numberActivitiesForCompletion = 2;
    g2.inviteList = nil;
    [_dummySocial addObject:g2];
    Activity *a1 = [[Activity alloc] init];
    a1.activityId = 4;
    a1.name = @"Taking a morning art class";
    a1.description = @"May 21 (Tue) 8:00AM @ HUB";
    a1.startDate = [[NSDate alloc] init];
    a1.endDate = [[NSDate alloc] init];
    a1.open = YES;
    a1.creatorId = 2;
    a1.goal = nil;
    [_dummySocial addObject:a1];
    
}

- (void)createDummyInvites{
    _dummyInvites = [[NSMutableArray alloc] init];
    Goal *goal = [[Goal alloc] init];
    goal.goalId = 1;
    goal.name = [NSString stringWithFormat:@"Hangout with friends twice"];
    goal.completionDate = [[NSDate alloc] init]; // sets completion date to today
    goal.description = [NSString stringWithFormat:@"Spend more time with friends"];
    goal.open = YES;
    goal.creatorId = arc4random_uniform(10);
    goal.numberActivitiesForCompletion = 2;
    GoalInvite *gInvite1 = [[GoalInvite alloc] init];
    gInvite1.goal = goal;
    [_dummyInvites addObject:gInvite1];
    
    Activity *a1 = [[Activity alloc] init];
    a1.activityId = 3;
    a1.name = @"Kicboxing class at the IMA";
    a1.startDate = [[NSDate alloc] init];
    a1.endDate = [[NSDate alloc] init];
    a1.open = YES;
    a1.creatorId = 1;
    a1.goal = nil;
    ActivityInvite *aInvite = [[ActivityInvite alloc] init];
    aInvite.activity = a1;
    [_dummyInvites addObject:aInvite];
    

    
    
    
    
}


/** Creates dummy goals and sets them to be the model for this view controller. For testing purposes only.
 @param - The number of dummy goals to create.
 */
- (void)createDummyGoals:(NSUInteger)numberOfDummyGoals
{
    
    _dummyGoals = [[NSMutableArray alloc] init];
    

    Goal *goal = [[Goal alloc] init];
    goal.goalId = 1;
    goal.name = [NSString stringWithFormat:@"Hangout with friends twice"];
    goal.completionDate = [[NSDate alloc] init]; // sets completion date to today
    goal.description = [NSString stringWithFormat:@"Spend more time with friends"];
    goal.open = YES;
    goal.creatorId = arc4random_uniform(10);
    goal.numberActivitiesForCompletion = 2; // TODO: figure out what this is for?
    //goal.activities = [self createDummyActivities:10 withGoal:goal];
    Activity *activity1 = [[Activity alloc] init];
    activity1.activityId = 1;
    activity1.name = @"Watch movies with friends";
    activity1.startDate = [[NSDate alloc] init];
    activity1.endDate = [[NSDate alloc] init];
    activity1.open = YES;
    activity1.creatorId = 1;
    activity1.goal = goal;
    goal.activities = [[NSMutableArray alloc] init];
    [goal.activities addObject: activity1];
    Activity *activity2 = [[Activity alloc] init];
    activity2.activityId = 1;
    activity2.name = @"Have dinner with friends";
    activity2.startDate = [[NSDate alloc] init];
    activity2.endDate = [[NSDate alloc] init];
    activity2.open = YES;
    activity2.creatorId = 1;
    activity2.goal = goal;
    [goal.activities addObject: activity2];
    goal.inviteList = nil; // TODO: add later
    [_dummyGoals addObject:goal];
    
    Goal *g2 = [[Goal alloc] init];
    g2.goalId = 2;
    g2.name = [NSString stringWithFormat:@"Read 5 acrticles on Economists"];
    g2.completionDate = [[NSDate alloc] init]; // sets completion date to today
    g2.description = [NSString stringWithFormat:@"Be smarter"];
    g2.open = YES;
    g2.creatorId = arc4random_uniform(10);
    g2.numberActivitiesForCompletion = 5;
    g2.inviteList = nil;
    [_dummyGoals addObject:g2];
    
    Goal *g3 = [[Goal alloc] init];
    g3.goalId = 3;
    g3.name = [NSString stringWithFormat:@"Kickboxing once"];
    g3.completionDate = [[NSDate alloc] init]; // sets completion date to today
    g2.description = [NSString stringWithFormat:@"Learn how to defend yourself"];
    g3.open = YES;
    g3.creatorId = arc4random_uniform(10);
    g2.numberActivitiesForCompletion = 1;
    Activity *a1 = [[Activity alloc] init];
    a1.activityId = 3;
    a1.name = @"Kicboxing class at the IMA";
    a1.startDate = [[NSDate alloc] init];
    a1.endDate = [[NSDate alloc] init];
    a1.open = YES;
    a1.creatorId = 1;
    a1.goal = g3;
    g3.activities = [[NSMutableArray alloc] init];
    [g3.activities addObject: a1];
    g3.inviteList = nil;
    [_dummyGoals addObject:g3];


}

- (NSArray*) createDummyActivities:(NSUInteger)numberOfDummyActivities withGoal:(Goal*)goal
{
    NSMutableArray *dummyActivities = [[NSMutableArray alloc] init];
    
    for (int i = 1; i <= numberOfDummyActivities; i++)
    {
        Activity *activity = [[Activity alloc] init];
        
        activity.activityId = i;
        activity.name = [NSString stringWithFormat:@"Activity %u", activity.activityId];
        activity.startDate = [[NSDate alloc] init]; // sets start date to today
        activity.endDate = [[NSDate alloc] init];
        activity.description = [NSString stringWithFormat:@"This is activity %u.", activity.activityId];
        activity.open = (i % 2) ? YES : NO;
        activity.goal = goal;
        activity.inviteList = nil; //TODO
        
        [dummyActivities addObject:activity];
    }
    
    return dummyActivities;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
