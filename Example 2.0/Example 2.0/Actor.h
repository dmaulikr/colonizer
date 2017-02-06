//
//  Actor.h
//  Example 2.0
//
//  Created by Developer on 6/12/13.
//  Copyright (c) 2013 isee systems. All rights reserved.
//

#import "cpCCSprite.h"
@class Game;

@interface Actor : cpCCSprite

@property (nonatomic) int life;
@property (nonatomic) int state;
@property (nonatomic) float radio;
@property (nonatomic,retain) Game* game;

-(void)setRadio:(float)radio;
-(float)getRadio;
-(void)setLife:(int)life;
-(int)getLife;
-(void)setState:(int)state;
-(int)getState;
-(void)autoRemove;
-(Game*)getGame;
-(BOOL)isVisible;
-(void)freeze;
@end
