//
//  BackgroundNode.h
//  RunLevel
//
//  Created by User-03 on 12/6/14.
//  Copyright (c) 2014 TrainingCamp. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface BackgroundNode : SKNode

@property CGFloat velocity;

- (instancetype)initWithScene: (SKScene*) parentScene andImageName: (NSString*) imageName andVelocity: (CGFloat) velocity;

- (void) adjustImageForScene: (SKScene*) scene withImageName: (NSString*) imageName;

- (void) move;

@end
