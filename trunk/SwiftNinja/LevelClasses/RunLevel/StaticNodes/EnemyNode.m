//
//  EnemyNode.m
//  RunLevel
//
//  Created by User-03 on 12/8/14.
//  Copyright (c) 2014 TrainingCamp. All rights reserved.
//

#import "EnemyNode.h"
#import "ConstantsAndHelpers.h"

@implementation EnemyNode

+ (instancetype) enemyWithScene: (SKScene*) parentScene {
    EnemyNode* enemy = [self spriteNodeWithImageNamed:@"enemy.png"];
    enemy.velocity = kBackgroundVelocity;
    enemy.name = @"enemyObstacle";
    
    NSString *bloodEmitterPath = [[NSBundle mainBundle]  pathForResource:@"BloodEnemyParticle" ofType:@"sks"];
    enemy.bloodParticleEmitter =
    [NSKeyedUnarchiver unarchiveObjectWithFile:bloodEmitterPath];
    enemy.bloodParticleEmitter.name = @"BloodEmitter";
    
    enemy.position = CGPointMake(parentScene.view.bounds.size.width*(1.2+kPondPositionToScreenHeightFactor), parentScene.view.bounds.size.height*kEnemyPositionToScreenHeightFactor);
    enemy.size = CGSizeMake(parentScene.view.bounds.size.width/kEnemyResizeForScreenWidthFactor,
                           parentScene.view.bounds.size.height/kEnemyResizeForScreenHeightFactor);
    enemy.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:enemy.size];
    enemy.physicsBody.categoryBitMask = kCollisionEnemyCategory;
    enemy.physicsBody.collisionBitMask = kNinjaCategory | kCollisionDaggerCategory;
    enemy.physicsBody.contactTestBitMask = kNinjaCategory | kCollisionDaggerCategory;
    enemy.physicsBody.dynamic = NO;
    enemy.physicsBody.affectedByGravity = NO;
    
    return enemy;
}

- (void) moveWithBackground{
    
    self.position = CGPointMake(self.position.x - self.velocity, self.position.y);
    
}

@end
