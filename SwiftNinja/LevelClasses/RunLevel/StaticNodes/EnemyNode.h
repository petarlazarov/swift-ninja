//
//  EnemyNode.h
//  RunLevel
//
//  Created by User-03 on 12/8/14.
//  Copyright (c) 2014 TrainingCamp. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface EnemyNode : SKSpriteNode

@property CGFloat velocity;
@property SKEmitterNode* bloodParticleEmitter;

+ (instancetype) enemyWithScene: (SKScene*) parentScene;

- (void) moveWithBackground;

@end
