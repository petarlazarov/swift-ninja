//
//  BurningProgressbar.h
//  TimerProgressNode
//
//  Created by User-03 on 12/13/14.
//  Copyright (c) 2014 TrainingCamp. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface BurningProgressbar : SKSpriteNode

+ (instancetype) burningProgressbarWithScene: (SKScene*) parentScene andTotalTime: (NSTimeInterval) totalTime;

-(void)update:(CFTimeInterval)currentTime;

@end
