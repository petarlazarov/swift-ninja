//
//  ProgressNode.h
//  TimerProgressNode
//
//  Created by User-03 on 12/12/14.
//  Copyright (c) 2014 TrainingCamp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SpriteKit/SpriteKit.h>

@interface ProgressNode : SKCropNode

@property CGFloat movementSpeedX;

+ (instancetype) progressWithScene:(SKScene *)parentScene andTotalTime: (NSTimeInterval) totalTime;
-(void)update:(CFTimeInterval)currentTime;
- (void) setProgress:(CGFloat) progress;

@end
