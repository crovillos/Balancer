//
//  GoalDetailViewController.m
//  Balancer
//
//  Created by Chris Rovillos on 5/14/13.
//  Copyright (c) 2013 Dian Hartono, Grace Jang, Chris Rovillos, Catriona Scott, Brian Yin. All rights reserved.
//

#import "GoalDetailViewController.h"

@interface GoalDetailViewController ()
@property (weak, nonatomic) IBOutlet UILabel *goalDescriptionLabel;

@end

@implementation GoalDetailViewController

- (void)setGoal:(Goal *)goal
{
    _goal= goal;
    [self reloadData];
}

- (void)reloadData
{
    [self.goalDescriptionLabel setText:self.goal];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
