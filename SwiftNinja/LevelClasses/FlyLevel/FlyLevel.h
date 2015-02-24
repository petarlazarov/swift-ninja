//
//  FlyLevel.h
//  GameClient
//
//  Created by User-01 on 11/26/14.
//  Copyright (c) 2014 TrainingCamp. All rights reserved.
//

#import "AbstractLevel.h"

@interface FlyLevel :AbstractLevel

-(SKSpriteNode*) createNewFly;
- (void)createSceneContents;

@end
