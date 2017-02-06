//
//  BlockCreator.m
//  Example 2.0
//
//  Created by Developer on 6/18/13.
//  Copyright (c) 2013 isee systems. All rights reserved.
//

#import "BlockCreator.h"
#import "Game.h"
#import "Planet.h"
#import "SatPlanet.h"
#import "horizontalAlien.h"
#import "horizontalShooterAlien.h"
#import "Finish.h"

@implementation BlockCreator

#define CENTER _game.screenWidth/2

#define MID CENTER/2

#define LEFT MID/2
#define MID_LEFT MID
#define MID_RIGHT _game.screenWidth - MID_LEFT
#define RIGHT _game.screenWidth - LEFT

#define RIGHT_DIR 1
#define LEFT_DIR -1

-(id)initWithGame:(Game *)game{
    self = [super init];
    if(self){
        _game = game;
    }
    return self;
}

-(int)createAlien:(int)id from:(int)high{
    float newHigh = 0.0f;
    switch(id){
        case 0:{
            newHigh = [self createAlienWithX:LEFT andY:high];
            break;
        }
        case 1:{
            newHigh = [self createAlienWithX:MID_LEFT andY:high];
            break;
        }
        case 2:{
            newHigh = [self createAlienWithX:CENTER andY:high];
            break;
        }
        case 3:{
            newHigh = [self createAlienWithX:MID_RIGHT andY:high];
            break;
        }
        case 4:{
            newHigh = [self createAlienWithX:RIGHT andY:high];
            break;
        }
        case 5:{
            newHigh = [self createHorizontalAlienWithX:LEFT andY:high andVel:FAST andDir:RIGHT_DIR];
            break;
        }
        case 6:{
            newHigh = [self createHorizontalAlienWithX:CENTER andY:high andVel:LIL_FAST andDir:LEFT_DIR];
            break;
        }
        case 7:{
            newHigh = [self createHorizontalShooterWithX: LEFT andY:high andVel:FAST andDir:RIGHT_DIR];
            break;
        }
        case 8:{
            newHigh = [self createHorizontalShooterWithX:RIGHT andY:high andVel:LIL_FAST andDir:LEFT_DIR];
            break;
        }
        default:
            break;
        
    }
    return newHigh;
}

-(int)createFinishFrom:(int)high{
    Finish* finish = [[Finish alloc]initWithGame:_game andY:high andX:160];
    [_game addChild:finish z:2];
    return high;
}

-(int)createPlanet:(int)id from:(int)high{
    float newHigh = 0.0;
    switch(id){
        case 0:{
            newHigh = [self createPlanetTyped:WORLD withX:CENTER andY:high andVel:FAST];
            break;
        }
        case 1:{
            newHigh = [self createPlanetTyped:TATOOINE withX:LEFT andY:high andVel:LIL_FAST];
            break;
        }
        case 2:{
            newHigh = [self createPlanetTyped:TATOOINE withX:CENTER andY:high andVel:VERY_FAST];
            break;
        }
        case 3:{
            newHigh = [self createPlanetTyped:TATOOINE withX:MID_LEFT andY:high andVel:VERY_FAST];
            break;
        }
        case 4:{
            newHigh = [self createPlanetTyped:TATOOINE withX:RIGHT andY:high andVel:FAST];
            break;
        }
        case 5:{
            newHigh = [self createPlanetTyped:TATOOINE withX:MID_RIGHT andY:high andVel:VERY_FAST];
        }
        case 6:{
            newHigh = [self createPlanetTyped:ABLAJECK withX:LEFT andY:high andVel:LIL_FAST];
            break;
        }
        case 7:{
            newHigh = [self createPlanetTyped:ABLAJECK withX:CENTER andY:high andVel:VERY_FAST];
            break;
        }
        case 8:{
            newHigh = [self createPlanetTyped:ABLAJECK withX:MID_LEFT andY:high andVel:VERY_FAST];
            break;
        }
        case 9:{
            newHigh = [self createPlanetTyped:ABLAJECK withX:RIGHT andY:high andVel:FAST];
            break;
        }
        case 10:{
            newHigh = [self createPlanetTyped:ABLAJECK withX:MID_RIGHT andY:high andVel:VERY_FAST];
        }
        case 11:{
            newHigh = [self createPlanetTyped:BOGDEN withX:LEFT andY:high andVel:FAST];
            break;
        }
        case 12:{
            newHigh = [self createPlanetTyped:BOGDEN withX:CENTER andY:high andVel:VERY_FAST];
            break;
        }
        case 13:{
            newHigh = [self createPlanetTyped:BOGDEN withX:MID_LEFT andY:high andVel:VERY_FAST];
            break;
        }
        case 14:{
            newHigh = [self createPlanetTyped:BOGDEN withX:RIGHT andY:high andVel:FAST];
            break;
        }
        case 15:{
            newHigh = [self createSatPlanetTyped:BOGDEN withX:MID_RIGHT andY:high andVel:VERY_FAST];
            break;
        }
        case 16:{
            newHigh = [self createSatPlanetTyped:TATOOINE withX:LEFT andY:high andVel:VERY_FAST];
            break;
        }
        case 17:{
            newHigh = [self createSatPlanetTyped:ABLAJECK withX:CENTER andY:high andVel:VERY_FAST];
            break;
        }
        case 18:{
            newHigh = [self createSatPlanetTyped:BOGDEN withX:MID_LEFT andY:high andVel:VERY_FAST];
            break;
        }
        case 19:{
            newHigh = [self createSatPlanetTyped:ABLAJECK withX:RIGHT andY:high andVel:FAST];
            break;
        }
        case 20:{
            newHigh = [self createPlanetTyped:TATOOINE withX:MID_RIGHT andY:high andVel:VERY_FAST];
        }
        default:
        break;
    }
    return newHigh;
}


-(int)createHorizontalShooterWithX:(int)x andY:(int)y andVel:(float)vel andDir:(int)dir{
    Alien* alie4 = [[horizontalShooterAlien alloc]initWithGame:_game andX:x andY:y andVel:vel andDir:dir];
    [_game.aliens addObject:alie4];
    [_game addChild:alie4 z:2];
    return y + [alie4 getRadio] + 80;
}

-(int)createHorizontalAlienWithX:(int)x andY:(int)y andVel:(float)vel andDir:(int)dir{
    Alien* a = [[horizontalAlien alloc]initWithGame:_game andX:x  andY:y andVel:vel andDir:dir];
    [_game.aliens addObject:a];
    [_game addChild:a z:2];
    return y + [a getRadio] + 80;
}


-(int)createAlienWithX:(int)x andY:(int)y{
    Alien* a = [[Alien alloc]initWithGame:_game andX:x andY:y];
    [_game.aliens addObject:a];
    [_game addChild:a z:2];
    return y + [a getRadio] + 80;
}

-(int)createPlanetTyped:(int)type withX:(int)x andY:(int)y andVel:(float)vel{
    Planet* p = [[Planet alloc]initWithGame:_game andType:type andX:x andY:y];
    [_game.planets addObject:p];
    cpBodySetAngVel(p.body, vel);
    [_game addChild:p z:1];
    return y + [p getRadio] + 80;
}

-(int)createSatPlanetTyped:(int)type withX:(int)x andY:(int)y andVel:(float)vel{
    Planet* p = [[SatPlanet alloc]initWithGame:_game andType:type andX:x  andY:y];
    [_game.planets addObject:p];
    cpBodySetAngVel(p.body, vel);
    [_game addChild:p z:1];
    return y + [p getRadio] + 80;
}
@end
