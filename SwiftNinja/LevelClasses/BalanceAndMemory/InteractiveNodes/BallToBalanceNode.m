//
//  BallToBalanceNode.m
//  BalanceAndMemory
//
//  Created by User-03 on 12/10/14.
//  Copyright (c) 2014 TrainingCamp. All rights reserved.
//

#import "BallToBalanceNode.h"
#import "ConstantsBalanceAndMemory.h"

@implementation BallToBalanceNode

+ (instancetype) ballToBalanceWithScene: (SKScene*) parentScene {
    BallToBalanceNode* ball = [self spriteNodeWithImageNamed:@"white_circle.png"];
    ball.position =CGPointMake((parentScene.view.bounds.size.width+kPlaneWidth)*kPlaneToScreenWidthPositioningFactor-kBallDeflectFromPlane, CGRectGetMidY(parentScene.frame)+kBallDeflectFromPlane);
    ball.size = CGSizeMake(kBallDiameter, kBallDiameter);
    ball.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:ball.frame.size];
    ball.physicsBody.affectedByGravity = YES;
    ball.physicsBody.mass = kBallMass;
    ball.physicsBody.friction = 0.01;
    
    return ball;
}

@end
