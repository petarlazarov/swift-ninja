//
//  BalancePlaneNode.m
//  BalanceAndMemory
//
//  Created by User-03 on 12/10/14.
//  Copyright (c) 2014 TrainingCamp. All rights reserved.
//

#import "BalancePlaneNode.h"
#import "ConstantsBalanceAndMemory.h"

@interface BalancePlaneNode()

@property(readwrite) SKSpriteNode *anchor;

@end

@implementation BalancePlaneNode

+ (instancetype) balancePlaneNodeWithScene : (SKScene*) parentScene {
    BalancePlaneNode* plane = [self spriteNodeWithColor:[UIColor redColor] size:CGSizeMake(kPlaneWidth , kPlaneHeight) ];
    plane.position =CGPointMake(parentScene.frame.size.width*kPlaneToScreenWidthPositioningFactor, CGRectGetMidY(parentScene.frame));
    
    //   CGPointMake(anchor.position.x, anchor.position.y);
    plane.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:plane.frame.size];
    plane.physicsBody.affectedByGravity = YES;
    plane.physicsBody.mass = kPlaneMass;
    plane.physicsBody.friction = 0.01;
    
    plane.anchor = [SKSpriteNode spriteNodeWithColor:[UIColor clearColor] size:CGSizeMake(1, 1)];
    plane.anchor.position = CGPointMake(parentScene.frame.size.width*kPlaneToScreenWidthPositioningFactor, CGRectGetMidY(parentScene.frame));
    plane.anchor.name = @"plane_anchor";
    plane.anchor.physicsBody = [SKPhysicsBody bodyWithCircleOfRadius:1];
    plane.anchor.physicsBody.affectedByGravity = NO;
    plane.anchor.physicsBody.dynamic = false;
    plane.anchor.physicsBody.friction = 0.7;
    [plane addChild:plane.anchor];
    
    

    
    return plane;
}

@end
