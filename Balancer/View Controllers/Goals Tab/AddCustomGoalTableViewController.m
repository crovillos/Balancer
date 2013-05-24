//
//  AddCustomGoalTableViewController.m
//  Balancer
//
//  Created by Chris Rovillos on 5/21/13.
//  Copyright (c) 2013 Dian Hartono, Grace Jang, Chris Rovillos, Catriona Scott, Brian Yin. All rights reserved.
//

#import "AddCustomGoalTableViewController.h"

@interface AddCustomGoalTableViewController ()

@property (weak, nonatomic) IBOutlet UITextField *titleInput;
@property (weak, nonatomic) IBOutlet UITextField *completeByInput;
@property (weak, nonatomic) IBOutlet UISwitch *publicInput;
@property (weak, nonatomic) IBOutlet UITextField *inviteInput;

@end

@implementation AddCustomGoalTableViewController

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if ((textField == self.titleInput) || (textField == self.completeByInput) || (textField == self.inviteInput)) {
        [textField resignFirstResponder];
    }
    return YES;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"ReturnInput"]) {
            Goal *goal;
            NSDate *today = [NSDate date];
            goal = [[Goal alloc] init];
            goal.name = self.titleInput.text;
            goal.completionDate = today;
            goal.open = self.publicInput.enabled;
            self.goal = goal;
    }
}

@end
