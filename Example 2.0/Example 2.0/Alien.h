//
//  Alien.h
//  Example 2.0
//
//  Created by Developer on 6/12/13.
//  Copyright (c) 2013 isee systems. All rights reserved.
//

#import "Actor.h"

#define STAND_BY 0
#define ATTACK 1
#define LEAVE 2

#define ALIEN_LIFE 1
#define ALIEN_MASS 100
#define ALIEN_WIDTH 30

@interface Alien : Actor

@property (nonatomic) int attacked;
@property (nonatomic) int standby;
@property (nonatomic) int atack;

-(id)initWithGame:(Game*)game andX:(int)x andY:(int)y;
-(void)attack;
-(void)autoRemove;
-(void)standByAnimation;
@end
