//
//  FlatNavigationControllerViewController.m
//  Balancer
//
//  Created by Chris Rovillos on 5/23/13.
//  Copyright (c) 2013 Dian Hartono, Grace Jang, Chris Rovillos, Catriona Scott, Brian Yin. All rights reserved.
//

#import "FlatTabBarController.h"

#import "UITabBar+FlatUI.h"
#import "UIColor+Balancer.h"

@implementation FlatTabBarController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    [self.tabBar configureFlatTabBarWithColor:[UIColor balancerPinkColor]
                                selectedColor:[UIColor balancerDarkPinkColor]];
    self.tabBar.selectedImageTintColor = [UIColor whiteColor];
    self.tabBar.shadowImage = [[UIImage alloc] init];
    
    UITabBarItem *tabBarItem1 = [self.tabBar.items objectAtIndex:0];
    UITabBarItem *tabBarItem2 = [self.tabBar.items objectAtIndex:1];
    UITabBarItem *tabBarItem3 = [self.tabBar.items objectAtIndex:2];
    UITabBarItem *tabBarItem4 = [self.tabBar.items objectAtIndex:3];
    
    // overrides storyboard
    [tabBarItem1 setFinishedSelectedImage:[UIImage imageNamed:@"social_icon.png"] withFinishedUnselectedImage:[UIImage imageNamed:@"social_icon.png"]];
    [tabBarItem2 setFinishedSelectedImage:[UIImage imageNamed:@"goals_icon.png"] withFinishedUnselectedImage:[UIImage imageNamed:@"goals_icon.png"]];
    [tabBarItem3 setFinishedSelectedImage:[UIImage imageNamed:@"today_logo.png"] withFinishedUnselectedImage:[UIImage imageNamed:@"today_logo.png"]];
    [tabBarItem4 setFinishedSelectedImage:[UIImage imageNamed:@"progress_icon.png"] withFinishedUnselectedImage:[UIImage imageNamed:@"progress_icon.png"]];
}

@end
