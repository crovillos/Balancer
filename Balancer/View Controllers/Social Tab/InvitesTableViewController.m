//
//  InvitesTableViewController.m
//  Balancer
//
//  Created by Chris Rovillos on 5/23/13.
//  Copyright (c) 2013 Dian Hartono, Grace Jang, Chris Rovillos, Catriona Scott, Brian Yin. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

#import "InvitesTableViewController.h"
#import "Invite.h"
#import "Goal.h"
#import "GoalInvite.h"
#import "StepInvite.h"
#import "Step.h"
#import "AppDelegate.h"
#import "SocialAddGoalTableViewController.h"

#import "UINavigationBar+FlatUI.h"
#import "UIColor+Balancer.h"

@implementation InvitesTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.navigationController.navigationBar configureFlatNavigationBarWithColor:[UIColor balancerPinkColor]];
    
    // prevent empty table cells from appearing after the social feed by setting
    // the table view's footer view to an empty view
    self.tableView.tableFooterView = [[UIView alloc] init];
    
    AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    NSMutableArray *dummyInvites = appDelegate.dummyInvites;
    self.invites = dummyInvites;
}


- (void)setInvites:(NSMutableArray *)invites
{
    _invites = invites;
    [self.tableView reloadData];
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
    return [self.invites count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *CellIdentifier;
    
    NSInteger row = indexPath.row;
    Invite *invite = (Invite *)self.invites[row];
    
    if ([invite isKindOfClass:[GoalInvite class]]) {
        CellIdentifier = @"Goal Invite";
    } else {
        CellIdentifier = @"Step Invite";
    }
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    NSString* inviteHeaderText;
    NSString* inviteDetailText;
    NSString* profileImagePath;
    NSString* accessoryViewButtonText;
    
    BOOL disabled = NO;
    
    if([invite isKindOfClass:[GoalInvite class]]) {
        Goal* goal = (Goal *)invite.inviteObject;
        
        accessoryViewButtonText = @"Goal it!";
        
        inviteHeaderText = [NSString stringWithFormat:@"User %u shared a goal with you", goal.creatorId];
        inviteDetailText = goal.name;
        
        if (goal.added) {
            accessoryViewButtonText = @"Goaled!";
            disabled = YES;
        }
        
    } else if ([invite isKindOfClass:[StepInvite class]]) {
        Step* step = (Step *) invite.inviteObject;
        
        accessoryViewButtonText = @"Add it!";
        
        inviteHeaderText = [NSString stringWithFormat:@"User %u invited you to join a step", step.creatorId];
        inviteDetailText = step.name;
    }
    
    // add accessory view button
    UIButton *accessoryViewButton =  [UIButton buttonWithType:UIButtonTypeCustom];
    [accessoryViewButton setEnabled:!disabled];
    
    UIFont *accessoryButtonFont = [UIFont boldSystemFontOfSize:14.0];
    [accessoryViewButton setTitle:accessoryViewButtonText forState:UIControlStateNormal];
    accessoryViewButton.titleLabel.font = accessoryButtonFont;
    [accessoryViewButton setTitleColor:[UIColor balancerDarkBlueColor] forState:UIControlStateNormal];
    [accessoryViewButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [accessoryViewButton sizeToFit];
    accessoryViewButton.userInteractionEnabled = YES;
    
    CGRect rect = CGRectMake(0, 0, 1, 1);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context,
                                   [UIColor balancerLightBlueColor].CGColor);
    CGContextFillRect(context, rect);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    [accessoryViewButton setBackgroundImage:img forState:UIControlStateHighlighted];
    
    [accessoryViewButton setTitleColor:[UIColor balancerDarkBlueColor] forState:UIControlStateSelected];
    
    CGRect accessoryViewButtonBounds = CGRectMake(0, 0, 75, cell.bounds.size.height - 20);
    [accessoryViewButton setBounds:accessoryViewButtonBounds];
    cell.accessoryView = accessoryViewButton;
    
    if([invite isKindOfClass:[GoalInvite class]]) {
        [accessoryViewButton addTarget:self action:@selector(goalIt:) forControlEvents:UIControlEventTouchUpInside];
        
    } else if ([invite isKindOfClass:[StepInvite class]]) {
        [accessoryViewButton addTarget:self action:@selector(joinStep:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    // Configure the cell...
    UILabel* inviteHeaderLabel = (UILabel *)[cell viewWithTag:2];
    inviteHeaderLabel.text = inviteHeaderText;
    
    UILabel* inviteDetailLabel = (UILabel *)[cell viewWithTag:3];
    inviteDetailLabel.text = inviteDetailText;
    
    
    //UIImage* image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:userPicturePath ofType:@"png"]];
    UIImage* image = [UIImage imageNamed:@"brian_profilePic"];
    UIImageView* profileImageView = (UIImageView *)[cell viewWithTag:1];
    profileImageView.image = image;
    
    CALayer *imageLayer = profileImageView.layer;
    [imageLayer setCornerRadius:25];
    [imageLayer setMasksToBounds:YES];
    
    UIImage *cellBackgroundImage = [UIImage imageNamed:@"Social Story Background"];
    UIImage *cellBackgroundImageResizable = [cellBackgroundImage resizableImageWithCapInsets:UIEdgeInsetsMake(11.0, 11.0, 12.0, 11.0)];
    cell.backgroundView = [[UIImageView alloc] initWithImage:cellBackgroundImageResizable];
    
    UIImage *cellSelectedBackgroundImage = [UIImage imageNamed:@"Social Story Background (selected)"];
    UIImage *cellSelectedBackgroundImageResizable = [cellSelectedBackgroundImage resizableImageWithCapInsets:UIEdgeInsetsMake(11.0, 11.0, 12.0, 11.0)];
    cell.selectedBackgroundView = [[UIImageView alloc] initWithImage:cellSelectedBackgroundImageResizable];
    
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 130;
}

#pragma mark - Table view delegate

-(void)goalIt:(id)sender {
    if([sender isKindOfClass:[UIButton class]]) {
        
        UIButton* button = (UIButton* ) sender;
        UITableViewCell* cell = (UITableViewCell*) button.superview;
        NSIndexPath *indexPath = [(UITableView *)cell.superview indexPathForCell:cell];
        Invite* invite = self.invites[indexPath.row];
        Goal* goal = (Goal *)invite.inviteObject;
        goal.added = !goal.added;
        
        // Add Goal at this index to the goals added page
        //button.backgroundColor = [UIColor greenColor];
        AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
        if(goal.isAdded) {
            //[appDelegate.dummySocialStream removeObjectAtIndex:[appDelegate.dummySocialStream indexOfObject:goal]];
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
        UIButton* button = (UIButton* ) sender;
        UITableViewCell* cell = (UITableViewCell*) button.superview;
        NSIndexPath *indexPath = [(UITableView *)cell.superview indexPathForCell:cell];
        self.lastSelected = self.invites[indexPath.row];
        [self performSegueWithIdentifier: @"Add Step to Goal" sender: self];
        
    }
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([sender isKindOfClass:[UITableViewCell class]]) {
        NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
        if (indexPath) {
            if ([segue.identifier isEqualToString:@"Show Goal Detail"]) {
                if ([segue.destinationViewController respondsToSelector:@selector(setGoal:)]) {
                    Invite *invite = self.invites[indexPath.row];
                    Goal *goal = (Goal *)invite.inviteObject;
                    [segue.destinationViewController performSelector:@selector(setGoal:) withObject:((Goal *)goal)];
                }
            } else if ([segue.identifier isEqualToString:@"Show Step Detail"]) {
                if ([segue.destinationViewController respondsToSelector:@selector(setStep:)]) {
                    Invite *invite = self.invites[indexPath.row];
                    Step *step = (Step *)invite.inviteObject;
                    [segue.destinationViewController performSelector:@selector(setStep:) withObject:((Step *)step)];
                }
            }
        }
        
    }
}

//This should only be called when done is clicked
-(void) updateGoalSelected:(Goal*) goalSelected {
    AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    goalSelected.added = !goalSelected .added;
    //NSLog(goalSelected.name);
    //NSLog(self.lastSelected.name);
    goalSelected.activities= [[NSMutableArray alloc] init];
    [goalSelected.activities addObject:(Step*)self.lastSelected.inviteObject];
    [appDelegate.dummyInvites removeObjectAtIndex:1];
    [self.tableView reloadData];
}
#pragma mark - Unwind segues from adding a goal
- (IBAction)cancelAddingGoal:(UIStoryboardSegue *)segue {
}

- (IBAction)addGoalFromModal:(UIStoryboardSegue *)segue {
    SocialAddGoalTableViewController *vc = (SocialAddGoalTableViewController *)segue.sourceViewController; // get results out of vc, which I presented
    [self updateGoalSelected:vc.selectedGoal];
}


@end
