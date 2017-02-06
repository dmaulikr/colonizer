//
//  Shot.h
//  Example 2.0
//
//  Created by Developer on 6/17/13.
//  Copyright (c) 2013 isee systems. All rights reserved.
//

#import "Actor.h"
@class Alien;

@interface Shot : Actor

@property (nonatomic) Alien* alien;

-(id)initWithAlien:(Alien*)alien andGame:(Game*)game;
    
@end
