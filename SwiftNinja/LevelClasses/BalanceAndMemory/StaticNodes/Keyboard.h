//
//  Keyboard.h
//  BalanceAndMemory
//
//  Created by User-03 on 12/17/14.
//  Copyright (c) 2014 TrainingCamp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SpriteKit/SpriteKit.h>
#import "SpriteButton.h"

@interface Keyboard : SKSpriteNode


@property(readonly) NSMutableArray* buttonArray;
@property SKLabelNode* displayLabel;
@property SKSpriteNode* displayBackground;

+ (instancetype) keyboardWithScene:(SKScene *)parentScene;

@end
