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
#import "AppDelegate.h"

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
    
    [self setGoals];
}

/** Sets the model for this view controller.
 @param - The array of Goal objects that comprise the model.
 */
- (void)setGoals
{
    AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
   _socialStream = appDelegate.dummyGoals;
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    if (section) {
        return [self.socialStream count];
    } else {
        return 1;
    }

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    if (!indexPath.section) {

        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Invitations" forIndexPath:indexPath];

        UILabel* textLabel = (UILabel *)[cell viewWithTag:0];
        textLabel.text = @"Invitations";
        return cell;
    } else {
        static NSString *CellIdentifier;
        NSString* buttonString;
        NSString* labelText;
        NSString* detailLabelText;
        if([self.socialStream[indexPath.row] isKindOfClass:[Goal class]]) {
            Goal* g = (Goal*) self.socialStream[indexPath.row];
            CellIdentifier = @"Goal";
            buttonString = @"Goal it";
            labelText = g.name;
            detailLabelText = g.description;
        } else if ([self.socialStream[indexPath.row] isKindOfClass:[Activity class]]) {
            Activity* a = (Activity*) self.socialStream[indexPath.row];
            CellIdentifier = @"Activity";
            buttonString = @"Join";
            labelText = a.name;
            detailLabelText = a.description;
        }
    
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
        // Configure the cell...
        UILabel* textLabel = (UILabel *)[cell viewWithTag:2];
        textLabel.text = labelText;
        
        UILabel* detailTextLabel = (UILabel *)[cell viewWithTag:3];
        detailTextLabel.text = detailLabelText;
    
        UIImage* image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Jazz" ofType:@"png"]];
    
   
        UIImageView* imageView = (UIImageView *)[cell viewWithTag:1];
        imageView.image = image;
    
        UIButton* button = (UIButton*)  [cell viewWithTag:4];

        UILabel* buttonLabel = button.titleLabel;
        button.backgroundColor = [UIColor yellowColor];
        buttonLabel.text = buttonString;
        [button addTarget:self
                   action:@selector(addGoal:)
         forControlEvents:UIControlEventTouchUpInside];
    
        return cell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 88;
}

-(void)addGoal:(id)sender {
    if([sender isKindOfClass:[UIButton class]]) {
        UIButton* button = (UIButton* ) sender;
        UITableViewCell* cell = (UITableViewCell*) button.superview;
        //NSIndexPath *indexPath = [(UITableView *)cell.superview indexPathForCell:cell];
        // Add Goal at this index to the goals added page
        button.backgroundColor = [UIColor greenColor];
        button.titleLabel.text = @"added";
        
        
    }
}

-(void)joinActivity:(id)sender {
    
    
}

@end
