//
//  ProgressNode.m
//  TimerProgressNode
//
//  Created by User-03 on 12/12/14.
//  Copyright (c) 2014 TrainingCamp. All rights reserved.
//

#import "ProgressNode.h"

@interface ProgressNode()

@property NSTimeInterval timeSinceLastUpdate;
@property NSTimeInterval timeOfLastUpdate;
@property NSTimeInterval totalTimeForScene;
@property NSTimeInterval timeSinceLevelStarted;

@property CGFloat startingWidth;
@property CGFloat startingPositionX;

@end


@implementation ProgressNode

CGFloat progress;

+ (instancetype) progressWithScene:(SKScene *)parentScene andTotalTime: (NSTimeInterval) totalTime {
    

    
    ProgressNode *timeProgress = [[ProgressNode alloc] init];
    timeProgress.totalTimeForScene = totalTime;
    timeProgress.startingWidth =parentScene.view.bounds.size.width-50;
    timeProgress.startingPositionX = parentScene.view.bounds.size.width/4;
    timeProgress.name = @"progressBar";

    
    timeProgress.maskNode = [SKSpriteNode spriteNodeWithColor:[SKColor whiteColor] size:    CGSizeMake(timeProgress.startingWidth,
                                                                                                       50)];
    timeProgress.position = CGPointMake(timeProgress.startingPositionX, parentScene.view.bounds.size.height-20);
    
    SKSpriteNode* rope = [SKSpriteNode spriteNodeWithImageNamed:@"rope.jpg"];
    rope.size = CGSizeMake(timeProgress.startingWidth,rope.size.height*0.25);
    rope.position = CGPointMake(timeProgress.startingPositionX,0);
    [timeProgress addChild:rope];
    
    return timeProgress;
    
}

- (void) setProgress:(CGFloat) progress {
    self.maskNode.xScale = progress ;
    self.movementSpeedX = (1-progress)*self.startingWidth/2;
    self.maskNode.position = CGPointMake(self.startingPositionX-self.movementSpeedX, self.maskNode.position.y);
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
    if (self.timeSinceLevelStarted>self.totalTimeForScene) {
        return;
    }
    
    if (_timeOfLastUpdate) {
        self.timeSinceLastUpdate = currentTime -self.timeOfLastUpdate;
        self.timeSinceLevelStarted += self.timeSinceLastUpdate;
        
    }
    
    progress = (self.totalTimeForScene- self.timeSinceLevelStarted)/self.totalTimeForScene;
    [self setProgress:progress];
    
    self.timeOfLastUpdate = currentTime;
    
    
}

@end
