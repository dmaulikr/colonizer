//
//  Game.m
//  Example 2.0
//
//  Created by Robert Blackwood on 6/27/12.
//  Copyright Robert Blackwood 2012. All rights reserved.
//


// Import the interfaces
#import "Game.h"
// Needed to obtain the Navigation Controller
#import "AppDelegate.h"
#import "GameInfoLayer.h"
#import "Splash.h"
#import "GameOver.h"
// Functions to help with different screen sizes
#import "ScreenUtils.h"

#pragma mark - Game

// HelloWorldLayer implementation
@implementation Game

// Helper class method that creates a Scene with the Game as the only child.
+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	Game *layer = [Game node];
	
    GameInfoLayer* info = [[GameInfoLayer alloc ]init];
    info.position = cpv(20,550);

    [layer setLifeLayer:info];
	// add layer as a child to scene
    
    CGSize winSize = [[CCDirector sharedDirector] winSize];
    CCLayer* background = [[CCLayer alloc]init];
    CCSprite * backgroundImage = [CCSprite spriteWithFile:@"galaxy.jpg"];
    
    CGSize imageSize = backgroundImage.contentSize;
    backgroundImage.scaleX = winSize.width / imageSize.width;
    backgroundImage.scaleY = winSize.height / imageSize.height;
    [background addChild:backgroundImage z:0];
    background.position = cpv(winSize.width/2,winSize.height/2);
    
    [scene addChild: layer z:0];
    [scene addChild:info z:100];
    [scene addChild:background z:-1];
	
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
 
        // Initialize
        _smgr = [[SpaceManagerCocos2d spaceManager] retain];
        _bCreator = [[BlockCreator alloc]initWithGame:self];
        _levelIntro = YES;
        _offset = 500;
        _planets = [[NSMutableArray alloc]init];
        _satellites = [[NSMutableArray alloc]init];
        _aliens = [[NSMutableArray alloc]init];
        
        
        
        _screenWidth = winSize.width;
        // Set the world-to-physics-ratio for the coordinates
        // Only need to do this once (AppDelegate would be a better place)
        // and this will basically make the ipad's coordinate system roughly
        // equal to the iphones (480pts x 360pts)
        cpCCNodeImpl.xScaleRatio = DEVICE_X_RATIO;
        cpCCNodeImpl.yScaleRatio = DEVICE_X_RATIO;
        
        // Create a world boundary
        //        [_smgr addWindowContainmentWithFriction:1.0
        //                                     elasticity:0.8
        //                                           size:CGSizeMake( (isIpad() ? 360 : 320),480)
        //                                          inset:cpv(-2,-2)
        //                                         radius:3];
        _smgr.gravity = cpvzero;
        _smgr.cleanupBodyDependencies = YES;
        
        //space monkey
        _monkey = [[SpaceMonkey alloc]initWithGame:self];
        [self addChild:_monkey z:4];
        
        cpSpaceAddCollisionHandler([_smgr space], 0, 0, CollisionBegin, NULL, NULL, NULL, _monkey);
        
        float y = 100.0f;
        
        y = [_bCreator createPlanet:0 from:y];
        y = [_bCreator createPlanet:1 from:y];
        y = [_bCreator createAlien:7 from:y];
        [_bCreator createPlanet:7 from:y];
        y = [_bCreator createPlanet:4 from:y];
        y = [_bCreator createPlanet:1 from:y];
        y = [_bCreator createAlien:4 from:y];
        y = [_bCreator createPlanet:13 from:y];
        y = [_bCreator createPlanet:2 from:y];
        y = [_bCreator createPlanet:16 from:y];
        [_bCreator createAlien:1 from:y];
        y = [_bCreator createPlanet:9 from:y];
        y = [_bCreator createPlanet:5 from:y];
        y = [_bCreator createAlien:6 from:y];
        y = [_bCreator createPlanet:11 from:y];
        [_bCreator createAlien:4 from:y];
        y = [_bCreator createAlien:0 from:y];
        y = [_bCreator createPlanet:17 from:y];
        y = [_bCreator createPlanet:9 from:y];
        y = [_bCreator createPlanet:11 from:y];
        y = [_bCreator createAlien:8 from:y];
        y = [_bCreator createPlanet:8 from:y];
        y = [_bCreator  createAlien:7 from:y];
        y = [_bCreator createAlien:6 from:y];
        [_bCreator createPlanet:4 from:y];
        y = [_bCreator createPlanet:12 from:y];
        y = [_bCreator createFinishFrom:y];
        _topCamera = y;
        
        [self topCamera:_offset];
        _monkey.ignoreRotation = NO;
        
        //[self addChild:[_smgr createDebugLayer]];
        
        [_smgr start];
        
        [[CCDirector sharedDirector].scheduler scheduleUpdateForTarget:self priority:1 paused:NO];
	}
	return self;
}

- (void) update:(ccTime)delta
{
    
    if(_offset < _topCamera){
        _offset += 5;
        [self.camera setCenterX:0 centerY:_topCamera - _offset centerZ:0];
        [self.camera setEyeX:0 eyeY:_topCamera - _offset eyeZ:415];
    }else{
        [_monkey update:delta];
        
        for(int i = 0; i<[_aliens count]; i++){
            Alien* a = [_aliens objectAtIndex:i];
            [a update:delta];
        }
        
        for(int i = 0; i<[_satellites count]; i++){
            Satellite* s = [_satellites objectAtIndex:i];
            [s update:delta];
        }
        
        [self setCenterOfScreen:_monkey.position];
        
    }
    
}

-(void)topCamera:(int)y{
    [self.camera setCenterX:0 centerY:_topCamera -_offset centerZ:0];
    [self.camera setEyeX:0 eyeY:_topCamera -_offset eyeZ:415];
}


-(void)setCenterOfScreen:(CGPoint) position{
    CGSize screenSize = [[CCDirector sharedDirector]winSize];
    
    int y = MAX(position.y, screenSize.height/2);
    
    CGPoint goodPoint = ccp(screenSize.width/2, y);
    
    CGPoint centerOfScreen = ccp(screenSize.width/2, screenSize.height/2);
    CGPoint diference = cpvsub(centerOfScreen, goodPoint);
    if([_monkey getState] != LAND){
        self.position = diference;
    }
}

-(void)sel2:(cpCCSprite *)obj{
    NSLog(@"Force Applied");
    //cpBodyApplyForce(obj.body, cpv(800, -800), cpv(200, 100));
    [obj applyForce:cpv(8000, -8000)];
}
// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
    // Remove children before spacemanager to avoid clashing with spacemanager
    // and the autoFreeBodyAndShape property
    [self removeAllChildrenWithCleanup:YES];
    
    // Release the spacemanager
    [_smgr release];
	
	// don't forget to call "super dealloc"
	[super dealloc];
}

- (void)ccTouchesBegan:(NSSet*)touches withEvent:(UIEvent*)event
{
    //UITouch* touch = [touches anyObject];
    //in your touchesEnded event, you would want to see if you touched
    //down and then up inside the same place, and do your logic there.
    [_monkey jump];
}


static cpBool CollisionBegin(cpArbiter *arb, cpSpace *space, void *ptr){
    // the last argument to a collision handler function is the last value passed to cpSpaceAddCollisionHandler()
    CP_ARBITER_GET_SHAPES(arb, shape1, shape2);
    if([(id)shape2->data isKindOfClass: [SpaceMonkey class]]){
        SpaceMonkey* monkey = (SpaceMonkey*)ptr;
        //shape1 no es el monkey
        
        
        if([(id)shape1->data isKindOfClass: [SatPlanet class]] || [(id)shape1->data isKindOfClass: [Planet class]]){
            NSLog(@"planeta");
            if([monkey isAlive]){
                monkey.tplanet = (Planet*)shape1->data;
                [monkey land];
            }
        }else if([(id)shape1->data isKindOfClass: [Satellite class]]){
            NSLog(@"satelite");
            Satellite* sat = (Satellite*)shape1->data;
            [sat heal];
        }else if([(id)shape1->data isKindOfClass: [Alien class]]){
            Alien* alien = (Alien*)shape1->data;
            [alien attack];
        }else if([(id)shape1->data isKindOfClass: [Shot class]]){
                    
            if([(id)shape2->data isKindOfClass: [SpaceMonkey class]] ){
                [monkey damaged];
            }
            Shot* shot = (Shot*)shape1->data;
            [shot autoRemove];
        }
    }else if([(id)shape2->data isKindOfClass: [Finish class] ]){
        SpaceMonkey* monkey = (SpaceMonkey*)shape1->data;
        [monkey won];
        [Game performSelector:@selector(endGame) withObject:nil afterDelay:2.0];
    }
    return true;
}

-(void)gameOver{
    [[CCDirector sharedDirector]pushScene:[GameOver scene]];
}

+(void)endGame{
    [[CCDirector sharedDirector]pushScene:[Splash scene]];
}

@end
