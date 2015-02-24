
#import "PopingCirclesLevel.h"
#import "BurningProgressbar.h"
#import "ProgressNode.h"
#import "AbstractLevelFactory.h"

@interface PopingCirclesLevel ()

@property SKAction* action;
@property NSTimeInterval timeSinceLastPop;
@property NSTimeInterval localTimeSinceLastUpdate;
@property NSTimeInterval localTimeOfLastUpdate;
@property NSUInteger numberOfPoppedBubbles;
@property  SKLabelNode* pointsLabel;

@end

@implementation PopingCirclesLevel

//Constants
const CGFloat kCalculatePointsCoefficient=1;
const CGFloat kMoveByXAnimation=20;
const CGFloat kMoveByYAnimation=20;
const CGFloat kMoveAnimationDuration=0.4;
const NSString* kBackgroundName = @"underWater.jpg";
const NSString* kBubbleImageName = @"bubble_001.png";
BurningProgressbar* progressBar;
static const CGFloat kTimeIntervalForPoppingNewCircle=0.3;


-(void)didMoveToView:(SKView *)view{
    
    [self createSceneContents];
    
    [super didMoveToView:view];
    
    self.timeSinceLastPop = 0;
    
    
    [self popNewCircle];
     self.action = [SKAction fadeAlphaTo:0 duration:2];
   
    
}

- (void)createSceneContents
{
//    BACKGROUND
    SKSpriteNode* background = [SKSpriteNode spriteNodeWithImageNamed:kBackgroundName];
    background.position = CGPointMake(0,0);
    background.size = CGSizeMake(self.scene.view.bounds.size.width, self.scene.view.bounds.size.height);
    background.anchorPoint = CGPointMake(0,0);
    background.name = @"DefaultBackground";
    
    [self addChild:background];

}

-(void) popNewCircle {
    //Creating the bubble
    SKSpriteNode* poppingCircle = [[SKSpriteNode alloc] initWithImageNamed:kBubbleImageName];
    poppingCircle.size = CGSizeMake(32, 32);
    poppingCircle.name= @"bubble";
    poppingCircle.position =[self getRandomPoint];
  
     poppingCircle.alpha=0;
    [self addChild:poppingCircle];
    
    //Animation for appearing (running independently)
    SKAction* appear = [SKAction fadeAlphaTo:1.0 duration:0.6];
    SKAction* zoom = [SKAction scaleXBy:3 y:3 duration:5];

    [poppingCircle runAction:[SKAction group:@[appear , zoom]]];
    
    //The sequence animation for moving upwards
    SKAction* moveRight = [SKAction moveByX:kMoveByXAnimation y:kMoveByYAnimation duration:kMoveAnimationDuration];
    SKAction* moveLeft = [SKAction moveByX:-kMoveByXAnimation y:kMoveByYAnimation duration:kMoveAnimationDuration];
    
    SKAction* sequence = [SKAction sequence:@[moveLeft ,moveRight]];
   [poppingCircle runAction:[SKAction repeatActionForever:sequence]];
   
    
}


- (CGPoint) getRandomPoint {
    
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth = screenRect.size.width;
    CGFloat screenHeight = screenRect.size.height;
    
    CGFloat xRandom = [self getRandomNumberBetween:0 to:screenWidth];
    CGFloat yRandom = [self getRandomNumberBetween:0 to:screenHeight];
    
    CGPoint randomPoint = CGPointMake(xRandom, yRandom);
    
    return randomPoint;
}

-(NSInteger)getRandomNumberBetween:(NSInteger)from to:(NSInteger)to {
    
    return (NSInteger)from + arc4random() % (to-from+1);
}




-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    NSArray *nodes = [self nodesAtPoint:[touch locationInNode:self]];
    for (SKSpriteNode *node in nodes) {
        //go through nodes
        if ([node.name isEqualToString:@"bubble"]) {
            self.numberOfPoppedBubbles++;
            [self calculatePoints];
            [node removeFromParent];
        
        }
        
        
    }
}

-(void)update:(CFTimeInterval)currentTime {
    [super update:currentTime];

    
    if (_localTimeOfLastUpdate) {
        self.localTimeSinceLastUpdate= currentTime -_localTimeOfLastUpdate;
        self.timeSinceLastPop += self.localTimeSinceLastUpdate;
    }
    
    if (self.timeSinceLastPop>=kTimeIntervalForPoppingNewCircle) {
        [self popNewCircle];
        self.timeSinceLastPop = 0;
    }
    
    _localTimeOfLastUpdate = currentTime;
}



-(SKLabelNode *)getLabelWithPoints{
   
    return [super getLabelWithPoints];
}

-(void) calculatePoints{
    self.currentScore+=self.numberOfPoppedBubbles*kCalculatePointsCoefficient;
    }


@end
