//
//  SocialAddGoalTableViewController.m
//  Balancer
//
//  Created by Catriona Scott on 5/24/13.
//  Copyright (c) 2013 Dian Hartono, Grace Jang, Chris Rovillos, Catriona Scott, Brian Yin. All rights reserved.
//

#import "SocialAddGoalTableViewController.h"
#import "AppDelegate.h"
#import "Goal.h"
#import "UINavigationBar+FlatUI.h"
#import "UIColor+Balancer.h"

@interface SocialAddGoalTableViewController ()

@end

@implementation SocialAddGoalTableViewController

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
    
    [self setGoals:appDelegate.dummyGoals];
    
}

- (void)setGoals:(NSArray *)goals
{
    _goals = goals;
    [self.tableView reloadData];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.goals count];
}

- (IBAction)cancel:(UIStoryboardSegue *)segue
{
    if ([[segue identifier] isEqualToString:@"Cancel"]) {
        [self dismissViewControllerAnimated:YES completion:NULL];
    }
}

// called from the add custom goal screen
- (IBAction)done:(UIStoryboardSegue *)segue
{
    if ([[segue identifier] isEqualToString:@"DoneInput"]) {
        [self dismissViewControllerAnimated:YES completion:NULL];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell;
        NSInteger row = indexPath.row;
        id story = self.goals[row];
        
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
            
            storyHeaderText = [NSString stringWithFormat:@"User %u added a new goal goal goal goal", goal.creatorId];
            storyDetailText = goal.name;
            creatorFBID = goal.creatorId;
            
            
            
        }
        
        cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
        
        // Configure the cell...
        UILabel* storyHeaderLabel = (UILabel *)[cell viewWithTag:2];
        storyHeaderLabel.text = storyHeaderText;
        
        UILabel* storyDetailLabel = (UILabel *)[cell viewWithTag:3];
        storyDetailLabel.text = storyDetailText;
        
        NSString* userPicturePath = [NSString stringWithFormat:@"user%dPic", creatorFBID];
        UIImage* image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:userPicturePath ofType:@"png"]];
        UIImageView* profileImageView = (UIImageView *)[cell viewWithTag:1];
        profileImageView.image = image;
        
        //CALayer *imageLayer = profileImageView.layer;
        //[imageLayer setCornerRadius:25];
        //[imageLayer setMasksToBounds:YES];
        
        UIView *cellBackgroundView = [[UIView alloc] init];
        cellBackgroundView.backgroundColor = [UIColor whiteColor];
        cell.backgroundView = cellBackgroundView;

    //cell.selectionStyle = UITableViewCellSelectionStyleNone;
    UIView *selectedCellBackgroundView = [[UIView alloc] init];
    selectedCellBackgroundView.backgroundColor = [UIColor balancerLightBlueColor];
    cell.selectedBackgroundView = selectedCellBackgroundView;
    
    return cell;

}





#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

@end
