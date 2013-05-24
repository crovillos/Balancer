//
//  UIColor+Balancer.m
//  Balancer
//
//  Created by Chris Rovillos on 5/23/13.
//  Copyright (c) 2013 Dian Hartono, Grace Jang, Chris Rovillos, Catriona Scott, Brian Yin. All rights reserved.
//

#import "UIColor+Balancer.h"

@implementation UIColor (Balancer)

+ (UIColor *) balancerPinkColor
{
    return [self colorWithRgbRed:166 green:36 blue:108 alpha:1.0];
}

+ (UIColor *) balancerLightPinkColor
{
    return [self colorWithRgbRed:201 green:77 blue:145 alpha:1.0];
}

+ (UIColor *) balancerDarkPinkColor
{
    return [self colorWithRgbRed:115 green:25 blue:75 alpha:1.0];
}

+ (UIColor *) balancerLightBlueColor
{
    return [self colorWithRgbRed:4 green:178 blue:217 alpha:1.0];
}

+ (UIColor *) balancerDarkBlueColor
{
    return [self colorWithRgbRed:3 green:90 blue:166 alpha:1.0];
}

+ (UIColor *) balancerPurpleColor
{
    return [self colorWithRgbRed:94 green:48 blue:140 alpha:1.0];
}

+ (UIColor *) balancerBeigeColor
{
    return [self colorWithRgbRed:94 green:48 blue:140 alpha:1.0];
}

+ (UIColor *) colorWithRgbRed:(NSUInteger)red green:(NSUInteger)green blue:(NSUInteger)blue alpha:(CGFloat)alpha;
{
    return [UIColor colorWithRed:red / 255.0 green:green / 255.0 blue:blue / 255.0 alpha:alpha];
}

@end
