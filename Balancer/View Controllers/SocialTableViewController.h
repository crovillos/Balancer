//
//  SocialTableViewController.h
//  Balancer
//
//  Created by Dian Hartono on 5/11/13.
//  Copyright (c) 2013 Dian Hartono, Grace Jang, Chris Rovillos, Catriona Scott, Brian Yin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SocialTableViewController : UITableViewController

/** The model for this view controller, obtained from the network */
@property (nonatomic, strong) NSMutableArray *socialStream; // of Goal

@end
