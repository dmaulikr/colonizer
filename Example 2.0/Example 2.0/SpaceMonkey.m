//
//  SpaceMonkey.m
//  Example 2.0
//
//  Created by Developer on 6/11/13.
//  Copyright (c) 2013 isee systems. All rights reserved.
//

#import "SpaceMonkey.h"
#import "Game.h"
#import "Planet.h"
#import "GameOver.h"

#define SCREEN_WIDTH 320

@implementation SpaceMonkey

-(id)initWithGame:(Game*)game{
    self = [[super init]initWithFile:@"monkey0.png"];
    if(self){
        _target = 0;
        _hurted = 0;
        [self setState:SPACE];
        [self setGame:game];
        [self setLife:4];
        [self  setRadio:MONKEY_HEIGHT];
        self.shape = [[self getGame].smgr addCircleAt:cpv([self getGame].screenWidth/2,10) mass:MONKEY_MASS radius:MONKEY_HEIGHT];
        self.shape->u = 0;
    }
    return self;
}


-(void)update:(ccTime)delta{
    float newX;
    if (self.position.x< 0 && [self getState] != LAND) {
        float actualX = self.position.x;
        newX = SCREEN_WIDTH - actualX;
        self.position = cpv(newX, self.position.y);
    }else if(self.position.x>= SCREEN_WIDTH && [self getState] != LAND){
        newX = fmodf(self.position.x, SCREEN_WIDTH);
        self.position = cpv(newX, self.position.y);
    }
    
    if([self getState] == ATTACKED){
        self.position = _alien.position;
    }else if([self getState] == DIED){
        cpBodyApplyForce(self.body, cpv(0,-15), cpvzero);
        self.rotation += 10;
    }else if([self getState] == HURT){
        cpBodyApplyImpulse(self.body, cpv(0,-10), cpvzero);
        self.rotation += 10;
    }else if([self getState] == WON){
        self.position = cpv(self.position.x, self.position.y+10);
    }else if(([self getState] != JUMP) && ([self getState] != DIED) && ([self getState] != HURT) && ([self getState] != WON)){
        //[self getNearest];
        //Planet* p = [[self getGame].planets objectAtIndex:_target];
        Planet* p = _tplanet;
        if ([self getState] == LAND) {
            [self resetForces];
            cpBodySetVel(self.body, cpvzero);
            
            cpVect  axis = cpv(0,1);
            cpVect dir = cpvsub(cpv(self.position.x,self.position.y),cpv(p.position.x,p.position.y));
            
            float rot = acos(cpvdot(axis,dir)/(sqrt((dir.x*dir.x)+(dir.y*dir.y))));
            if(self.position.x > p.position.x){
                self.rotation = CC_RADIANS_TO_DEGREES(rot);
            }else{
                self.rotation = -CC_RADIANS_TO_DEGREES(rot);
            }
            
            self.position = cpvsub(p.position, cpvmult(cpvforangle(-CC_DEGREES_TO_RADIANS(p.rotation)), (MONKEY_HEIGHT/2) + p.radio - 10));
            
            //100 valor de el radio +eps
        }else if ([self getState] == SPACE) {
            [self resetForces];
            self.rotation = self.rotation + 4;
            
            cpVect aux = cpv(0,0);
            cpVect from = self.position;
            for (Planet* p in [self getGame].planets) {
                
                cpVect to = p.position;
                if(fabs(to.y - from.y) <= SCREEN_WIDTH/2){
                    cpVect vec = cpvsub(to, from);
                    aux = cpvadd(aux,cpvmult(vec, [p gravityForMonkey:self]));
                }
            }
            cpBodyApplyForce(self.body, aux
                             , cpvzero);
        }
        
    }
}

-(void)gameOver{
    [[self getGame] gameOver];
}

-(void)died{
    [self setTexture: [[CCTextureCache sharedTextureCache] addImage: @"monkey2.png"]];
    [self setState:DIED];
    [self performSelector:@selector(gameOver) withObject:nil afterDelay:2];
}

-(void)hurt{
    if([self isAlive]){
        [self setState:HURT];
        [self setTexture: [[CCTextureCache sharedTextureCache] addImage: @"monkey2.png"]];
        
        [self runAction:[CCSequence actions:
                         [CCFadeOut actionWithDuration:0.5],
                         [CCFadeIn actionWithDuration:0.5],
                         nil]];
        [self performSelector:@selector(space) withObject:nil afterDelay:2];
    }else{
        [self performSelector:@selector(died) withObject:nil afterDelay:1.5];
    }
}

-(void)won{
    [self resetForces];
    [self setState:WON];
}

-(void)jump{
    if([self getState] == LAND){
        [self resetForces];
        
        [self setTexture: [[CCTextureCache sharedTextureCache] addImage: @"monkey0.png"]];
        //Planet* p = [[self getGame].planets objectAtIndex:_target];
        Planet* p = _tplanet;
        cpVect pVect = cpv(p.position.x,p.position.y);
        cpVect pos = cpv(self.position.x,self.position.y);
        
        cpVect dir = cpvmult(cpvsub(pos,pVect), MONKEY_JUMP);
        
        [self applyImpulse:dir];
        
        [self setState:JUMP];
        
        [self performSelector:@selector(space) withObject:nil afterDelay:0.5];
    }
}

-(void)getNearest{
    int index = 0;
    Planet* nearer = [[self getGame].planets objectAtIndex:0];
    float bestD = [self distanceToObject:nearer];
    for (Planet* p in [self getGame].planets) {
        float actualD = [self distanceToObject:p];
        if (bestD >= actualD) {
            bestD = actualD;
            _target = index;
        }
        index++;
    }
}

-(float)distanceToObject:(Actor*)obj{
    float x = self.position.x - obj.position.x;
    float y = self.position.y - obj.position.y;
    float d = (x*x)+(y*y);
    return d;
}

-(void)heal{
    int life = [self getLife];
    if( life < 4){
        [[self getGame].lifeLayer setLife:life+1];
        [self setLife:life+1];
    }
}

-(void)space{
    if([self getState] == HURT || [self getState] == JUMP){
        [self setTexture: [[CCTextureCache sharedTextureCache] addImage: @"monkey0.png"]];        
        [self setState:SPACE];
    }
}

-(void)land{
    [self resetForces];
    if([self isAlive]){
        [self setTexture: [[CCTextureCache sharedTextureCache] addImage: @"monkey1.png"]];
        [self setState:LAND];
    }
}

-(void)attacked:(Alien*)alien{
    [self setState:ATTACKED];
    _alien = alien;
    [self damaged];
}

-(float)getLand{
    return _tplanet.position.y;
}

-(void)damaged{
    int life = [self getLife];
    [[self getGame].lifeLayer setLife:life-1];
    [self setLife: life-1];
}

-(BOOL)isAlive{
    return ([self getLife] == 0) ? NO : YES;
}
@end
