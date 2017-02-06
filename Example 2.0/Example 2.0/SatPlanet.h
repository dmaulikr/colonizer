//
//  SatPlanet.h
//  Example 2.0
//
//  Created by Developer on 6/13/13.
//  Copyright (c) 2013 isee systems. All rights reserved.
//

#import "Planet.h"
@class Satellite;

@interface SatPlanet : Planet

@property (nonatomic) Satellite* sat;

-(void)setSat:(Satellite *)sat;

@end
