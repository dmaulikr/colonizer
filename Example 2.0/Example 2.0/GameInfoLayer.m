//
//  GameInfoLayer.m
//  Example 2.0
//
//  Created by Developer on 7/1/13.
//  Copyright (c) 2013 isee systems. All rights reserved.
//

#import "GameInfoLayer.h"

@implementation GameInfoLayer

-(id)init{
    self = [super init];
    if(self){
        _b1 = [CCSprite spriteWithFile:@"bananaLife.png"];
        _b2 = [CCSprite spriteWithFile:@"bananaLife.png"];
        _b3 = [CCSprite spriteWithFile:@"bananaLife.png"];
        _b4 = [CCSprite spriteWithFile:@"bananaLife.png"];
        [_b1 setPosition:CGPointMake(0, 0)];
        [_b2 setPosition:CGPointMake(50, 0)];
        [_b3 setPosition:CGPointMake(100, 0)];
        [_b4 setPosition:CGPointMake(150, 0)];
        [self addChild:_b1 z:0];
        [self addChild:_b2 z:0];
        [self addChild:_b3 z:0];
        [self addChild:_b4 z:0];
    }
    return self;
}

-(void)setLife:(int)number{
    _b1 = [CCSprite spriteWithFile:@"bananaLife.png"];
    _b2 = [CCSprite spriteWithFile:@"bananaLife.png"];
    _b3 = [CCSprite spriteWithFile:@"bananaLife.png"];
    _b4 = [CCSprite spriteWithFile:@"bananaLife.png"];
    [_b1 setPosition:CGPointMake(0, 0)];
    [_b2 setPosition:CGPointMake(50, 0)];
    [_b3 setPosition:CGPointMake(100, 0)];
    [_b4 setPosition:CGPointMake(150, 0)];
    [self removeAllChildrenWithCleanup:YES
     ];
    switch (number) {
        case 4:
            [self addChild:_b4 z:0];
            [self addChild:_b3 z:0];
            [self addChild:_b2 z:0];
            [self addChild:_b1 z:0];
            break;
        case 3:
            [self addChild:_b3 z:0];
            [self addChild:_b2 z:0];
            [self addChild:_b1 z:0];
            
            break;
        case 2:
            [self addChild:_b2 z:0];
            [self addChild:_b1 z:0];
            break;
        case 1:
            [self addChild:_b1 z:0];
            break;
        default:
            break;
    }
}

@end
