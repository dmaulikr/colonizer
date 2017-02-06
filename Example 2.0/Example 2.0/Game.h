//
//  Game.h
//  Example 2.0
//
//  Created by Robert Blackwood on 6/27/12.
//  Copyright Robert Blackwood 2012. All rights reserved.
//


// When you import this file, you import all the cocos2d classes
#import "SpaceManagerCocos2d.h"
#import "SpaceMonkey.h"
#import "Planet.h"
#import "Alien.h"
#import "Satellite.h"
#import "SatPlanet.h"
#import "horizontalAlien.h"
#import "horizontalShooterAlien.h"
#import "BlockCreator.h"
#import "GameInfoLayer.h"
#import "Finish.h"

@interface Game : CCLayer

@property (nonatomic, retain) SpaceManagerCocos2d* smgr;
@property (nonatomic,retain) SpaceMonkey* monkey;
@property (nonatomic,retain) NSMutableArray* planets;
@property (nonatomic,retain) NSMutableArray* aliens;
@property (nonatomic,retain) NSMutableArray* satellites;
@property (nonatomic) int screenWidth;
@property (nonatomic,retain) BlockCreator* bCreator;
@property (nonatomic) BOOL levelIntro;
@property (nonatomic) int topCamera;
@property (nonatomic) int offset;
@property (nonatomic,retain) GameInfoLayer* lifeLayer;

// returns a CCScene that contains the Game as the only child
+(CCScene *) scene;
-(void)gameOver;
@end
