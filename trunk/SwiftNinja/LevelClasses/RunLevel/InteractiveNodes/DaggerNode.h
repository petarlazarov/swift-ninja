//
//  DaggerNode.h
//  RunLevel
//
//  Created by User-03 on 12/8/14.
//  Copyright (c) 2014 TrainingCamp. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface DaggerNode : SKSpriteNode

@property SKEmitterNode* particleEmitter;

@property CGFloat velocity;

+ (instancetype) daggerWithScene:(SKScene *)parentScene;

- (void) moveWithBackground;
- (void) moveForAttack;

@end
