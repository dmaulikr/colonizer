//
//  BlockCreator.h
//  Example 2.0
//
//  Created by Developer on 6/18/13.
//  Copyright (c) 2013 isee systems. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Game;

@interface BlockCreator : NSObject

@property (nonatomic) Game* game;

-(id)initWithGame:(Game*)game;
-(int)createPlanet:(int)id from:(int)high;
-(int)createAlien:(int)id from:(int)high;
-(int)createFinishFrom:(int)high;
@end
