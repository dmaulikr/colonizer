//
//  GameOver.m
//  Example 2.0
//
//  Created by Developer on 7/2/13.
//  Copyright (c) 2013 isee systems. All rights reserved.
//

#import "GameOver.h"
#import "SpaceManagerCocos2d.h"
#import "Menu.h"

@implementation GameOver

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	GameOver *layer = [GameOver node];
	
	// add layer as a child to scene
   

    [scene addChild: layer z:0];
	
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
        CCSprite * backgroundImage = [CCSprite spriteWithFile:@"gameover.png"];
        
        CGSize imageSize = backgroundImage.contentSize;
//      backgroundImage.scaleX = winSize.width / imageSize.width;
//      backgroundImage.scaleY = winSize.height / imageSize.height;
        backgroundImage.position = cpv(winSize.width/2,winSize.height/2);
        [self addChild:backgroundImage z:0];
        
        CCLabelTTF* label = [CCLabelTTF labelWithString:@"TOUCH TO GO\nBACK TO MENU" fontName:@"CopaBanana" fontSize:30];
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
    [[CCDirector sharedDirector]pushScene:[Menu scene]];
}

@end
