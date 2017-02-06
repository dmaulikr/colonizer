//
//  Actor.m
//  Example 2.0
//
//  Created by Developer on 6/12/13.
//  Copyright (c) 2013 isee systems. All rights reserved.
//

#import "Actor.h"
#import "Game.h"

#define SCREEN_SIZE 320

@implementation Actor

#pragma mark setters
-(void)setRadio:(float)radio{
    _radio = radio;
}

-(void)setState:(int)state{
    _state = state;
}

-(void)setGame:(Game *)game{
    _game = game;
}

-(void)setLife:(int)life{
    _life = life;
}

#pragma mark getters
-(float)getRadio{
    return _radio;
}

-(int)getLife{
    return _life;
}

-(int)getState{
    return _state;
}

-(Game*)getGame{
    return _game;
}

-(void)autoRemove{
    [self removeFromParentAndCleanup:YES];
    [_game.smgr removeAndFreeShape:self.shape];
}

-(BOOL)isVisible{
    return (self.position.x > 0 && self.position.x < SCREEN_SIZE) ? YES : NO;
}

-(void)freeze{
    cpBodySetVel(self.body, cpvzero);
}
@end
