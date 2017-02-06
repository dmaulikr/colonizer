//
//  Splash.m
//  Example 2.0
//
//  Created by Developer on 7/1/13.
//  Copyright (c) 2013 isee systems. All rights reserved.
//

#import "Splash.h"
#import "Menu.h"

@implementation Splash

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	Splash *layer = [Splash node];
	
	// add layer as a child to scene
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
        
        self.touchEnabled = YES;
        
        CGSize winSize = [[CCDirector sharedDirector] winSize];
        CCSprite * backgroundImage = [CCSprite spriteWithFile:@"splash.png"];
        
        CGSize imageSize = backgroundImage.contentSize;
        backgroundImage.scaleX = winSize.width / imageSize.width;
        backgroundImage.scaleY = winSize.height / imageSize.height;
        backgroundImage.position = cpv(winSize.width/2,winSize.height/2);
        [self addChild:backgroundImage z:0];
        
        [self performSelector:@selector(menu) withObject:nil afterDelay:3.0];
        
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


-(void)menu{
    [[CCDirector sharedDirector]pushScene:[Menu scene]];
}


@end
