//
//  SocialTableViewController.m
//  Balancer
//
//  Created by Dian Hartono on 5/11/13.
//  Copyright (c) 2013 Dian Hartono, Grace Jang, Chris Rovillos, Catriona Scott, Brian Yin. All rights reserved.
//

#import "SocialTableViewController.h"
#import "Goal.h"
#import "Activity.h"

#define DUMMY_GOALS_COUNT 10
#define DUMMY_GOALS_MAX_CREATOR_ID 100

@interface SocialTableViewController ()

@end

@implementation SocialTableViewController

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
    
    [self createDummyGoals:DUMMY_GOALS_COUNT];
}

/** Sets the model for this view controller.
 @param - The array of Goal objects that comprise the model.
 */
- (void)setGoals:(NSArray *)goals
{
    _socialStream = goals;
    [self.tableView reloadData];
}

#pragma mark - Helper methods

/** Creates dummy goals and sets them to be the model for this view controller. For testing purposes only.
 @param - The number of dummy goals to create.
 */
- (void)createDummyGoals:(NSUInteger)numberOfDummyGoals
{
    NSMutableArray *dummyGoals = [[NSMutableArray alloc] init];
    
    for (int i = 1; i <= numberOfDummyGoals; i++)
    {
        Goal *goal = [[Goal alloc] init];
        goal.goalId = i;
        goal.name = [NSString stringWithFormat:@"Goal %u", goal.goalId];
        goal.completionDate = [[NSDate alloc] init]; // sets completion date to today
        goal.description = [NSString stringWithFormat:@"This is goal %u.", goal.goalId];
        goal.open = (i % 2) ? YES : NO;
        goal.creatorId = arc4random_uniform(DUMMY_GOALS_MAX_CREATOR_ID);
        goal.numberActivitiesForCompletion = 2; // TODO: figure out what this is for?
        goal.activities = nil; // TODO: add later
        goal.inviteList = nil; // TODO: add later
        
        [dummyGoals addObject:goal];
    }
    
    [self setGoals:dummyGoals];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.socialStream count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier;
    NSString *buttonString;
 
    
    if([self.socialStream[indexPath.row] isKindOfClass:[Goal class]]) {
        CellIdentifier = @"Goal";
        buttonString = @"Goal it";
    } else if ([self.socialStream[indexPath.row] isKindOfClass:[Activity class]]) {
        CellIdentifier = @"Activity";
        buttonString = @"Join";
    }
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    UILabel* textLabel = (UILabel *)[cell viewWithTag:2];
    textLabel.text = @"Bob";
    
    UILabel* detailTextLabel = (UILabel *)[cell viewWithTag:3];
    detailTextLabel.text = @"goes to work";
    //NSString *path = [ pathForResource:@"Jazz" ofType:@"png" inDirectory:@"images"];
    
    UIImage* image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Jazz" ofType:@"png"]];
    
   
    UIImageView* imageView = (UIImageView *)[cell viewWithTag:1];
    imageView.image = image;
    if(imageView) {
        NSLog(@"image not found");
    }
    
    UIButton* button = (UIButton*)  [cell viewWithTag:4];
    button.backgroundColor = [UIColor yellowColor];
    UILabel* buttonLabel = button.titleLabel;
    buttonLabel.text = buttonString;
    [button addTarget:self
               action:@selector(addGoal:)
     forControlEvents:UIControlEventTouchUpInside];
    
    return cell;
}

-(void)addGoal:(id)sender {
            NSLog(@"Getting inside caller");
    if([sender isKindOfClass:[UIButton class]]) {
        NSLog(@"Getting inside button");
        UIButton* button = (UIButton* ) sender;
        UITableViewCell* cell = (UITableViewCell*) button.superview;
        //NSIndexPath *indexPath = [(UITableView *)cell.superview indexPathForCell:cell];
        // Add Goal at this index to the goals added page
        button.titleLabel.text = @"added";
        button.backgroundColor = [UIColor greenColor];
        
    }
}

@end
