//
//  PondObstacleNode.h
//  RunLevel
//
//  Created by User-03 on 12/8/14.
//  Copyright (c) 2014 TrainingCamp. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface PondObstacleNode : SKSpriteNode

@property CGFloat velocity;

+ (instancetype) pondObstacleWithScene: (SKScene*) parentScene;

- (void) moveWithBackground;

@end
