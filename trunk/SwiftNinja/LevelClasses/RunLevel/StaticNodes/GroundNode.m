//
//  GroundNode.m
//  RunLevel
//
//  Created by User-03 on 12/8/14.
//  Copyright (c) 2014 TrainingCamp. All rights reserved.
//

#import "GroundNode.h"
#import "ConstantsAndHelpers.h"

@implementation GroundNode


+ (instancetype) groundWithScene: (SKScene*) parentScene {
    GroundNode* ground = [self spriteNodeWithColor:[SKColor clearColor] size:CGSizeMake(parentScene.view.bounds.size.width, 3)];;
    ground.name = @"ground";
    ground.position = CGPointMake(0, parentScene.view.bounds.size.height*kNinjaPositionToScreenHeightFactor);
    ground.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:ground.size];
    ground.physicsBody.categoryBitMask = kGroundCategory;
    ground.physicsBody.collisionBitMask = kNinjaCategory;
    ground.physicsBody.contactTestBitMask = kNinjaCategory;
    ground.physicsBody.dynamic = NO;
    ground.physicsBody.affectedByGravity = NO;
    
    return ground;
}

@end
