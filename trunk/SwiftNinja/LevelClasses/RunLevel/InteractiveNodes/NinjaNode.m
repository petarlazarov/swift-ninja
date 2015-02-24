//
//  NinjaNode.m
//  RunLevel
//
//  Created by User-03 on 12/7/14.
//  Copyright (c) 2014 TrainingCamp. All rights reserved.
//

#import "NinjaNode.h"
#import "ConstantsAndHelpers.h"
#import "DaggerNode.h"

@interface NinjaNode ()

@property SKAction* runningAnimation;
@property SKAction* jumpAnimation;
@property SKAction* dieAnimation;
@property CGFloat jumpYVelocity;
@property SKScene* parentScene;


@end

@implementation NinjaNode





+ (instancetype) ninjaWithScene:(SKScene *)parentScene {
    NinjaNode *ninja = [self spriteNodeWithImageNamed:@"ninja_run_1@2x"];
    ninja.parentScene = parentScene;
    ninja.name = @"ninja";
    ninja.ammo = 1;
    ninja.jumpYVelocity = parentScene.frame.size.height*kNinjaJumpVelocityMultiplier;
    ninja.jumpsCount = 0;
    ninja.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:ninja.frame.size];
    ninja.physicsBody.categoryBitMask = kNinjaCategory;
    ninja.physicsBody.collisionBitMask = kGroundCategory;
    ninja.physicsBody.contactTestBitMask = kGroundCategory | kCollisionDaggerCategory;
    
    ninja.position = CGPointMake(parentScene.view.bounds.size.width*
                                 kNinjaPositionToScreenWidthFactor,
                                 parentScene.view.bounds.size.height*
                                 kNinjaPositionToScreenHeightFactor);
    ninja.size = CGSizeMake(parentScene.view.bounds.size.width/kNinjaResizeForScreenSizeFactor,
                            parentScene.view.bounds.size.height/kNinjaResizeForScreenSizeFactor);
    ninja.runningAnimation = [SKAction animateWithTextures:
                             [ninja ninjaFramesWithStringFormat:@"ninja_run_%i@2x" andNumberOfFrames:8]
                                             timePerFrame:0.1];
    [ninja runAction:[SKAction repeatActionForever:ninja.runningAnimation] withKey:@"RunningAnimation"];
    
    ninja.jumpAnimation = [SKAction animateWithTextures:
                          [ninja ninjaFramesWithStringFormat:@"ninja_jump_%i@2x" andNumberOfFrames:4]
                                          timePerFrame:0.15];
    
    ninja.dieAnimation = [SKAction animateWithTextures:
                          [ninja ninjaFramesWithStringFormat:@"ninja_fall_%i@2x.png" andNumberOfFrames:7]
                                          timePerFrame:0.20];
 

    return ninja;
}



- (NSArray*) ninjaFramesWithStringFormat : (NSString*) string andNumberOfFrames: (int) numberOfFrames {
    NSMutableArray* tempFramesArray = [[NSMutableArray alloc] init];
    for (int i =1; i<numberOfFrames; i++) {
        NSString* imageName = [NSString stringWithFormat:string, i];
        SKTexture* frameTexture = [SKTexture textureWithImageNamed:imageName];
        [tempFramesArray addObject:frameTexture];
    }
    return tempFramesArray;
}

- (void) jump {
    if (self.jumpsCount<1) {
        self.physicsBody.velocity = CGVectorMake(0, self.jumpYVelocity);
        [self runAction:self.jumpAnimation];
        self.jumpsCount++;
    }
}

- (void) attack {
    if (self.ammo>0) {
        DaggerNode* attackDagger = [DaggerNode daggerWithScene:self.parentScene];
        attackDagger.name = @"attackDagger";
        NSLog(@"Attacked");
        attackDagger.position = CGPointMake(self.position.x+self.size.width/2, self.position.y+self.frame.size.height*0.1);
        attackDagger.physicsBody.velocity = CGVectorMake(self.parentScene.frame.size.width, 0);
        SKAction* rotation = [SKAction rotateByAngle:-M_PI_4 duration:0.07];
        [attackDagger runAction:[SKAction repeatActionForever:rotation]];
        [attackDagger removeAllChildren];
        [self.parent addChild:attackDagger];
        self.ammo--;
    }
}

- (void) die {
    [self runAction:self.dieAnimation];
    [self removeActionForKey:@"RunningAnimation"];
    self.xScale = 0.95;
    self.yScale = 0.6;
    [self setTexture:[SKTexture textureWithImageNamed:@"ninja_fall_7@2x.png"]];
}

@end
