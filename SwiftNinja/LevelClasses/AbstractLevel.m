

#import "AbstractLevel.h"
#import "CommonLevelConstants.h"
#import "PlayModeViewController.h"


@interface AbstractLevel ()

@property NSInteger lives;
@property(readwrite) NSTimeInterval totalTime;
@property NSTimeInterval timeSinceLastUpdate;
@property NSTimeInterval timeOfLastUpdate;
@property (readwrite) NSTimeInterval elapsedTime;


@end

static const CGFloat kDefaultTime = 10;
static CGFloat currentScore;

@implementation AbstractLevel


- (instancetype)initWithSize:(CGSize)size andTotalTime: (NSTimeInterval) totalTime
{
    self = [super initWithSize:size];
    if (self) {
        self.elapsedTime = 0;
        self.totalTime = totalTime;
        self.hasLevelEnded = NO;
        PlayModeViewController* vc =[[PlayModeViewController alloc] init];
       // self.currentScore=vc.currentScore;
    }
    return self;
}

-(CGFloat)getCurrentScore{
    return currentScore;
}

-(void)setCurrentScore:(CGFloat)levelScore{
    currentScore+=levelScore;
}

//Use this method if like the level to be the default 10 sec
-(CGFloat) getTimeForLevel {
    return kDefaultTime;
}

-(NSInteger)getRemainingLives{
    return self.lives;
}

//Calculating the points.Default is 0
-(void) calculatePoints{
   // self.points=0;
}

-(BOOL)levelDidEnd:(SKView *)skView andWithNewScene:(SKScene *)newScene andWithTransition:(SKTransition *)transition{
    if(newScene && transition){
        [skView presentScene:newScene transition:transition];
        return YES;
    }
    return NO;
}

- (void) removeSceneAndChildren {
    [self removeAllActions];
    [self removeAllChildren];
    [self.view removeFromSuperview];
    [self removeFromParent];
    [self.parent removeFromParent];
}

// called when time's up
- (void) endLevel {
//    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Time's up!"
//                                                    message:@""
//                                                   delegate:self
//                                          cancelButtonTitle:@"End game"
//                                          otherButtonTitles:@"Next level", nil];
//    [alert show];

    //TESTING THE ENDINGLEVEL NODE
    
    SKSpriteNode* endingNode = [[SKSpriteNode alloc]init];
    endingNode.size=CGSizeMake(self.frame.size.width, self.frame.size.height);
    endingNode.position = CGPointMake(self.frame.size.width*0.5, -self.frame.size.height/2);
    endingNode.color = [UIColor grayColor];
    endingNode.alpha=0.4;
    endingNode.name = @"end";
    
    SKAction* action = [SKAction moveTo:CGPointMake(self.frame.size.width*0.5, self.frame.size.height*0) duration:1];
    action.timingMode = SKActionTimingEaseOut;
    [endingNode runAction:action];
    
    [self addChild:endingNode];
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    NSArray *nodes = [self nodesAtPoint:[touch locationInNode:self]];
    for (SKNode *node in nodes) {
        //go through nodes, get the zPosition if you want
        //        int nodePos = node.zPosition;
        
        if ([node.name isEqualToString:@"end"])  {
            NSLog(@"Ne go otrazqva");
            [[NSNotificationCenter defaultCenter]
             postNotificationName:@"DemandNewScene"
             object:self];
        }}
    
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    // the user clicked End game
    if (buttonIndex == 0) {
        [[NSNotificationCenter defaultCenter]
         postNotificationName:@"EndGame"
         object:self];
        [self removeSceneAndChildren];
    }
    if (buttonIndex == 1) {
        NSLog(@"Demand");
        [[NSNotificationCenter defaultCenter]
         postNotificationName:@"DemandNewScene"
         object:self];
    }
}


#pragma mark : SKView methods

-(void)didMoveToView:(SKView *)view {
    [super didMoveToView:view];
    self.progressBarNode = [BurningProgressbar burningProgressbarWithScene:self andTotalTime:self.totalTime];
    [self addChild:self.progressBarNode];
    self.pointsLabel = [self getLabelWithPoints];
    [self addChild:self.pointsLabel];
    
}



-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
    [self.progressBarNode update:currentTime];
    
    self.pointsLabel.text = [NSString stringWithFormat:@"Score: %.0f", [self getCurrentScore] ];
    
    if (self.hasLevelEnded) {
        return;
    }
    
    if (self.elapsedTime>= self.totalTime) {
        [self endLevel];
        self.hasLevelEnded = YES;
        return;
    }

    if (_timeOfLastUpdate) {
        self.timeSinceLastUpdate = currentTime -self.timeOfLastUpdate;
        self.elapsedTime += self.timeSinceLastUpdate;
    }
    
    self.timeOfLastUpdate = currentTime;
        
    
}

//This method will give each level a SpriteNodeLabel for the score
-(SKLabelNode*) getLabelWithPoints {
    SKLabelNode *points = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
    points.fontSize = 38;
    points.fontColor = [SKColor redColor];
    points.text = @"0";
    points.position = CGPointMake(self.scene.view.bounds.size.width*kScoreLabelScreenPositioningFactorWidth, self.scene.view.bounds.size.height*kScoreLabelScreenPositioningFactorHeight);
    
    return points;
    
}


@end


