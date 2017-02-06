//
//  SpaceMonkey.h
//  Example 2.0
//
//  Created by Developer on 6/11/13.
//  Copyright (c) 2013 isee systems. All rights reserved.
//

#ifndef __SPACE_MONKEY_H__
#define __SPACE_MONKEY_H__

#import "Actor.h"

#define LAND 0
#define SPACE 1
#define JUMP 2
#define ATTACKED 3
#define HURT 4
#define DIED 5
#define WON 6

#define MONKEY_MASS 10
#define MONKEY_WIDTH 15
#define MONKEY_HEIGHT 18
#define MONKEY_ROTATION 0
#define MONKEY_JUMP 100
#define MONKEY_X 200
#define MONKEY_Y 200
#define MONKEY_MAX_LIFE 4

@class Alien;
@class Planet;
@interface SpaceMonkey : Actor


@property (nonatomic) int target;
@property (nonatomic) Alien* alien;
@property (nonatomic) Planet* tplanet;
@property (nonatomic) int hurted;

-(id)initWithGame:(Game*)game;
-(void)update:(ccTime)delta;
-(void)getNearest;
-(void)jump;
-(float)distanceToObject:(Actor*)planet;
-(void)finishJump;
-(void)attacked:(Alien*)alien;
-(void)damaged;
-(void)heal;
-(void)space;
-(void)land;
-(float)getLand;
-(BOOL)isAlive;
-(void)died;
-(void)hurt;
-(void)won;
@end

#endif
