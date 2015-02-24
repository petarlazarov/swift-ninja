//
//  ConstantsBalanceAndMemory.h
//  BalanceAndMemory
//
//  Created by User-03 on 12/10/14.
//  Copyright (c) 2014 TrainingCamp. All rights reserved.
//

#import <Foundation/Foundation.h>

static const float kPlaneMass = 200;
static const float kPlaneWidth = 300;
static const float kPlaneHeight = 15;
static const float kPlaneToScreenWidthPositioningFactor = 0.3;

static const float kBallMass = 10;
static const float kBallDiameter = 60;
static const float kBallDeflectFromPlane = 150;

static const float kKeyboardToScreenWidthFactor = 0.15;
static const float kKeyboardToScreenHeightFactor = 0.5;
static const float kKeysHeightInKeyboardFactor = 0.6;
static const float kKeysWidthInKeyboardFactor = 0.25;
static const float kKeysSizeToKeyboardSizeFactor = 0.48;

static const NSInteger kBalanceAndMemoryBackgroundVelocity = 1;


static const NSTimeInterval kTimeForNewNumberUpdate = 1.7;

@interface ConstantsBalanceAndMemory : NSObject

@end
