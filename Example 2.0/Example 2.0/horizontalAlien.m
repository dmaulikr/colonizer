//
//  horizontalAlien.m
//  Example 2.0
//
//  Created by Developer on 6/17/13.
//  Copyright (c) 2013 isee systems. All rights reserved.
//

#import "horizontalAlien.h"
#define SCREEN_WIDTH 320
@implementation horizontalAlien

-(id)initWithGame:(Game*)game andX:(int)x andY:(int)y andVel:(float)vel andDir:(int)dir{
    self = [super initWithGame:game andX:x andY:y];
    if(self){
        _vel = vel;
        _dir = dir;
    }
    [self setTexture: [[CCTextureCache sharedTextureCache] addImage: @"alien2.png"]];
    return self;
}

-(void)standByAnimation{
    self.position = cpvadd(self.position, cpv(_dir * _vel,0));
}

-(void)update:(ccTime)delta{
    float newX;
    if (self.position.x< 0 && [self getState] != ATTACK) {
        float actualX = self.position.x;
        newX = SCREEN_WIDTH - actualX;
        self.position = cpv(newX, self.position.y);
    }else if(self.position.x> SCREEN_WIDTH && [self getState] != ATTACK){
        newX = fmodf(self.position.x, SCREEN_WIDTH);
        self.position = cpv(newX, self.position.y);
    }
    [super update:delta];
}

@end

