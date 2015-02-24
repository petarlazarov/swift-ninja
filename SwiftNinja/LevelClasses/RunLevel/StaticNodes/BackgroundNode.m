//
//  BackgroundNode.m
//  RunLevel
//
//  Created by User-03 on 12/6/14.
//  Copyright (c) 2014 TrainingCamp. All rights reserved.
//

#import "BackgroundNode.h"
#import "ConstantsAndHelpers.h"
#import "ConstantsBalanceAndMemory.h"

@interface BackgroundNode ()

@property SKSpriteNode* background;

@end

@implementation BackgroundNode


- (instancetype)initWithScene: (SKScene*) parentScene andImageName: (NSString*) imageName andVelocity: (CGFloat) velocity
{
    self = [super init];
    if (self) {
        //self.position = CGPointMake(CGRectGetMidX(self.frame),CGRectGetMidY(self.frame));
        self.position = CGPointMake(0,0);
        self.velocity = velocity;
        self.name = @"background";        
        [self adjustImageForScene:parentScene withImageName:imageName];
    }
    return self;
}



- (void) adjustImageForScene: (SKScene*) scene withImageName: (NSString*) imageName {
    for (int i = 0; i < 2; i++) {
        SKSpriteNode* background = [SKSpriteNode spriteNodeWithImageNamed:[NSString stringWithFormat:@"%@%d.jpg",imageName, i]];
        background.size = CGSizeMake(background.size.width, scene.view.bounds.size.height);
        background.position = CGPointMake(i * background.size.width,CGRectGetMidY(self.frame));
        background.anchorPoint = CGPointMake(0,0);
        background.name = @"DefaultBackground";
        
        [self addChild:background];
    }
}


- (void) move{
    [self enumerateChildNodesWithName:@"DefaultBackground" usingBlock: ^(SKNode *node, BOOL *stop) {
        SKSpriteNode* backgoundNode = (SKSpriteNode*) node;
        backgoundNode.position = CGPointMake(backgoundNode.position.x- self.velocity, backgoundNode.position.y);
        
        if (backgoundNode.position.x <= -backgoundNode.size.width) {
        backgoundNode.position = CGPointMake(backgoundNode.position.x + backgoundNode.size.width * 2, backgoundNode.position.y);
        }
    }];
}

@end
