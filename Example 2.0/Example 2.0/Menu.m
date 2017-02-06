//
//  Menu.m
//  Example 2.0
//
//  Created by Developer on 7/1/13.
//  Copyright (c) 2013 isee systems. All rights reserved.
//

#import "Menu.h"
#import "Game.h"

@implementation Menu
+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	Menu *layer = [Menu node];
	//hay que crear una clase y schedulear el update
	// add layer as a child to scene\\
//    CCLayer * animations = [CCLayer alloc];
//    horizontalAlien * a1 = [[horizontalAlien alloc]initWithGame:nil andX:160 andY:400 andVel:1 andDir:-1];
//    [animations addChild:a1 z:0];
//    [scene addChild:animations z:4];
    
    
    [scene addChild: layer z:1];
	
	// return the scene
	return scene;
}
// on "init" you need to initialize your instance
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super's" return value
	if( (self=[super init]) ) {
        
        self.isTouchEnabled = YES;
        
        CGSize winSize = [[CCDirector sharedDirector] winSize];
        CCSprite * gameName = [CCSprite spriteWithFile:@"gameName.png"];
        gameName.position = cpv(winSize.width/2,winSize.height/2);
        [self addChild:gameName z:0];
        
        CCLabelTTF* label = [CCLabelTTF labelWithString:@"TOUCH TO PLAY" fontName:@"CopaBanana" fontSize:30];
        [label setColor:ccYELLOW];
        label.position = cpv(winSize.width/2, winSize.height/4);
        [self addChild:label z:0];
        
        
        
    }
	return self;
}

- (void)ccTouchesBegan:(NSSet*)touches withEvent:(UIEvent*)event
{
    UITouch* touch = [touches anyObject];
    //in your touchesEnded event, you would want to see if you touched
    //down and then up inside the same place, and do your logic there.
    [[CCDirector sharedDirector]pushScene:[Game scene]];
}


@end
