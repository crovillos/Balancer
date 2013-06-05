//
//  InviteList.m
//  Balancer
//
//  Created by Dian Hartono on 5/9/13.
//  Copyright (c) 2013 Dian Hartono, Grace Jang, Chris Rovillos, Catriona Scott, Brian Yin. All rights reserved.
//

#import "InviteList.h"

@implementation InviteList

- (NSArray *)pendingInvites
{
    if (!_pendingInvites) _pendingInvites = [[NSArray alloc] init];
    return _pendingInvites;
}

- (NSArray *)declineInvites
{
    if (!_declineInvites) _declineInvites = [[NSArray alloc] init];
    return _declineInvites;
}
@end
