//
//  StepDetailTableViewController.m
//  Balancer
//
//  Created by Chris Rovillos on 5/21/13.
//  Copyright (c) 2013 Dian Hartono, Grace Jang, Chris Rovillos, Catriona Scott, Brian Yin. All rights reserved.
//

#import "StepDetailsTableViewController.h"
#import "Activity.h"

@interface StepDetailsTableViewController ()
@property (weak, nonatomic) IBOutlet UILabel *titleDetailLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionDetailLabel;
@property (weak, nonatomic) IBOutlet UILabel *whenDetailLabel;
@property (weak, nonatomic) IBOutlet UILabel *privacyDetailLabel;
@property (weak, nonatomic) IBOutlet UILabel *goalDetailLabel;
@property (weak, nonatomic) IBOutlet UILabel *joiningDetailLabel;

@end

@implementation StepDetailsTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)setStep:(Activity *)step
{
    _step = step;
    [self configureView];
}

- (void)configureView
{

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
