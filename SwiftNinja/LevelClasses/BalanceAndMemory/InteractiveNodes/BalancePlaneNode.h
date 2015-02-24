//
//  BalancePlaneNode.h
//  BalanceAndMemory
//
//  Created by User-03 on 12/10/14.
//  Copyright (c) 2014 TrainingCamp. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface BalancePlaneNode : SKSpriteNode

@property(readonly) SKSpriteNode *anchor;

+ (instancetype) balancePlaneNodeWithScene : (SKScene*) parentScene;

@end
