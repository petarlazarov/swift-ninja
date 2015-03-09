

#import "AbstractLevel.h"
#import "CommonLevelConstants.h"
#import "PlayModeViewController.h"


@interface AbstractLevel ()

@property NSInteger lives;
@property(readwrite) NSTimeInterval totalTime;
@property NSTimeInterval timeSinceLastUpdate;
@property NSTimeInterval timeOfLastUpdate;
@property (readwrite) NSTimeInterval elapsedTime;
@property UIImageView *animationImageView;


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
    SKSpriteNode* endNodeBack = [[SKSpriteNode alloc] initWithImageNamed:@"grey.jpg"];
    endNodeBack.position = CGPointMake(self.size.width*0.5, -self.size.height*0.1);
    endNodeBack.xScale = self.size.width*0.0009;
    endNodeBack.yScale = self.size.height*0.0009;
    endNodeBack.name = @"EndingNodeBackground";
    SKAction* action = [SKAction moveTo:CGPointMake(self.size.width*0.5, self.size.height*0.5) duration:1];
    action.timingMode = SKActionTimingEaseOut;
    [endNodeBack runAction:action];
    [self addChild:endNodeBack];
    
    NSArray *imageNames = @[@"transparent.gif", @"transparent.gif", @"transparent.gif", @"transparent.gif",
                            @"transparent.gif", @"transparent.gif", @"transparent.gif", @"transparent.gif",
                            @"148.tiff", @"149.tiff", @"150.tiff", @"151.tiff",
                            @"152.tiff", @"153.tiff", @"154.tiff", @"155.tiff",
                            @"156.tiff", @"157.tiff", @"158.tiff", @"159.tiff",
                            @"160.tiff", @"161.tiff", @"162.tiff"];
    NSMutableArray *images = [[NSMutableArray alloc] init];
    for (int i = 0; i < imageNames.count; i++) {
        [images addObject:[UIImage imageNamed:[imageNames objectAtIndex:i]]];
    }
    self.animationImageView = [[UIImageView alloc] initWithFrame:CGRectMake(self.view.frame.size.width*0.26, -self.view.frame.size.height*0.14, self.view.frame.size.width*0.55, self.view.frame.size.height*0.89)];
    self.animationImageView.animationImages = images;
    self.animationImageView.animationDuration = 2.5;
    [self.view addSubview:self.animationImageView];
    [self.animationImageView startAnimating];

    //Home Button
    SKSpriteNode* homeButton = [[SKSpriteNode alloc] initWithImageNamed:@"home.png"];
    homeButton.position = CGPointMake(-self.size.width*0.45, -self.size.height*0.7);
    homeButton.xScale = self.size.width*0.0013;
    homeButton.yScale = self.size.height*0.0026;
    homeButton.name = @"HomeButton";
    [endNodeBack addChild:homeButton];
    //Again Button
    SKSpriteNode* againButton = [[SKSpriteNode alloc] initWithImageNamed:@"again.png"];
    againButton.position = CGPointMake(self.size.width*0.45, -self.size.height*0.7);
    againButton.xScale = self.size.width*0.00020;
    againButton.yScale = self.size.height*0.00046;
    againButton.name = @"AgainButton";
    [endNodeBack addChild:againButton];
    
}
-(void)winLevel{
    [self.animationImageView removeFromSuperview];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    NSArray *nodes = [self nodesAtPoint:[touch locationInNode:self]];
    for (SKNode *node in nodes) {
        //go through nodes, get the zPosition if you want
        //        int nodePos = node.zPosition;
        
        if ([node.name isEqualToString:@"HomeButton"])  {
            NSLog(@"Ne go otrazqva");
            [[NSNotificationCenter defaultCenter]
             postNotificationName:@"EndGame"
             object:self];
            [self.animationImageView removeFromSuperview];
        }
        if ([node.name isEqualToString:@"AgainButton"])  {
            NSLog(@"otrazqva");
            currentScore=0;
            [[NSNotificationCenter defaultCenter]
             postNotificationName:@"Again"
             object:self];
            [self.animationImageView removeFromSuperview];
            
        }
    
    }
    
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


