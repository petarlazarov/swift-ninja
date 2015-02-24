//
//  GameScene.m
//  RunLevel
//
//  Created by User-03 on 12/5/14.
//  Copyright (c) 2014 TrainingCamp. All rights reserved.
//

#import "GameScene.h"
#import "BackgroundNode.h"
#import "NinjaNode.h"
#import "GroundNode.h"
#import "DaggerNode.h"
#import "ConstantsAndHelpers.h"
#import "PondObstacleNode.h"
#import "EnemyNode.h"
#import "BurningProgressbar.h"
#import "ProgressNode.h"

@interface GameScene()

@property NSTimeInterval timeSincePondAdded;
@property NSTimeInterval timeSinceEnemyAdded;
@property NSTimeInterval timeSinceBonusDaggerAdded;
@property NSTimeInterval timeSinceEnemyKilled;
@property NSTimeInterval localTimeSinceLastUpdate;
@property NSTimeInterval localTimeOfLastUpdate;



@end

@implementation GameScene

DaggerNode* dagger;
EnemyNode* enemy;
NinjaNode *ninja;
BackgroundNode *background;
GroundNode* ground;
PondObstacleNode* pond;
BOOL hasGameEnded;
int contactsCount;

UISwipeGestureRecognizer* swipeUpGestureRecognizer;
UISwipeGestureRecognizer* swipeRightGestureRecognizer;



-(void)didMoveToView:(SKView *)view {
    /* Setup your scene here */
    
    
    hasGameEnded = NO;
    
    self.physicsWorld.contactDelegate = self;
    self.timeSinceBonusDaggerAdded = 0;
    self.timeSincePondAdded = 0;
    self.timeSinceEnemyAdded = 0;
    contactsCount = 0;
    
    background = [[BackgroundNode alloc] initWithScene:self andImageName:@"background" andVelocity:kBackgroundVelocity];
    [self addChild:background];

    
    ground = [GroundNode groundWithScene:self];
    [self addChild:ground];
    
    dagger = [DaggerNode daggerWithScene:self];
    dagger.name = @"dagger";
    [dagger moveWithBackground];
    [self addChild:dagger];
    
    ninja =  [NinjaNode ninjaWithScene:self];
    [self addChild:ninja];
    
    pond = [PondObstacleNode pondObstacleWithScene:self];
    [self addChild:pond];
    
    enemy = [EnemyNode enemyWithScene:self];
    [self addChild:enemy];
        
    swipeUpGestureRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];
    swipeUpGestureRecognizer.direction = UISwipeGestureRecognizerDirectionUp;
    [[self view] addGestureRecognizer:swipeUpGestureRecognizer];
    
    swipeRightGestureRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];
    swipeRightGestureRecognizer.direction = UISwipeGestureRecognizerDirectionRight;
    [[self view] addGestureRecognizer:swipeRightGestureRecognizer];

    
    [super didMoveToView:view];
}


- (void)handleSwipe:(UISwipeGestureRecognizer*)sender {

    if (sender.direction == UISwipeGestureRecognizerDirectionUp) {
        [ninja jump];
    }
    if (sender.direction == UISwipeGestureRecognizerDirectionRight) {
        [ninja attack];
        NSLog(@"Attack swipe");
    }
}



- (void)didBeginContact:(SKPhysicsContact *)contact
{
    SKPhysicsBody *firstBody, *secondBody;
    
    if (contact.bodyA.categoryBitMask < contact.bodyB.categoryBitMask)
    {
        firstBody = contact.bodyA;
        secondBody = contact.bodyB;
    }
    else
    {
        firstBody = contact.bodyB;
        secondBody = contact.bodyA;
    }
    
    if ((firstBody.categoryBitMask == kNinjaCategory) && (secondBody.categoryBitMask == kGroundCategory))
    {
        ninja.jumpsCount = 0;
    }
    if ((firstBody.categoryBitMask == kNinjaCategory) && (secondBody.categoryBitMask == kCollisionDaggerCategory)) {
        ninja.ammo++;
        self.currentScore+=kPointsForTakingDagger;
        [secondBody.node removeFromParent];
        firstBody = nil;
        secondBody = nil;
    }
    if ((firstBody.categoryBitMask == kNinjaCategory) && ((secondBody.categoryBitMask == kCollisionPondObstacleCategory) || (secondBody.categoryBitMask == kCollisionEnemyCategory))&& contactsCount <1) {
        contactsCount++;
        [self endGame];
    }
    
    if ((firstBody.categoryBitMask == kCollisionDaggerCategory) && (secondBody.categoryBitMask == kCollisionEnemyCategory)) {
        [firstBody.node removeFromParent];
        self.currentScore+=kPointsForKillingMonster;
        
        NSString *bloodEmitterPath = [[NSBundle mainBundle]  pathForResource:@"BloodParticle" ofType:@"sks"];
        SKEmitterNode* bloodEmitter =
        [NSKeyedUnarchiver unarchiveObjectWithFile:bloodEmitterPath];
        bloodEmitter.name = @"BloodEmitter";
        bloodEmitter.position = secondBody.node.position;
        [self addChild:bloodEmitter];
        
        [secondBody.node removeFromParent];
        self.timeSinceEnemyKilled = 0;
    }
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
 
}


//called when ninja dies
- (void) endGame {
    
    [ninja die];
    [self.view removeGestureRecognizer:swipeUpGestureRecognizer];
    [self.view removeGestureRecognizer:swipeRightGestureRecognizer];
    [[self childNodeWithName:@"attackDagger"] removeFromParent];
    [[self childNodeWithName:@"BloodEmitter" ] removeFromParent];
    [self removeAllActions  ];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"You're dead!"
                                                    message:@""
                                                   delegate:self
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
    
    hasGameEnded = YES;
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    // the user clicked OK
    if (buttonIndex == 0) {
        [[NSNotificationCenter defaultCenter]
         postNotificationName:@"EndGame"
         object:self];
    }
}


//updating each frame
-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
    
    if (hasGameEnded) {
        return;
    }
    
    if (self.hasLevelEnded == YES) {
        [self removeAllActions];
        return;
    }
    
    [super update:currentTime];
    
    if (_localTimeOfLastUpdate) {
        self.localTimeSinceLastUpdate = currentTime -_localTimeOfLastUpdate;
        self.timeSinceBonusDaggerAdded += self.localTimeSinceLastUpdate;
        self.timeSincePondAdded += self.localTimeSinceLastUpdate;
        self.timeSinceEnemyAdded += self.localTimeSinceLastUpdate;
        
        if ([self childNodeWithName:@"BloodEmitter"]) {
            self.timeSinceEnemyKilled += self.localTimeSinceLastUpdate ;
        }
    }
    
    if (self.timeSinceBonusDaggerAdded > kTimeForBonusDaggerSpawn) {
        dagger = [DaggerNode daggerWithScene:self];
        dagger.name = @"dagger";
        [dagger moveWithBackground];
        [self addChild:dagger];
        self.timeSinceBonusDaggerAdded=0;
    }
    
    if (self.timeSincePondAdded > kTimeForPondSpawn) {
        pond = [PondObstacleNode pondObstacleWithScene:self];
        pond.name = @"pond";
        [self addChild:pond];
        self.timeSincePondAdded=0;
    }
    if (self.timeSinceEnemyAdded > kTimeForEnemySpawn) {
        enemy = [EnemyNode enemyWithScene:self];
        enemy.name = @"enemy";
        [self addChild:enemy];
        self.timeSinceEnemyAdded=0;
    }
    
    if (self.timeSinceEnemyKilled > kBloodParticleLifetime) {
        [[self childNodeWithName:@"BloodEmitter" ] removeFromParent];
    }
    
    
    //    [self.background move];
    [pond moveWithBackground];
    [enemy moveWithBackground];
    [background move];
    
    _localTimeOfLastUpdate = currentTime;
    
    
}



@end
