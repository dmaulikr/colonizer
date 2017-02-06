//
//  Shot.m
//  Example 2.0
//
//  Created by Developer on 6/17/13.
//  Copyright (c) 2013 isee systems. All rights reserved.
//

#import "Shot.h"
#import "Game.h"

@implementation Shot

-(id)initWithAlien:(Alien*)alien andGame:(Game*)game{
    self = [[super init]initWithFile:@"shot.png"];
    if(self){
        [self setGame:game];
        _alien = alien;
        self.shape = [[self getGame].smgr addCircleAt:cpvsub(alien.position, cpv(0,[alien getRadio] + 5)) mass:5 radius:5];
    }
    return self;
}

@end
