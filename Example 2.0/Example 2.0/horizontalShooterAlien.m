//
//  horizontalShooterAlien.m
//  Example 2.0
//
//  Created by Developer on 6/17/13.
//  Copyright (c) 2013 isee systems. All rights reserved.
//

#import "horizontalShooterAlien.h"
#import "Shot.h"

@implementation horizontalShooterAlien

    int side;

-(id)initWithGame:(Game*)game andX:(int)x andY:(int)y andVel:(float)vel andDir:(int)dir{
    self = [super initWithGame:game andX:x andY:y andVel:vel andDir:dir];
    if(self){
        _timer = 0;
        side = -1;
    }
    [self setTexture: [[CCTextureCache sharedTextureCache] addImage: @"alien3.png"]];
    return self;
}


-(void)update:(ccTime)delta{
    [super update:delta];
    if(++_timer%150 == 0 ){
        if([self isVisible] && [self getState] != LEAVE && [self getState] != ATTACK){
            [self makeShot];
        }
    }
}

-(void)makeShot{
    [self freeze];
    _shot = [[Shot alloc]initWithAlien:self andGame:[self getGame]];
    [[self getGame]addChild:_shot z:1];
    
    side *= -1;
    
    cpBodyApplyForce(_shot.body, cpv(side * 1000,-1000), cpvzero);
}

@end
