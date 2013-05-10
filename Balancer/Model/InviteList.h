//
//  InviteList.h
//  Balancer
//
//  Created by Dian Hartono on 5/9/13.
//  Copyright (c) 2013 Dian Hartono, Grace Jang, Chris Rovillos, Catriona Scott, Brian Yin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface InviteList : NSObject
@property (nonatomic, strong) NSArray* pendingInvites;
@property (nonatomic, strong) NSArray* declineInvites;

@end
