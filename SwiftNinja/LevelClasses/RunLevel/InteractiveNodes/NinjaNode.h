//
//  NinjaNode.h
//  RunLevel
//
//  Created by User-03 on 12/7/14.
//  Copyright (c) 2014 TrainingCamp. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface NinjaNode : SKSpriteNode

@property NSInteger jumpsCount;
@property NSInteger ammo;


+ (instancetype) ninjaWithScene:(SKScene *)parentScene;

- (void) jump;
- (void) attack;
- (void) die;

@end
