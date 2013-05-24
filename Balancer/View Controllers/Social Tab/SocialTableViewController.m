//
//  SocialTableViewController.m
//  Balancer
//
//  Created by Dian Hartono on 5/11/13.
//  Copyright (c) 2013 Dian Hartono, Grace Jang, Chris Rovillos, Catriona Scott, Brian Yin. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

#import "SocialTableViewController.h"
#import "Goal.h"
#import "Step.h"
#import "AppDelegate.h"
#import "UINavigationBar+FlatUI.h"
#import "UIColor+Balancer.h"

@implementation SocialTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.navigationController.navigationBar configureFlatNavigationBarWithColor:[UIColor balancerPinkColor]];
    
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
    if (!indexPath.section) { // at invites row
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Invitations" forIndexPath:indexPath];
        return cell;
    } else {
        NSInteger row = indexPath.row;
        id story = self.socialStream[row];
        
        static NSString *cellIdentifier;
        
        NSString* storyHeaderText;
        NSString* storyDetailText;
        NSString* profileImagePath;
        NSString* accessoryViewButtonText;
        
        
        if([story isKindOfClass:[Goal class]]) {
            Goal* goal = (Goal *) story;
            
            cellIdentifier = @"Goal";
            accessoryViewButtonText = @"Goal it!";
            
            storyHeaderText = [NSString stringWithFormat:@"User %u added a new goal goal goal goal", goal.creatorId];
            storyDetailText = goal.name;

        } else if ([story isKindOfClass:[Step class]]) {
            Step* step = (Step *) story;
            
            cellIdentifier = @"Step";
            accessoryViewButtonText = @"Add it!";
                        
            storyHeaderText = [NSString stringWithFormat:@"User %u added a new step", step.creatorId];
            storyDetailText = step.name;
        }
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
        
        // add accessory view button
        UIButton *accessoryViewButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [accessoryViewButton setTitle:accessoryViewButtonText forState:UIControlStateNormal];
        [accessoryViewButton sizeToFit];
        accessoryViewButton.userInteractionEnabled = YES;
        [accessoryViewButton setBounds:cell.bounds];
        CGRect accessoryViewButtonBounds = CGRectMake(0, 0, 75, cell.bounds.size.height);
        [accessoryViewButton setBounds:accessoryViewButtonBounds];
        //accessoryViewButton.frame.size.height = cell.bounds.size.height;
        cell.accessoryView = accessoryViewButton;
        
        [accessoryViewButton addTarget:self action:@selector(goalIt:) forControlEvents:UIControlEventTouchDown];
        
        // Configure the cell...
        UILabel* storyHeaderLabel = (UILabel *)[cell viewWithTag:2];
        storyHeaderLabel.text = storyHeaderText;
        
        UILabel* storyDetailLabel = (UILabel *)[cell viewWithTag:3];
        storyDetailLabel.text = storyDetailText;
        
        UIImage* image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Jazz" ofType:@"png"]];
        UIImageView* profileImageView = (UIImageView *)[cell viewWithTag:1];
        profileImageView.image = image;
        
        CALayer *imageLayer = profileImageView.layer;
        [imageLayer setCornerRadius:25];
        [imageLayer setMasksToBounds:YES];
        
        return cell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0 && indexPath.row == 0)
        return 44;
    
    // TODO: factor out duplicated code; same as cellForRowAtIndexPath
    NSString* storyHeaderText;
    NSString* storyDetailText;
    NSString* profileImagePath;
    
    NSInteger row = indexPath.row;
    id story = self.socialStream[row];
    
    if([story isKindOfClass:[Goal class]]) {
        Goal* goal = (Goal *) story;
        
        storyHeaderText = [NSString stringWithFormat:@"User %u added a new goal", goal.creatorId];
        storyDetailText = goal.name;
        
    } else if ([story isKindOfClass:[Step class]]) {
        Step* step = (Step *) story;
        
        storyHeaderText = [NSString stringWithFormat:@"User %u added a new step", step.creatorId];
        storyDetailText = step.name;
    }
    
    float totalContentHeight = 130.0;
    //totalContentHeight += [storyHeaderText size]
    return 130;
}

-(void)goalIt:(id)sender {
    if([sender isKindOfClass:[UIButton class]]) {
        
        UIButton* button = (UIButton* ) sender;
        UITableViewCell* cell = (UITableViewCell*) button.superview;
        //NSIndexPath *indexPath = [(UITableView *)cell.superview indexPathForCell:cell];
        // Add Goal at this index to the goals added page
        //button.backgroundColor = [UIColor greenColor];
        [button.titleLabel setText:@"added"];
        
        // TODO: add to app delegate dummyGoals
    }
}

-(void)joinActivity:(id)sender {
    // TODO
}

@end
