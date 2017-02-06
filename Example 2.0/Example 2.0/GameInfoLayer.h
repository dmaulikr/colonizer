//
//  GameInfoLayer.h
//  Example 2.0
//
//  Created by Developer on 7/1/13.
//  Copyright (c) 2013 isee systems. All rights reserved.
//

#import "CCLayer.h"
#import "CCLabelTTF.h"

@interface GameInfoLayer : CCLayer

@property (nonatomic,retain) CCSprite* b1;
@property (nonatomic,retain) CCSprite* b2;
@property (nonatomic,retain) CCSprite* b3;
@property (nonatomic,retain) CCSprite* b4;
-(id)init;
-(void)setLife:(int)number;

@end
