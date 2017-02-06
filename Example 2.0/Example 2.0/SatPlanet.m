//
//  SatPlanet.m
//  Example 2.0
//
//  Created by Developer on 6/13/13.
//  Copyright (c) 2013 isee systems. All rights reserved.
//

#import "SatPlanet.h"
#import "Satellite.h"
#import "Game.h"

@implementation SatPlanet

-(id)initWithGame:(Game*)game andType:(int)type andX:(int)x andY:(int)y{
    self = [super initWithGame:game andType:type andX:x andY:y];
    //satellite
    if(self){
        _sat = [[Satellite alloc]initWithGame:game andPlanet:self];
        [[self getGame]addChild:_sat z:1];
        [[self getGame].satellites addObject:_sat];
    }
    return self;
}

-(BOOL)hasSatellite{
    return YES;
}

-(void)setSat:(Satellite *)sat{
    _sat = sat;
}

@end
