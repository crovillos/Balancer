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
    UITableViewCell *cell;
    
    if (!indexPath.section) { // at invites row
        cell = [tableView dequeueReusableCellWithIdentifier:@"Invitations" forIndexPath:indexPath];
    } else {
        NSInteger row = indexPath.row;
        id story = self.socialStream[row];
        
        static NSString *cellIdentifier;
        
        NSString* storyHeaderText;
        NSString* storyDetailText;
        NSString* profileImagePath;
        NSString* accessoryViewButtonText;
        NSInteger creatorFBID = 0;
        


        
        if([story isKindOfClass:[Goal class]]) {
            Goal* goal = (Goal *) story;
            
            cellIdentifier = @"Goal";
            accessoryViewButtonText = @"Goal it!";
            
            storyHeaderText = [NSString stringWithFormat:@"User %u added a new goal", goal.creatorId];
            storyDetailText = goal.name;
            creatorFBID = goal.creatorId;


            
        } else if ([story isKindOfClass:[Step class]]) {
            Step* step = (Step *) story;
            
            cellIdentifier = @"Step";
            accessoryViewButtonText = @"Add it!";
            
            storyHeaderText = [NSString stringWithFormat:@"User %u added a new step", step.creatorId];
            storyDetailText = step.name;
            creatorFBID = step.creatorId;
        }
        
        cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
        
        // add accessory view button
        UIButton *accessoryViewButton =  [UIButton buttonWithType:UIButtonTypeRoundedRect];;
        [accessoryViewButton setTitle:accessoryViewButtonText forState:UIControlStateNormal];
        [accessoryViewButton sizeToFit];
        accessoryViewButton.userInteractionEnabled = YES;
        [accessoryViewButton setBounds:cell.bounds];
        CGRect accessoryViewButtonBounds = CGRectMake(0, 0, 75, cell.bounds.size.height);
        [accessoryViewButton setBounds:accessoryViewButtonBounds];
        //accessoryViewButton.frame.size.height = cell.bounds.size.height;
        cell.accessoryView = accessoryViewButton;
        
        
        if([story isKindOfClass:[Goal class]]) {
            [accessoryViewButton addTarget:self action:@selector(goalIt:) forControlEvents:UIControlEventTouchDown];
            
        } else if ([story isKindOfClass:[Step class]]) {
            [accessoryViewButton addTarget:self action:@selector(joinStep:) forControlEvents:UIControlEventTouchDown];
        }

        
        // Configure the cell...
        UILabel* storyHeaderLabel = (UILabel *)[cell viewWithTag:2];
        storyHeaderLabel.text = storyHeaderText;
        
        UILabel* storyDetailLabel = (UILabel *)[cell viewWithTag:3];
        storyDetailLabel.text = storyDetailText;
        
        NSString* userPicturePath = [NSString stringWithFormat:@"user%dPic", creatorFBID];
        //UIImage* image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:userPicturePath ofType:@"png"]];
        UIImage* image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"brian_profilePic" ofType:@"png"]];
        UIImageView* profileImageView = (UIImageView *)[cell viewWithTag:1];
        profileImageView.image = image;
        
        CALayer *imageLayer = profileImageView.layer;
        [imageLayer setCornerRadius:25];
        [imageLayer setMasksToBounds:YES];
        
        UIView *cellBackgroundView = [[UIView alloc] init];
        cellBackgroundView.backgroundColor = [UIColor whiteColor];
        cell.backgroundView = cellBackgroundView;
    }
    
    //cell.selectionStyle = UITableViewCellSelectionStyleNone;
    UIView *selectedCellBackgroundView = [[UIView alloc] init];
    selectedCellBackgroundView.backgroundColor = [UIColor balancerLightBlueColor];
    cell.selectedBackgroundView = selectedCellBackgroundView;
    
    return cell;
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
        NSIndexPath *indexPath = [(UITableView *)cell.superview indexPathForCell:cell];
        Goal* goal = (Goal *) self.socialStream[indexPath.row];
        goal.added = !goal.added;
        
        // Add Goal at this index to the goals added page
        //button.backgroundColor = [UIColor greenColor];
        AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
        if(goal.isAdded) {
            [button.titleLabel setText:@"added"];
            [appDelegate.dummySocialStream removeObjectAtIndex:[appDelegate.dummySocialStream indexOfObject:goal]];
            [appDelegate.dummyGoals addObject:goal];
        } else { // This currently will never actually run...
            //NSLog([NSString stringWithFormat:@"%d", [appDelegate.dummyGoals indexOfObject:goal]]);
            [appDelegate.dummyGoals removeObjectAtIndex:[appDelegate.dummyGoals indexOfObject:goal]];
            [appDelegate.dummySocialStream addObject:goal];
        }
        [[self tableView] reloadData];
    }
}

-(void)joinStep:(id)sender {
    
    if([sender isKindOfClass:[UIButton class]]) {
        [self performSegueWithIdentifier: @"Add Step to Goal" sender: self];
        
    }

}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([sender isKindOfClass:[UITableViewCell class]]) {
        NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
        if (indexPath) {
            if ([segue.identifier isEqualToString:@"Social to Goal Detail"]) {
                if ([segue.destinationViewController respondsToSelector:@selector(setGoal:)]) {
                    Goal *goal = (Goal *)self.socialStream[indexPath.row];
                    [segue.destinationViewController performSelector:@selector(setGoal:) withObject:((Goal *)goal)];
                }
            } else if ([segue.identifier isEqualToString:@"Social to Step Detail"]) {
                if ([segue.destinationViewController respondsToSelector:@selector(setStep:)]) {
                    Step *step = (Step *)self.socialStream[indexPath.row];
                    [segue.destinationViewController performSelector:@selector(setStep:) withObject:((Step *)step)];
                }
            }
        }
        
    }
}

@end
