//
//  UIColor+Balancer.h
//  Balancer
//
//  Created by Chris Rovillos on 5/23/13.
//  Copyright (c) 2013 Dian Hartono, Grace Jang, Chris Rovillos, Catriona Scott, Brian Yin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UIColor (Balancer)

+ (UIColor *) balancerPinkColor;
+ (UIColor *) balancerLightPinkColor;
+ (UIColor *) balancerDarkPinkColor;
+ (UIColor *) balancerLightBlueColor;
+ (UIColor *) balancerDarkBlueColor;
+ (UIColor *) balancerPurpleColor;
+ (UIColor *) balancerBeigeColor;

+ (UIColor *) colorWithRgbRed:(NSUInteger)red green:(NSUInteger)green blue:(NSUInteger)blue alpha:(CGFloat)alpha;

@end
