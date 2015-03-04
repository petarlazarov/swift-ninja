#import "TypeNinja.h"
#import "ConstantsAndHelpers.h"
#import "PondObstacleNode.h"
#import "EnemyNode.h"
#import "BurningProgressbar.h"
#import "ProgressNode.h"
#import "TypeNinjaConstants.h"

@interface TypeNinja ()
@property SKSpriteNode* firstLetter;
@property SKSpriteNode* secondLetter;
@property SKSpriteNode* thirdLetter;
@property SKSpriteNode* fourthLetter;
@property SKSpriteNode* fifthLetter;
@property SKLabelNode* labelDescr;

@end

@implementation TypeNinja

BOOL hasGameEnded;

NSInteger step = 0;
-(void)didMoveToView:(SKView *)view{
    [self createSceneContents];
    [super didMoveToView:view];
}

-(void)createSceneContents {
    NSLog(@"%f",self.size.width);
    hasGameEnded = NO;
    
    SKLabelNode *labelDescr = [SKLabelNode labelNodeWithFontNamed:@"Arial"];
    labelDescr.position = CGPointMake(self.size.width* 0.5, self.size.height* 0.75);
    labelDescr.fontSize = self.size.width* 0.03;
    labelDescr.fontColor = [UIColor whiteColor];
    labelDescr.text = [NSString stringWithFormat:@"Type - N I N J A -"];
    labelDescr.name = @"descriptionLabel";
    [self addChild:labelDescr];
    
    
    self.firstLetter = [SKSpriteNode spriteNodeWithImageNamed:@"letterJ.png"];
    [self addChild:self.firstLetter];
    self.firstLetter.name = @"fourth";
    self.firstLetter.position = CGPointMake(self.size.width* 0.2, self.size.height* 0.5);
    self.firstLetter.xScale = (self.size.width* 0.0003);
    self.firstLetter.yScale = (self.size.width* 0.0003);
    self.secondLetter = [SKSpriteNode spriteNodeWithImageNamed:@"letterN.png"];
    [self addChild:self.secondLetter];
    self.secondLetter.name = @"first";
    self.secondLetter.position = CGPointMake(self.size.width* 0.35, self.size.height* 0.5);
    self.secondLetter.xScale = (self.size.width* 0.0003);
    self.secondLetter.yScale = (self.size.width* 0.0003);
    self.thirdLetter = [SKSpriteNode spriteNodeWithImageNamed:@"letterA.png"];
    [self addChild:self.thirdLetter];
    self.thirdLetter.name = @"fifth";
    self.thirdLetter.position = CGPointMake(self.size.width* 0.5, self.size.height* 0.5);
    self.thirdLetter.xScale = (self.size.width* 0.0003);
    self.thirdLetter.yScale = (self.size.width* 0.0003);
    self.fourthLetter = [SKSpriteNode spriteNodeWithImageNamed:@"letterN.png"];
    [self addChild:self.fourthLetter];
    self.fourthLetter.name = @"third";
    self.fourthLetter.position = CGPointMake(self.size.width* 0.65, self.size.height* 0.5);
    self.fourthLetter.xScale = (self.size.width* 0.0003);
    self.fourthLetter.yScale = (self.size.width* 0.0003);
    self.fifthLetter = [SKSpriteNode spriteNodeWithImageNamed:@"letterI.png"];
    [self addChild:self.fifthLetter];
    self.fifthLetter.name = @"second";
    self.fifthLetter.position = CGPointMake(self.size.width* 0.8, self.size.height* 0.5);
    self.fifthLetter.xScale = (self.size.width* 0.0003);
    self.fifthLetter.yScale = (self.size.width* 0.0003);
    
    
    
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [super touchesBegan:touches withEvent:event];

    UITouch *touch = [touches anyObject];
    //    CGPoint location = [touch locationInNode:self];
    NSArray *nodes = [self nodesAtPoint:[touch locationInNode:self]];
    for (SKNode *node in nodes) {
        //go through nodes, get the zPosition if you want
        //        int nodePos = node.zPosition;
        
        if ([node.name isEqualToString:@"first"])  {
            if (step == kStartStep || step == kThirdStep) {
                [node removeFromParent];
                NSLog(@"blue");
                step++;
                NSLog(@"%ld",(long)step);
                
            }
        }
        if ([node.name isEqualToString:@"second"])  {
            if (step == kFirstStep) {
                [node removeFromParent];
                NSLog(@"blue");
                step++;
            }
        }
        if ([node.name isEqualToString:@"third"])  {
            if (step == kSecondStep) {
                [node removeFromParent];
                NSLog(@"blue");
                step++;
            }
        }
        if ([node.name isEqualToString:@"fourth"])  {
            if (step == kThirdStep || step == kStartStep) {
                [node removeFromParent];
                NSLog(@"blue");
                step++;
            }
        }
        if ([node.name isEqualToString:@"fifth"])  {
            if (step == kFourthStep) {
                [node removeFromParent];
                NSLog(@"blue");
                step=kStartStep;
                CGFloat points =(self.totalTime- self.elapsedTime)* kIndexPoints;
                [self setCurrentScore:points];
                [self endGame];
                
            }
        }
    }
}

- (void) endGame {
    hasGameEnded = YES;
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Very Good!"
                                                    message:@""
                                                   delegate:self
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
}

-(void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex{
    
    [[NSNotificationCenter defaultCenter]
     postNotificationName:@"DemandNewScene"
     object:self];
    
}

-(void)update:(CFTimeInterval)currentTime {
    if (hasGameEnded) {
        self.pointsLabel.text = [NSString stringWithFormat:@"Score: %.0f", [self getCurrentScore] ];
        return;
    }
    
    [super update:currentTime];
}

@end
