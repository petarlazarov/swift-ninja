//
//  BurningProgressbar.m
//  TimerProgressNode
//
//  Created by User-03 on 12/13/14.
//  Copyright (c) 2014 TrainingCamp. All rights reserved.
//

#import "BurningProgressbar.h"
#import "ProgressNode.h"

@interface BurningProgressbar ()

@property ProgressNode* burningRope;
@property SKEmitterNode* candlewickSpark;

@property CGFloat sparkStartingPositionX;


@end

@implementation BurningProgressbar

+ (instancetype) burningProgressbarWithScene: (SKScene*) parentScene andTotalTime: (NSTimeInterval) totalTime {
    
    BurningProgressbar* progressBar = [[self alloc] init];
    
    progressBar.sparkStartingPositionX =parentScene.view.bounds.size.width-25;
    progressBar.burningRope = [ProgressNode progressWithScene:parentScene andTotalTime:totalTime];
    [progressBar addChild:progressBar.burningRope];
    
    NSString *candleSparkPath = [[NSBundle mainBundle]  pathForResource:@"CandleWickSparkParticle" ofType:@"sks"];
    SKEmitterNode *candleSpark = [NSKeyedUnarchiver unarchiveObjectWithFile:candleSparkPath];
    progressBar.candlewickSpark = candleSpark;
    progressBar.candlewickSpark.position = CGPointMake(progressBar.sparkStartingPositionX, parentScene.view.bounds.size.height-20);
    [progressBar addChild:progressBar.candlewickSpark];
    
    
    return progressBar;
}

- (void) moveSpark {
    if (self.candlewickSpark.position.x > 25) {
        self.candlewickSpark.position = CGPointMake(self.sparkStartingPositionX - self.burningRope.movementSpeedX*2, self.candlewickSpark.position.y);
    }
    else {
        [self.candlewickSpark removeFromParent];
    }
    
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
    [self.burningRope update:currentTime];
    [self moveSpark];
    
    
}

@end
