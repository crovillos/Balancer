//
//  SocialTableViewCell.m
//  Balancer
//
//  Created by Chris Rovillos on 5/26/13.
//  Copyright (c) 2013 Dian Hartono, Grace Jang, Chris Rovillos, Catriona Scott, Brian Yin. All rights reserved.
//

#import "SocialTableViewCell.h"

#define MARGIN 10;

@implementation SocialTableViewCell

- (void)layoutSubviews {
    [super layoutSubviews];
    
    /* Add left margin to the image and both labels */
    CGRect frame = self.imageView.frame;
    frame.origin.x += MARGIN;
    self.imageView.frame = frame;
    
    frame = self.textLabel.frame;
    frame.origin.x += MARGIN;
    frame.size.width -= 2 * MARGIN;
    self.textLabel.frame = frame;
    
    frame = self.detailTextLabel.frame;
    frame.origin.x += MARGIN;
    frame.size.width -= 2 * MARGIN;
    self.detailTextLabel.frame = frame;
    
    
    /* Add right margin to the accesory view */
    if (self.accessoryType != UITableViewCellAccessoryNone) {
        float estimatedAccesoryX = MAX(self.textLabel.frame.origin.x + self.textLabel.frame.size.width, self.detailTextLabel.frame.origin.x + self.detailTextLabel.frame.size.width);
        
        for (UIView *subview in self.subviews) {
            if (subview != self.textLabel &&
                subview != self.detailTextLabel &&
                subview != self.backgroundView &&
                subview != self.contentView &&
                subview != self.selectedBackgroundView &&
                subview != self.imageView &&
                subview.frame.origin.x > estimatedAccesoryX) {
                
                // This subview should be the accessory, change its frame
                frame = subview.frame;
                frame.origin.x -= MARGIN;
                frame.origin.y -= MARGIN;
                
                subview.frame = frame;
                break;
            }
        }
    }
}

@end
