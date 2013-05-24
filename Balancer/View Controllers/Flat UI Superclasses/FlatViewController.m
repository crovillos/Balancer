//
//  FlatViewController.m
//  Balancer
//
//  Created by Chris Rovillos on 5/23/13.
//  Copyright (c) 2013 Dian Hartono, Grace Jang, Chris Rovillos, Catriona Scott, Brian Yin. All rights reserved.
//

#import "FlatViewController.h"

#import "UINavigationBar+FlatUI.h"
#import "UIColor+Balancer.h"

@implementation FlatViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    [self.navigationController.navigationBar configureFlatNavigationBarWithColor:[UIColor balancerPinkColor]];
}

@end
