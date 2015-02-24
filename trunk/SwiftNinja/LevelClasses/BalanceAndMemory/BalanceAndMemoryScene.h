//
//  GameScene.h
//  BalanceAndMemory
//

//  Copyright (c) 2014 TrainingCamp. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import <CoreMotion/CoreMotion.h>
#import "AbstractLevel.h"

#import "CommonLevelConstants.h"

@interface BalanceAndMemoryScene : AbstractLevel <UIAccelerometerDelegate>

@property (strong, nonatomic) CMMotionManager* motionManager;

@end
