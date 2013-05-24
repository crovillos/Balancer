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
}

@end
