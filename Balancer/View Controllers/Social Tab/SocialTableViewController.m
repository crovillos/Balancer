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
#import "AppDelegate.h"
#import "UINavigationBar+FlatUI.h"
#import "UIColor+Balancer.h"
#import "SocialAddGoalTableViewController.h"

@implementation SocialTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"am I called when I go to social each time");
    [self.navigationController.navigationBar configureFlatNavigationBarWithColor:[UIColor balancerPinkColor]];
    
    // prevent empty table cells from appearing after the social feed by setting
    // the table view's footer view to an empty view
    self.tableView.tableFooterView = [[UIView alloc] init];
    
    AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    NSMutableArray *dummySocialStream = appDelegate.dummySocialStream;
    
    [self setSocialStream:dummySocialStream];
}


- (void)viewWillAppear:(BOOL)animated
{
    NSArray* visibleCells = [self.tableView visibleCells];
    if([visibleCells count]) {
        NSLog(@"updating");

        //UITableViewCell *invitationsHeader = [self.tableView dequeueReusableCellWithIdentifier:@"Invitations"];
        UITableViewCell *invitationsHeader = self.header;
        AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
        
        invitationsHeader.textLabel.text = [NSString stringWithFormat:@"Invites (%i)", appDelegate.dummyInvites.count];
        NSIndexPath* inviteIndexPath = [self.tableView indexPathForCell:invitationsHeader];
       // NSArray* inviteIndexRow = @[inviteIndexPath];
        //[self.tableView reloadRowsAtIndexPaths:inviteIndexRow withRowAnimation:UITableViewRowAnimationNone];
        
        [[self.tabBarController.tabBar.items objectAtIndex:0] setBadgeValue:[NSString stringWithFormat:@"333%d", appDelegate.dummyInvites.count]];
    }
}

-(void) viewDidAppear:(BOOL)animated
{
    NSLog(@"view appeared ahhhh");
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
    return 1;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    
    if (appDelegate.dummyInvites.count > 0) {
        UITableViewCell *invitesHeader = [tableView dequeueReusableCellWithIdentifier:@"Invitations"];
        invitesHeader.textLabel.text = [NSString stringWithFormat:@"Invites (%i)", appDelegate.dummyInvites.count];
        
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(showInvitations)];
        tapGesture.cancelsTouchesInView = NO;
        invitesHeader.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        [invitesHeader addGestureRecognizer:tapGesture];
        self.header = invitesHeader;
        
        return invitesHeader;
    }
    else {
        return nil;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 35.0;
}

- (void)showInvitations
{
    [self performSegueWithIdentifier:@"Show Invitations" sender:self];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.socialStream count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell;
    
    //if (!indexPath.section) { // at invites row
    //    cell = [tableView dequeueReusableCellWithIdentifier:@"Invitations" forIndexPath:indexPath];
    //} else {
    NSInteger row = indexPath.row;
    id story = self.socialStream[row];
    
    static NSString *cellIdentifier;
    
    NSString* storyHeaderText;
    NSString* storyDetailText;
    NSString* profileImagePath;
    NSString* accessoryViewButtonText;
    NSInteger creatorFBID = 0;
    
    BOOL disabled = NO;
    UIButton *accessoryViewButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [accessoryViewButton setEnabled:!disabled];
    UIImage* image = [UIImage imageNamed:@"brian_profilePic"];
    if([story isKindOfClass:[Goal class]]) {
        [accessoryViewButton addTarget:self action:@selector(goalIt:) forControlEvents:UIControlEventTouchUpInside];
        
    } else if ([story isKindOfClass:[Step class]]) {
        [accessoryViewButton addTarget:self action:@selector(joinStep:) forControlEvents:UIControlEventTouchUpInside];
    }
    if([story isKindOfClass:[Goal class]]) {
        Goal* goal = (Goal *) story;
        
        cellIdentifier = @"Goal";
        accessoryViewButtonText = @"Goal it!";
        
        storyHeaderText = [NSString stringWithFormat:@"Brian Yin added a new goal", goal.creatorId];
        storyDetailText = goal.name;
        creatorFBID = goal.creatorId;
        
        if (goal.added) {
            accessoryViewButtonText = @"Goaled!";
            [accessoryViewButton setImage:[UIImage imageNamed:@"Joined Checkmark.png"] forState:UIControlStateNormal];
            [UIView transitionWithView:accessoryViewButton
                              duration:4.0
                               options:UIViewAnimationOptionTransitionCrossDissolve
                            animations:^{ accessoryViewButton.selected = YES; }
                            completion:nil];
        }
        
    } else if ([story isKindOfClass:[Step class]]) {
        Step* step = (Step *) story;
        
        cellIdentifier = @"Step";
        accessoryViewButtonText = @"Step it!";
        
        storyHeaderText = [NSString stringWithFormat:@"Brian Yin added a new step", step.creatorId];
        storyDetailText = step.name;
        creatorFBID = step.creatorId;
        
        if (step.sponsored) {
            storyHeaderText = @"Facebook Sponsored";
            image = [UIImage imageNamed:@"Facebook Logo"];
        }
    }
    
    cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    // add accessory view button

    
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
    //accessoryViewButton.frame.size.height = cell.bounds.size.height;
    cell.accessoryView = accessoryViewButton;
    
    
    CGSize mainViewSize = accessoryViewButton.bounds.size;
    CGFloat borderWidth = 1;
    UIColor *borderColor = [UIColor balancerDarkBlueColor];
    UIView *leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, borderWidth, mainViewSize.height)];
    leftView.opaque = YES;
    leftView.backgroundColor = borderColor;
    
    // for bonus points, set the views' autoresizing mask so they'll stay with the edges:
    leftView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleRightMargin;
    
    [accessoryViewButton addSubview:leftView];
    

    
    
    // Configure the cell...
    UILabel* storyHeaderLabel = (UILabel *)[cell viewWithTag:2];
    storyHeaderLabel.text = storyHeaderText;
    
    UILabel* storyDetailLabel = (UILabel *)[cell viewWithTag:3];
    storyDetailLabel.text = storyDetailText;
    
    NSString* userPicturePath = [NSString stringWithFormat:@"user%dPic", creatorFBID];
    //UIImage* image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:userPicturePath ofType:@"png"]];
    
    UIImageView* profileImageView = (UIImageView *)[cell viewWithTag:1];
    profileImageView.image = image;
    
    
    
    UIImage *cellBackgroundImage = [UIImage imageNamed:@"Social Story Background"];
    UIImage *cellBackgroundImageResizable = [cellBackgroundImage resizableImageWithCapInsets:UIEdgeInsetsMake(11.0, 11.0, 12.0, 11.0)];
    cell.backgroundView = [[UIImageView alloc] initWithImage:cellBackgroundImageResizable];
    
    UIImage *cellSelectedBackgroundImage = [UIImage imageNamed:@"Social Story Background (selected)"];
    UIImage *cellSelectedBackgroundImageResizable = [cellSelectedBackgroundImage resizableImageWithCapInsets:UIEdgeInsetsMake(11.0, 11.0, 12.0, 11.0)];
    cell.selectedBackgroundView = [[UIImageView alloc] initWithImage:cellSelectedBackgroundImageResizable];
    

    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    //if (indexPath.section == 0 && indexPath.row == 0)
    //    return 44;
    
    // TODO: factor out duplicated code; same as cellForRowAtIndexPath
    NSString* storyHeaderText;
    NSString* storyDetailText;
    NSString* profileImagePath;
    
    NSInteger row = indexPath.row;
    id story = self.socialStream[row];
    
    if([story isKindOfClass:[Goal class]]) {
        Goal* goal = (Goal *) story;
        
        storyHeaderText = [NSString stringWithFormat:@"Brian Yin added a new goal", goal.creatorId];
        storyDetailText = goal.name;
        
    } else if ([story isKindOfClass:[Step class]]) {
        Step* step = (Step *) story;
        
        storyHeaderText = [NSString stringWithFormat:@"Brian Yin added a new step", step.creatorId];
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
            [appDelegate.dummyGoals addObject:goal];
        } else { // This currently will never actually run...
            [appDelegate.dummyGoals removeObjectAtIndex:[appDelegate.dummyGoals indexOfObject:goal]];
            [appDelegate.dummySocialStream addObject:goal];
        }
        [self.tableView reloadData];
    }
}

-(void)joinStep:(id)sender {
    
    if([sender isKindOfClass:[UIButton class]]) {
        UIButton* button = (UIButton* ) sender;
        UITableViewCell* cell = (UITableViewCell*) button.superview;
        NSIndexPath *indexPath = [(UITableView *)cell.superview indexPathForCell:cell];
        self.lastSelected = self.socialStream[indexPath.row];
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

//This should only be called when done is clicked
-(void) updateGoalSelected:(Goal*) goalSelected {
    AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    goalSelected.added = !goalSelected .added;
    
    [goalSelected.activities addObject:self.lastSelected];
    
    [appDelegate.dummySocialStream removeObjectAtIndex:[appDelegate.dummySocialStream indexOfObject:self.lastSelected]];    
}

#pragma mark - Unwind segues from adding a goal
- (IBAction)cancelAddingGoal:(UIStoryboardSegue *)segue {
}

- (IBAction)addGoalFromModal:(UIStoryboardSegue *)segue {
    SocialAddGoalTableViewController *vc = (SocialAddGoalTableViewController *)segue.sourceViewController; // get results out of vc, which I presented
    [self updateGoalSelected:vc.selectedGoal];
}

@end
