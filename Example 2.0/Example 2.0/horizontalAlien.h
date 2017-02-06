//
//  horizontalAlien.h
//  Example 2.0
//
//  Created by Developer on 6/17/13.
//  Copyright (c) 2013 isee systems. All rights reserved.
//

#import "Alien.h"

@interface horizontalAlien : Alien

@property (nonatomic) float vel;
@property (nonatomic) int dir;


-(id)initWithGame:(Game*)game andX:(int)x andY:(int)y andVel:(float)vel andDir:(int)dir;

@end
