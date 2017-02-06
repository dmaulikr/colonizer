//
//  Satellite.m
//  Example 2.0
//
//  Created by Developer on 6/13/13.
//  Copyright (c) 2013 isee systems. All rights reserved.
//

#import "Satellite.h"
#import "Game.h"
#import "SatPlanet.h"

@implementation Satellite

-(id)initWithGame:(Game*)game andPlanet:(SatPlanet*)planet{
    self = [super initWithFile:@"banana.png"];
    if(self){
        [super setLife:1];
        [super setGame:game];
        [self setPlanet:planet];
        [_planet setSat: self];
        [self setState:ORBIT];
        _angle = 90;
        _animation = 0;
        self.shape = [game.smgr addCircleAt:[self establishPosition]
                                       mass:10
                                     radius:8];
    }
    
    
    
    return self;
}

-(cpVect)establishPosition{
    
    //cpVect  axis = cpv(0,_planet.radio + SAT_ORB);
    
    cpVect pos = cpvadd(_planet.position, cpvmult(cpvforangle(CC_DEGREES_TO_RADIANS(_angle)), _planet.radio + SAT_ORB));
    
    return pos;
}

-(void)update:(ccTime)delta{
    if ([self getState] == HEAL) {
        if(_animation++ == 0){
            [[self getGame].monkey heal];
        }
        cpBodySetVel(self.body, cpvzero);
        self.scaleX = self.scaleX + 0.05;
        self.scaleY = self.scaleY + 0.05;
        [self performSelector:@selector(died) withObject:nil afterDelay:0.6];
        
    }else if([self getState] == ORBIT){            
            _angle -= SAT_VEL;
                        
            self.position = cpvadd(_planet.position, cpvmult(cpvforangle(CC_DEGREES_TO_RADIANS(_angle)), _planet.radio + SAT_ORB));
    }else{
        [self autoRemove];
    }
}

-(void)died{
    [self setState:DIED];
}

-(void)heal{
    cpBodySetVel(self.body, cpvzero);
    [self setState:HEAL];
    cpBodySetVel(self.body, cpvzero);
}

-(void)autoRemove{
    [[self getGame].satellites removeObject:self];
    [super autoRemove];
}
@end
