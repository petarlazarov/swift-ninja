#import "Bottles.h"
#import "ConstantsAndHelpers.h"
#import "PondObstacleNode.h"
#import "EnemyNode.h"
#import "BurningProgressbar.h"
#import "ProgressNode.h"
#import "BottlesConstants.h"
@interface Bottles ()

@property CGPoint viewCordinats;
@property SKSpriteNode* labelDescription;
@property SKSpriteNode* firstBottle;
@property SKSpriteNode* secondBottle;
@property SKSpriteNode* thirdBottle;
@property SKSpriteNode* fourthBottle;
@property SKSpriteNode* fifthBottle;
@property SKSpriteNode* sixthBottle;
@property SKSpriteNode* seventhBottle;
@property SKSpriteNode* eighthBottle;
@property SKSpriteNode* ninethBottle;
@property SKSpriteNode* tenthBottle;
@property SKSpriteNode* eleventhBottle;
@property SKSpriteNode* twelvethBottle;
@property SKSpriteNode* thirdteenthBottle;
@property SKSpriteNode* fourteenthBottle;
@property SKSpriteNode* fifteenthBottle;
@property SKSpriteNode* sixteenthBottle;

@end

@implementation Bottles

NSInteger didWinIndex = kStartIndex;

-(void)didMoveToView:(SKView *)view{
    [self createSceneContents];
    [super didMoveToView:view];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    //    CGPoint location = [touch locationInNode:self];
    NSArray *nodes = [self nodesAtPoint:[touch locationInNode:self]];
    for (SKNode *node in nodes) {
        //go through nodes, get the zPosition if you want
        //        int nodePos = node.zPosition;
        
        if ([node.name isEqualToString:@"blue"])  {
            [node removeFromParent];
            NSLog(@"blue");
           didWinIndex++;
            NSLog(@"%ld", (long)didWinIndex);
            [self didWin];
        }
        if ([node.name isEqualToString:@"red"]) {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"You Lost :("
                                                            message:@""
                                                           delegate:self
                                                  cancelButtonTitle:@"Next game"
                                                  otherButtonTitles:nil, nil];
            [alert show];
        }
    }
}
-(void) didWin {
    if (didWinIndex == kIndexChecker) {
        didWinIndex = kStartIndex;
        [self endGame];
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

-(void)update:(CFTimeInterval)currentTime {
    [super update:currentTime];
}

-(void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex{
    [[NSNotificationCenter defaultCenter]
     postNotificationName:@"DemandNewScene"
     object:self];

}

-(void)createSceneContents {
    self.backgroundColor = [UIColor whiteColor];
    
    self.labelDescription = [SKSpriteNode spriteNodeWithImageNamed:@"bottlesLabel.png"];
    [self addChild:self.labelDescription];
    self.labelDescription.position = CGPointMake(400, 600);
    self.labelDescription.xScale = kIndexScaleNodes;
    self.labelDescription.yScale = kIndexScaleNodes;
    
    self.firstBottle = [SKSpriteNode spriteNodeWithImageNamed:@"blueBottle.png"];
    [self addChild:self.firstBottle];
    self.firstBottle.position = CGPointMake(150, kWidth);
    self.firstBottle.name = @"blue";
    self.secondBottle = [SKSpriteNode spriteNodeWithImageNamed:@"blueBottle.png"];
    [self addChild:self.secondBottle];
    self.secondBottle.position = CGPointMake(200, kWidth);
    self.secondBottle.name = @"blue";
    self.thirdBottle = [SKSpriteNode spriteNodeWithImageNamed:@"blueBottle.png"];
    [self addChild:self.thirdBottle];
    self.thirdBottle.position = CGPointMake(250, kWidth);
    self.thirdBottle.name = @"blue";
    self.fourthBottle = [SKSpriteNode spriteNodeWithImageNamed:@"redBottle.png"];
    [self addChild:self.fourthBottle];
    self.fourthBottle.position = CGPointMake(300, kWidth);
    self.fourthBottle.name = @"red";
    self.fifthBottle = [SKSpriteNode spriteNodeWithImageNamed:@"redBottle.png"];
    [self addChild:self.fifthBottle];
    self.fifthBottle.position = CGPointMake(kWidth, kWidth);
    self.fifthBottle.name = @"red";
    self.sixthBottle = [SKSpriteNode spriteNodeWithImageNamed:@"redBottle.png"];
    [self addChild:self.sixthBottle];
    self.sixthBottle.position = CGPointMake(400, kWidth);
    self.sixthBottle.name = @"red";
    self.seventhBottle = [SKSpriteNode spriteNodeWithImageNamed:@"redBottle.png"];
    [self addChild:self.seventhBottle];
    self.seventhBottle.position = CGPointMake(450, kWidth);
    self.seventhBottle.name = @"red";
    self.eighthBottle = [SKSpriteNode spriteNodeWithImageNamed:@"blueBottle.png"];
    [self addChild:self.eighthBottle];
    self.eighthBottle.position = CGPointMake(500, kWidth);
    self.eighthBottle.name = @"blue";
    self.ninethBottle = [SKSpriteNode spriteNodeWithImageNamed:@"redBottle.png"];
    [self addChild:self.ninethBottle];
    self.ninethBottle.position = CGPointMake(550, kWidth);
    self.ninethBottle.name = @"red";
    self.tenthBottle = [SKSpriteNode spriteNodeWithImageNamed:@"redBottle.png"];
    [self addChild:self.tenthBottle];
    self.tenthBottle.position = CGPointMake(600, kWidth);
    self.tenthBottle.name = @"red";
    self.eleventhBottle = [SKSpriteNode spriteNodeWithImageNamed:@"blueBottle.png"];
    [self addChild:self.eleventhBottle];
    self.eleventhBottle.position = CGPointMake(650, kWidth);
    self.eleventhBottle.name = @"blue";
    self.twelvethBottle = [SKSpriteNode spriteNodeWithImageNamed:@"blueBottle.png"];
    [self addChild:self.twelvethBottle];
    self.twelvethBottle.position = CGPointMake(700, kWidth);
    self.twelvethBottle.name = @"blue";
    self.thirdteenthBottle = [SKSpriteNode spriteNodeWithImageNamed:@"blueBottle.png"];
    [self addChild:self.thirdteenthBottle];
    self.thirdteenthBottle.position = CGPointMake(750, kWidth);
    self.thirdteenthBottle.name = @"blue";
    self.fourteenthBottle = [SKSpriteNode spriteNodeWithImageNamed:@"blueBottle.png"];
    [self addChild:self.fourteenthBottle];
    self.fourteenthBottle.position = CGPointMake(800, kWidth);
    self.fourteenthBottle.name = @"blue";
    self.fifteenthBottle = [SKSpriteNode spriteNodeWithImageNamed:@"blueBottle.png"];
    [self addChild:self.fifteenthBottle];
    self.fifteenthBottle.position = CGPointMake(850, kWidth);
    self.fifteenthBottle.name = @"blue";
    self.sixteenthBottle = [SKSpriteNode spriteNodeWithImageNamed:@"redBottle.png"];
    [self addChild:self.sixteenthBottle];
    self.sixteenthBottle.position = CGPointMake(900, kWidth);
    self.sixteenthBottle.name = @"red";
}

@end
