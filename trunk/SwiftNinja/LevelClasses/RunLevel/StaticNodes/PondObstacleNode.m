//
//  PondObstacleNode.m
//  RunLevel
//
//  Created by User-03 on 12/8/14.
//  Copyright (c) 2014 TrainingCamp. All rights reserved.
//

#import "PondObstacleNode.h"
#import "ConstantsAndHelpers.h"

@implementation PondObstacleNode

+ (instancetype) pondObstacleWithScene: (SKScene*) parentScene {
    PondObstacleNode* pond = [self spriteNodeWithImageNamed:@"pondobstacle.png"];
    pond.velocity = kBackgroundVelocity;
    pond.name = @"pondObstacle";
    pond.position = CGPointMake(parentScene.view.bounds.size.width*(1+kPondPositionToScreenHeightFactor), parentScene.view.bounds.size.height*kPondPositionToScreenHeightFactor);
    pond.size = CGSizeMake(parentScene.view.bounds.size.width/kPondResizeForScreenSizeFactor,
                            parentScene.view.bounds.size.height/kPondResizeForScreenSizeFactor);
    pond.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:pond.size];
    pond.physicsBody.categoryBitMask = kCollisionPondObstacleCategory;
    pond.physicsBody.collisionBitMask = kNinjaCategory;
    pond.physicsBody.contactTestBitMask = kNinjaCategory;
    pond.physicsBody.dynamic = NO;
    pond.physicsBody.affectedByGravity = NO;
    
    return pond;
}

- (void) moveWithBackground{
    
    self.position = CGPointMake(self.position.x - self.velocity, self.position.y);
    
}

@end
