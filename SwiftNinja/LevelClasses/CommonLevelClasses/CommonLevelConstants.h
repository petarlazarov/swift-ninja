//
//  CommonLevelConstants.h
//  GameClient
//
//  Created by User-03 on 12/13/14.
//  Copyright (c) 2014 TrainingCamp. All rights reserved.
//

#import <Foundation/Foundation.h>


//level durations
static const NSTimeInterval kPopingCirclesLevelTime = 10;
static const NSTimeInterval kFlyLevelTime = 10;
static const NSTimeInterval kRunLevelTime = 15;
static const NSTimeInterval kCardsLevelTime = 10;
static const NSTimeInterval kBalanceAndMemoryTime = 30;
static const NSTimeInterval kBottlesLevelTime = 6;
static const NSTimeInterval kTypeNinjaLevelTime = 6;
static const NSTimeInterval kChessLevelTime = 30;
static const NSTimeInterval kPuzzleLevelTime=10;
static const NSTimeInterval kSpaceshipLevel=30;

static const float kScoreLabelScreenPositioningFactorWidth = 0.8;
static const float kScoreLabelScreenPositioningFactorHeight = 0.90;

//run level points
static const NSInteger kPointsForTakingDagger = 50;
static const NSInteger kPointsForKillingMonster = 25;

static const NSInteger kPointsForCorrectNumber = 50;
static const NSInteger kPenaltyPointsForWrongNumber = 25;


@interface CommonLevelConstants : NSObject

@end
