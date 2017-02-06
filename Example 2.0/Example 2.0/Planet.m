//
//  Planet.m
//  Example 2.0
//
//  Created by Developer on 6/11/13.
//  Copyright (c) 2013 isee systems. All rights reserved.
//

#import "Planet.h"
#import "Game.h"

@implementation Planet

-(id)initWithGame:(Game*)game andType:(int)type andX:(int)x andY:(int)y{
    switch (type) {
        case TATOOINE:
            self = [super initWithFile:@"tatooine.png"];
            [self setRadio:19];
            _mass = 190000;
            self.shape = [game.smgr addCircleAt:cpv(x, y)
                                           mass:1000000000
                                         radius:19];
            break;
        case WORLD:
            self = [super initWithFile:@"world.png"];
            [self setRadio:29];
            _mass = 290000;
            self.shape = [game.smgr addCircleAt:cpv(x, y)
                                           mass:1000000000
                                         radius:29];
            break;
        case ABLAJECK:
            self = [super initWithFile:@"ablajeck.png"];
            [self setRadio:30];
            _mass = 300000;
            self.shape = [game.smgr addCircleAt:cpv(x, y)
                                           mass:1000000000
                                         radius:30];
            break;
            
        default:
            self = [super initWithFile:@"bogden.png"];
            [self setRadio:42];
            _mass = 420000;
            self.shape = [game.smgr addCircleAt:cpv(x, y)
                                           mass:1000000000
                                         radius:42];
            break;
    }
    [self setGame:game];
    return self;
}

-(float) gravityForMonkey:(SpaceMonkey*)monkey{
    float d = [monkey distanceToObject:self];
    float a = _mass / d;
    NSLog(@"%f", a);
    return a;
}

-(BOOL)hasSatellite{
    return NO;
}

@end
