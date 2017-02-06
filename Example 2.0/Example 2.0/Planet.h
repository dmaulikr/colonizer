//
//  Planet.h
//  Example 2.0
//
//  Created by Developer on 6/11/13.
//  Copyright (c) 2013 isee systems. All rights reserved.
//

#ifndef __PLANET_H__
#define __PLANET_H__

#import "Actor.h"
@class Game;
@class SpaceMonkey;

#define WORLD 0
#define TATOOINE 1
#define ABLAJECK 2
#define BOGDEN 3

#define VERY_SLOW 1.0f
#define SLOW 1.5f
#define NORMAL 2.0f
#define LIL_FAST 3.0f
#define FAST 4.0f
#define VERY_FAST 4.5f

@interface Planet : Actor

@property (nonatomic) int mass;
@property (nonatomic) Game* game;

-(id)initWithGame:(Game*)game andType:(int)type andX:(int)x andY:(int)y;
-(float)gravityForMonkey:(SpaceMonkey*)monkey;
-(BOOL)hasSatellite;
-(void)update:(ccTime)delta;

@end

#endif