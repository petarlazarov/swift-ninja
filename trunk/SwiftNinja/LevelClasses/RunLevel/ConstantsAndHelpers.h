//
//  ConstantsAndHelpers.h
//  RunLevel
//
//  Created by User-03 on 12/8/14.
//  Copyright (c) 2014 TrainingCamp. All rights reserved.
//

#import <Foundation/Foundation.h>

static const float kNinjaPositionToScreenWidthFactor = 0.15;
static const float kNinjaPositionToScreenHeightFactor = 0.15;
static const float kNinjaResizeForScreenSizeFactor = 4.5;
static const float kNinjaJumpVelocityMultiplier =0.9;

static const float kDaggerHeightPositionFactor = 0.6;
static const float kDaggerResizeForScreenWidthFactor = 30;
static const float kDaggerResizeForScreenHeightFactor = 13;
static const float kDaggerBonusVelocity = -350;

static const float kPondPositionToScreenHeightFactor = 0.1;
static const float kPondResizeForScreenSizeFactor = 5;

static const float kEnemyResizeForScreenWidthFactor = 10;
static const float kEnemyResizeForScreenHeightFactor = 4;
static const float kEnemyPositionToScreenHeightFactor = 0.2;

static const NSInteger kNinjaCategory    =  1 << 0;
static const NSInteger kGroundCategory     =  1 << 1;
static const NSInteger kCollisionDaggerCategory = 1 << 2;
static const NSInteger kCollisionEnemyCategory = 1 << 3;
static const NSInteger kCollisionPondObstacleCategory = 1 << 4;

static const NSInteger kBackgroundVelocity = 12;

static const NSTimeInterval kTimeForPondSpawn = 4;
static const NSTimeInterval kTimeForBonusDaggerSpawn = 2.8;
static const NSTimeInterval kTimeForEnemySpawn = 4.3;
static const NSTimeInterval kBloodParticleLifetime = 0.2;

@interface ConstantsAndHelpers : NSObject

@end
