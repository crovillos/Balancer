//
//  SocialTableViewController.m
//  Balancer
//
//  Created by Dian Hartono on 5/11/13.
//  Copyright (c) 2013 Dian Hartono, Grace Jang, Chris Rovillos, Catriona Scott, Brian Yin. All rights reserved.
//

#import "SocialTableViewController.h"
#import "Goal.h"
#import "Step.h"
#import "AppDelegate.h"

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
    
    AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    NSMutableArray *dummySocialStream = appDelegate.dummySocialStream;
    
    [self setSocialStream:dummySocialStream];
}

/** Sets the model for this view controller.
 @param - 
 */
- (void)setGoals:(NSMutableArray *)socialStream
{
    _socialStream = socialStream;
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
            
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
            UIButton *goalItButton = [UIButton buttonWithType:UIButtonTypeCustom];
            
            [goalItButton setTitle:@"Goal it!" forState:UIControlStateNormal];
            [goalItButton sizeToFit];
            //checkBox.frame = CGRectMake(0, 0, 30, 30);
            goalItButton.userInteractionEnabled = YES;
            //[checkBox addTarget:self action:@selector(didCheckTask:) forControlEvents:UIControlEventTouchDown];
            cell.accessoryView = goalItButton;
        } else if ([self.socialStream[indexPath.row] isKindOfClass:[Step class]]) {
            Step* a = (Step*) self.socialStream[indexPath.row];
            CellIdentifier = @"Step";
            buttonString = @"Join";
            labelText = a.name;
            detailLabelText = a.description;
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
            UIButton *checkBox = [UIButton buttonWithType:UIButtonTypeCustom];
            [checkBox setImage:[UIImage imageNamed:@"Jazz.png"] forState:UIControlStateNormal];
            [checkBox setImage:[UIImage imageNamed:@"Jazz.png"] forState:UIControlStateSelected];
            checkBox.frame = CGRectMake(0, 0, 30, 30);
            checkBox.userInteractionEnabled = YES;
            //[checkBox addTarget:self action:@selector(didCheckTask:) forControlEvents:UIControlEventTouchDown];
            cell.accessoryView = checkBox;
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
    if (indexPath.section == 0 && indexPath.row == 0)
        return 44;
    return 130;
}

-(void)addGoal:(id)sender {
    if([sender isKindOfClass:[UIButton class]]) {
        UIButton* button = (UIButton* ) sender;
        UITableViewCell* cell = (UITableViewCell*) button.superview;
        //NSIndexPath *indexPath = [(UITableView *)cell.superview indexPathForCell:cell];
        // Add Goal at this index to the goals added page
        //button.backgroundColor = [UIColor greenColor];
        button.titleLabel.text = @"added";
        
        
    }
}

-(void)joinActivity:(id)sender {
    
    
}

@end
