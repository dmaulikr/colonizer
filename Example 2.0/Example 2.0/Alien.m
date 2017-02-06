//
//  Alien.m
//  Example 2.0
//
//  Created by Developer on 6/12/13.
//  Copyright (c) 2013 isee systems. All rights reserved.
//

#import "Alien.h"
#import "Game.h"

@implementation Alien

-(id)initWithGame:(Game*)game andX:(int)x andY:(int)y{
    self = [[super init]initWithFile:@"alien1.png"];
    if(self){
        [self setState:STAND_BY];
        [self setGame:game];
        [self setLife:ALIEN_LIFE];
        _attacked = 0;
        _atack= 0;
        _standby = 0;
        [self setRadio:ALIEN_WIDTH];
        self.shape = [[self getGame].smgr addCircleAt:cpv(x, y)
                                                 mass:ALIEN_MASS
                                               radius:ALIEN_WIDTH];
    }
    return self;
}



-(void)update:(ccTime)delta{
    cpBodySetVel(self.body, cpvzero);
    if([self getState] == STAND_BY){
        self.rotation = 0;
        [self standByAnimation];
    }else if([self getState] == ATTACK){
        cpBodySetVel(self.body, cpvzero);
        if (_attacked++ == 0) {
            [[self getGame].monkey attacked:self];
        }else if (_atack++ == 100){
            [self setState:LEAVE];
        }else if(_atack%20 <10){
            self.position = cpvadd(self.position, cpv(-1,0));
        }else if(_atack%20 < 20){
            self.position = cpvadd(self.position, cpv(1,0));
        }
    }else if([self getState] == LEAVE){
        self.rotation += 2;
        
        self.scaleX = self.scaleX - 0.01;
        self.scaleY = self.scaleY - 0.01;
        [self performSelector:@selector(died) withObject:nil afterDelay:1];
        [[self getGame].monkey hurt];
    }else{
        [self autoRemove];
    }
}

-(void)standByAnimation{
    if(_standby%100 <25){
        self.position = cpvadd(self.position, cpv(-1,1));
    }else if(_standby%100>=25 && _standby%100 <50){
        self.position = cpvadd(self.position, cpv(1,1));
    }else if(_standby%100>=50 && _standby%100<75){
        self.position = cpvadd(self.position, cpv(1,-1));
    }else if(_standby%100 < 100){
        self.position = cpvadd(self.position, cpv(-1,-1));
    }
    _standby++;
}

-(void)died{
    [self setState:DIED];
}

-(void)setState:(int)state{
    if(state == LEAVE){
        [[self getGame].monkey hurt];
        cpBodySetVel([self getGame].monkey.body, cpvzero);
            cpBodyApplyImpulse([self getGame].monkey.body, cpv(-5,5), cpvzero);
    }
    [super setState:state];
}

-(void)attack{
    if([[self getGame].monkey getState] != ATTACKED){
        [self setState:ATTACK];
    }
}

-(void)autoRemove{
    [[self getGame].aliens removeObject:self];
    [super autoRemove];
}

@end
