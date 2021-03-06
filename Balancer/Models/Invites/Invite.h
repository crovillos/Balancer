//
//  Invite.h
//  Balancer
//
//  Created by Dian Hartono on 5/9/13.
//  Copyright (c) 2013 Dian Hartono, Grace Jang, Chris Rovillos, Catriona Scott, Brian Yin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Invite : NSObject

@property  (nonatomic, strong) NSString* sender;
@property (nonatomic, strong) NSDate* sentDate;
@property (nonatomic, strong) NSString* title;
@property (nonatomic, strong) id inviteObject;
@property (nonatomic) BOOL accepted;

@end
