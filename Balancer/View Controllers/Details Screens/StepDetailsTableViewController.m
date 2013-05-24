//
//  StepDetailTableViewController.m
//  Balancer
//
//  Created by Chris Rovillos on 5/21/13.
//  Copyright (c) 2013 Dian Hartono, Grace Jang, Chris Rovillos, Catriona Scott, Brian Yin. All rights reserved.
//

#import "StepDetailsTableViewController.h"

#import "Step.h"

@interface StepDetailsTableViewController ()

@property (weak, nonatomic) IBOutlet UILabel *titleDetailLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionDetailLabel;
@property (weak, nonatomic) IBOutlet UILabel *whenDetailLabel;
@property (weak, nonatomic) IBOutlet UILabel *privacyDetailLabel;
@property (weak, nonatomic) IBOutlet UILabel *goalDetailLabel;
@property (weak, nonatomic) IBOutlet UILabel *joiningDetailLabel;

@end

@implementation StepDetailsTableViewController

- (void)setStep:(Step *)step
{
    _step = step;
    [self configureView];
}

- (void)viewDidLoad {
    [self configureView];
}

- (void)configureView
{
    self.titleDetailLabel.text = self.step.name;
    self.descriptionDetailLabel.text = self.step.description;
    self.whenDetailLabel.text = self.step.startDate.description;
    self.privacyDetailLabel.text = self.step.isPublic ? @"Public" : @"Private";
    if(self.step.goal) {
        self.goalDetailLabel.text = self.step.goal.name;
    } else {
        self.goalDetailLabel.text = @"None";
    }
    self.joiningDetailLabel.text = self.step.inviteList.description;
}

@end
