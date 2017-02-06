//
//  Satellite.h
//  Example 2.0
//
//  Created by Developer on 6/13/13.
//  Copyright (c) 2013 isee systems. All rights reserved.
//

#import "Actor.h"
@class SatPlanet;

#define SAT_ORB 20
#define SAT_VEL 1.2

#define ORBIT 0
#define HEAL 1

@interface Satellite : Actor

@property (nonatomic) SatPlanet* planet;

@property (nonatomic) float angle;
@property (nonatomic) float animation;

-(id)initWithGame:(Game*)game andPlanet:(SatPlanet*)planet;
-(cpVect)establishPosition;
-(void)heal;
@end
