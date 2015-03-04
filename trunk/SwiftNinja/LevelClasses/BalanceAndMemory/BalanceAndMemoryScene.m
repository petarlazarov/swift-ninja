//
//  GameScene.m
//  BalanceAndMemory
//
//  Created by User-03 on 12/9/14.
//  Copyright (c) 2014 TrainingCamp. All rights reserved.
//

#import "BalanceAndMemoryScene.h"
#import "BalancePlaneNode.h"
#import "BallToBalanceNode.h"
#import "ConstantsBalanceAndMemory.h"
#import "RandomNumberHandler.h"
#import "Keyboard.h"
#import "BackgroundNode.h"
#import "SpriteButton.h"

@interface BalanceAndMemoryScene()

@property RandomNumberHandler* handler;
@property Keyboard* keyboard;
@property SKLabelNode* labelWithNumber;
@property SKSpriteNode* labelBackground;

@property NSTimeInterval timeSinceLastNewNumberShown;
@property NSTimeInterval timeOfLastUpdateLocal;
@property NSTimeInterval timeSinceLastUpdateLocal;






@end


@implementation BalanceAndMemoryScene

BalancePlaneNode* plane;
BallToBalanceNode* ball;
BackgroundNode* background;
NSTimer *timer;
float rotation;
UIColor* feedbackColor;

BOOL isButtonPressed;
BOOL hasGameEnded;

-(void)didMoveToView:(SKView *)view {
    /* Setup your scene here */
    [super didMoveToView:view];
    
    feedbackColor = [UIColor blackColor];
    self.timeSinceLastNewNumberShown = 0;
    isButtonPressed = NO;
    hasGameEnded = NO;
    

    background = [[BackgroundNode alloc] initWithScene:self andImageName:@"backgroundBML" andVelocity:kBalanceAndMemoryBackgroundVelocity];
    background.zPosition = -2;
    [self addChild:background];
    
    self.handler = [[RandomNumberHandler alloc] init];
    
    
    
    
    CMMotionManager* motionManager = [[CMMotionManager alloc] init];
    motionManager.deviceMotionUpdateInterval = 1/30; // 30 frames per second
    
    //start the motion updates with a queue
    [motionManager startDeviceMotionUpdatesToQueue: [[NSOperationQueue alloc] init]
                                       withHandler: ^(CMDeviceMotion *motion, NSError *error) {

                                           if ( !motionManager || !plane )
                                               return;
                                           
                                           //make the changes in the main thread, so it can be rendered correctly
                                           dispatch_async( dispatch_get_main_queue(), ^{
                                               plane.zRotation = motion.attitude.pitch;
                                           });
                                           
                                       }];
    
    
    plane = [BalancePlaneNode balancePlaneNodeWithScene:self];
    [self addChild:plane];
    ball = [BallToBalanceNode ballToBalanceWithScene:self];
    [self addChild:ball];

    
    
    SKPhysicsJointLimit* joint = [SKPhysicsJointLimit jointWithBodyA:plane.anchor.physicsBody
                                                               bodyB:plane.physicsBody
                                                             anchorA:plane.anchor.position
                                                             anchorB:plane.position];
    [self.physicsWorld addJoint:joint];
    

    self.keyboard = [Keyboard keyboardWithScene:self];
    self.keyboard.position = CGPointMake(self.view.bounds.size.width*0.75, self.view.bounds.size.height/2);
    [self addChild:self.keyboard];
    
    for (int keyIndex=0; keyIndex<10; keyIndex++) {
        [(AGSpriteButton*)self.keyboard.buttonArray[keyIndex] performBlock:^{
            if ([self.handler checkNumber:keyIndex]) {
                feedbackColor = [UIColor greenColor];
                [self setCurrentScore:kPointsForCorrectNumber];
            }
            else {
                feedbackColor = [UIColor redColor];
                if ([self getCurrentScore]>kPenaltyPointsForWrongNumber) {
                    [self setCurrentScore:(-kPenaltyPointsForWrongNumber)];                }
                else {
                    self.currentScore = 0;
                }
            }
            isButtonPressed= YES;
        } onEvent:AGButtonControlEventTouchUp];
    }
    
    //temporary instruction image node - to be removed
    SKSpriteNode* instructions = [SKSpriteNode spriteNodeWithImageNamed:@"instructions"];
    instructions.position = CGPointMake(self.keyboard.position.x-70, self.keyboard.position.y+210);
    [self addChild:instructions];
    
}


- (void) endGame {
    [self removeAllActions  ];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oopps, you lose."
                                                    message:@""
                                                   delegate:self
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
    
    [self.motionManager stopDeviceMotionUpdates];
    self.motionManager = nil;
    
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    // the user clicked OK
        [[NSNotificationCenter defaultCenter]
         postNotificationName:@"EndGame"
         object:self];
    
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */

}



-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
    self.keyboard.displayBackground.color = feedbackColor;
    
    if (ball.position.y < -self.frame.size.height*0.7) {
        if (!hasGameEnded) {
            [self endGame];
        }
        hasGameEnded = YES;
        return;
    }
    
    [super update:currentTime];
    
    if (isButtonPressed) {
        self.labelWithNumber.text = @"";
        self.labelBackground.color = [UIColor blackColor];
        isButtonPressed= NO;
    }
        
    
    if (_timeOfLastUpdateLocal) {
        self.timeSinceLastUpdateLocal = currentTime -self.timeOfLastUpdateLocal;
        self.timeSinceLastNewNumberShown += self.timeSinceLastUpdateLocal;
    }
    
    if (self.timeSinceLastNewNumberShown > kTimeForNewNumberUpdate) {
        [self.handler getNewNumber];
        self.keyboard.displayLabel.text = [NSString stringWithFormat:@"%@", self.handler.numberList[0]];
        feedbackColor = [UIColor blackColor];
        self.timeSinceLastNewNumberShown = 0;
    }    

    [background move];
    
    _timeOfLastUpdateLocal = currentTime;
    
    
    
}

@end
