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
    
    //[[UILabel appearance] setFont:mainFont]; // TODO: change; uses deprecated method
    
    [self createDummyGoals:10];
    
    return YES;
}

/** Creates dummy goals and sets them to be the model for this view controller. For testing purposes only.
 @param - The number of dummy goals to create.
 */
- (void)createDummyGoals:(NSUInteger)numberOfDummyGoals
{
    
    _dummyGoals = [[NSMutableArray alloc] init];
    
    for (int i = 1; i <= numberOfDummyGoals; i++)
    {
        Goal *goal = [[Goal alloc] init];
        goal.goalId = i;
        goal.name = [NSString stringWithFormat:@"Goal %u", goal.goalId];
        goal.completionDate = [[NSDate alloc] init]; // sets completion date to today
        goal.description = [NSString stringWithFormat:@"This is goal %u.", goal.goalId];
        goal.open = (i % 2) ? YES : NO;
        goal.creatorId = arc4random_uniform(10);
        goal.numberActivitiesForCompletion = 2; // TODO: figure out what this is for?
        
        
        goal.activities = [self createDummyActivities:10 withGoal:goal];
        goal.inviteList = nil; // TODO: add later
        
        [_dummyGoals addObject:goal];
    }
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
