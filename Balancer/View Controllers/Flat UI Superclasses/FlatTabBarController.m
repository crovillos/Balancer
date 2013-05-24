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
    [tabBarItem1 setFinishedSelectedImage:[UIImage imageNamed:@"Social.png"] withFinishedUnselectedImage:[UIImage imageNamed:@"Social.png"]];
    [tabBarItem2 setFinishedSelectedImage:[UIImage imageNamed:@"Goals.png"] withFinishedUnselectedImage:[UIImage imageNamed:@"Goals.png"]];
    [tabBarItem3 setFinishedSelectedImage:[UIImage imageNamed:@"Today.png"] withFinishedUnselectedImage:[UIImage imageNamed:@"Today.png"]];
    [tabBarItem4 setFinishedSelectedImage:[UIImage imageNamed:@"Progress.png"] withFinishedUnselectedImage:[UIImage imageNamed:@"Progress.png"]];
}

@end
