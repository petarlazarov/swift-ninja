#import "FlyLevel.h"
#import "BurningProgressbar.h"
#import "ProgressNode.h"
#import "CommonLevelConstants.h"

@interface FlyLevel ()

@property (nonatomic, strong) NSArray *progressViews;
@property (nonatomic) CGFloat progress;
@property BOOL didWin;

@end


@implementation FlyLevel

//durations in seconds
const CGFloat kRandomPathDuration =1;
const CGFloat kPointsCoefficient=25;
const NSString* kBackgroundImage=@"nebula.jpg";
const NSString* kNinjaDartImage = @"lithium_atom.png";

CGFloat levelDuration = kFlyLevelTime;

- (void)didMoveToView:(SKView *)view
{
    [self createSceneContents];
    
    [super didMoveToView:view];
}

- (void)createSceneContents
{
    
    SKSpriteNode* background = [SKSpriteNode spriteNodeWithImageNamed:kBackgroundImage];
    background.size = CGSizeMake(self.scene.view.bounds.size.width, self.scene.view.bounds.size.height);
    background.position = CGPointMake(0,0);
    background.anchorPoint = CGPointMake(0,0);
    [self addChild:background];

    SKSpriteNode *spaceship = [self createNewFly];
    spaceship.name=@"circle1";
    SKSpriteNode *spaceship2 = [self createNewFly];
    spaceship2.name=@"circle2";
    [self addChild:spaceship];
    [self addChild:spaceship2];
    
    
}



-(SKSpriteNode*) createNewFly{
   
    
    SKSpriteNode* hull = [[SKSpriteNode alloc]initWithImageNamed:kNinjaDartImage];
    hull.size = CGSizeMake(64, 64);
    
    //number of times a short path flight has to be made, to achieve the level duration time
    __block NSInteger cyclesOfRandomPaths = (levelDuration-2)/kRandomPathDuration+1;
    NSLog(@"%ld",(long) cyclesOfRandomPaths);
    
    
    __block CGPoint startingPoint = [self getRandomPoint];
    __block CGPoint endingPoint = [self getRandomPoint];
    __block SKAction* randomPath = [self randomPathWithStartingPoint:startingPoint andEndingPoint:endingPoint];
    __block SKAction *hover = [SKAction sequence:@[
                                               randomPath,
                                               
                                               ]];
    
    //To avoid retain cycles in recursive blocks, using one weak block and one strong. If using just weak, it will be released after iterating. Calling the weak block in the recursive relation and the strong when using later in method.
    __block void (^weakRepeatHover)();
    void (^repeatHover)();
    
    //recursive block to randomly generate short paths for enough time - according to the level duration (self.totalTime)
    weakRepeatHover = repeatHover = ^{
            if (cyclesOfRandomPaths>0) {
                startingPoint = endingPoint;
                endingPoint = [self getRandomPoint];
                randomPath = [self randomPathWithStartingPoint:startingPoint andEndingPoint:endingPoint];
                SKAction* fadeAlpha = [SKAction fadeAlphaTo:0.5 duration:1];
                SKAction* returnAlpha = [SKAction fadeAlphaTo:1 duration:1];
                SKAction* rotation = [SKAction rotateByAngle:-M_PI duration:0.07];
                SKAction* sequence = [SKAction sequence:@[fadeAlpha,returnAlpha,rotation]];
                [hull runAction:[SKAction repeatActionForever:sequence]];
                
                hover = [SKAction sequence:@[
                                         randomPath,
                                         
                                         ]];
                cyclesOfRandomPaths--;
                NSLog(@"%ld", (long) cyclesOfRandomPaths);
                [hull runAction:hover completion:weakRepeatHover];
            }
        };
        
    [hull runAction: hover completion:repeatHover];
    

    return hull;
    
}

       


- (CGPoint) getRandomPoint {
    
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth = screenRect.size.width;
    CGFloat screenHeight = screenRect.size.height;
    
    CGFloat xRandom = [self getRandomNumberBetween:0 to:self.scene.view.bounds.size.width];
    CGFloat yRandom = [self getRandomNumberBetween:0 to:self.scene.view.bounds.size.height];
    
    CGPoint randomPoint = CGPointMake(xRandom, yRandom);
    
    return randomPoint;
}



-(SKAction*) randomPathWithStartingPoint: (CGPoint) startingPoint andEndingPoint: (CGPoint) endingPoint{
    
    
    CGMutablePathRef cgpath = CGPathCreateMutable();
    
    CGPoint cp1 = [self getRandomPoint];
    CGPoint cp2 = [self getRandomPoint];
    
    CGPathMoveToPoint(cgpath,NULL, startingPoint.x, startingPoint.y);
    CGPathAddCurveToPoint(cgpath, NULL, cp1.x, cp1.y, cp2.x, cp2.y , endingPoint.x, endingPoint.y);
    
    SKAction *animateCircle = [SKAction followPath:cgpath asOffset:NO orientToPath:NO duration:kRandomPathDuration];
    
    return animateCircle;
}

-(NSInteger)getRandomNumberBetween:(NSInteger)from to:(NSInteger)to {
    
    return (NSInteger)from + arc4random() % (to-from+1);
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [super touchesBegan:touches withEvent:event];
    UITouch *touch = [touches anyObject];

    NSArray *nodes = [self nodesAtPoint:[touch locationInNode:self]];
    for (SKNode *node in nodes) {
        
        if ([node.name isEqualToString:@"circle1"]) {
            CGFloat points=(self.totalTime - self.elapsedTime)*kPointsCoefficient;
            [self setCurrentScore:points];
           //[self endGame];
            self.didWin=YES;
        }
        
        if ([node.name isEqualToString:@"circle2"]) {
            CGFloat points=(self.totalTime - self.elapsedTime)*kPointsCoefficient;
            [self setCurrentScore:points];
           // [self endGame];
            self.didWin=YES;
        }
    }
}



- (void) endGame {
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Very Good!"
                                                    message:@""
                                                   delegate:self
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
    }

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    // the user clicked OK
    
        [[NSNotificationCenter defaultCenter]
         postNotificationName:@"DemandNewScene"
         object:self];
    
}


-(void)update:(CFTimeInterval)currentTime {
    if (self.didWin) return;
        
    [super update:currentTime];
    /* Called before each frame is rendered */
}


@end
