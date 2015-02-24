//
//  DaggerNode.m
//  RunLevel
//
//  Created by User-03 on 12/8/14.
//  Copyright (c) 2014 TrainingCamp. All rights reserved.
//

#import "DaggerNode.h"
#import "ConstantsAndHelpers.h"



@implementation DaggerNode



+ (instancetype) daggerWithScene:(SKScene *)parentScene{
    DaggerNode *dagger = [self spriteNodeWithImageNamed:@"dagger.png"];
    dagger.velocity = kDaggerBonusVelocity;
    dagger.name = @"dagger";
    NSString *burstPath = [[NSBundle mainBundle]  pathForResource:@"daggerBonusParticle" ofType:@"sks"];
    SKEmitterNode *burstNode =
    [NSKeyedUnarchiver unarchiveObjectWithFile:burstPath];
    [dagger addChild:burstNode];
    
    
    dagger.position = CGPointMake(parentScene.view.bounds.size.width,
                                  parentScene.view.bounds.size.height*kDaggerHeightPositionFactor);
    dagger.size = CGSizeMake(parentScene.view.bounds.size.width/kDaggerResizeForScreenWidthFactor,
                             parentScene.view.bounds.size.height/kDaggerResizeForScreenHeightFactor);
    
    dagger.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:dagger.frame.size];
    dagger.physicsBody.affectedByGravity = NO;
    dagger.physicsBody.categoryBitMask = kCollisionDaggerCategory;
    dagger.physicsBody.collisionBitMask = kCollisionEnemyCategory;
    dagger.physicsBody.contactTestBitMask = kNinjaCategory | kCollisionEnemyCategory;
    
    
    
    return dagger;
}

- (void) moveWithBackground{

    self.physicsBody.velocity = CGVectorMake(kDaggerBonusVelocity, 0);
//    
//    if (self.position.x <1) {
//        
//    }

}

- (void) moveForAttack {
    self.position = CGPointMake(self.position.x + kBackgroundVelocity, self.position.y);
    NSLog(@"Moving for attack");
    
}



@end
