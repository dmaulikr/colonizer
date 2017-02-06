//
//  horizontalShooterAlien.h
//  Example 2.0
//
//  Created by Developer on 6/17/13.
//  Copyright (c) 2013 isee systems. All rights reserved.
//

#import "horizontalAlien.h"

@class Shot;

@interface horizontalShooterAlien : horizontalAlien

@property (nonatomic) Shot* shot;
@property (nonatomic) int timer;

-(void)makeShot;

@end
