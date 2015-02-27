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
    self.labelDescription.position = CGPointMake(self.size.width* 0.5, self.size.height* 0.75);
    self.labelDescription.xScale = self.size.width* 0.00075;
    self.labelDescription.yScale = self.size.width* 0.00075;
    
    self.firstBottle = [SKSpriteNode spriteNodeWithImageNamed:@"blueBottle.png"];
    [self addChild:self.firstBottle];
    self.firstBottle.position = CGPointMake(self.size.width* 0.05, self.size.height* 0.35);
    self.firstBottle.name = @"blue";
    self.firstBottle.xScale = self.size.width* 0.001;
    self.firstBottle.yScale = self.size.width* 0.001;
    self.secondBottle = [SKSpriteNode spriteNodeWithImageNamed:@"blueBottle.png"];
    [self addChild:self.secondBottle];
    self.secondBottle.position = CGPointMake(self.size.width* 0.11, self.size.height* 0.35);
    self.secondBottle.name = @"blue";
    self.secondBottle.xScale = self.size.width* 0.001;
    self.secondBottle.yScale = self.size.width* 0.001;
    self.thirdBottle = [SKSpriteNode spriteNodeWithImageNamed:@"blueBottle.png"];
    [self addChild:self.thirdBottle];
    self.thirdBottle.position = CGPointMake(self.size.width* 0.17, self.size.height* 0.35);
    self.thirdBottle.name = @"blue";
    self.thirdBottle.xScale = self.size.width* 0.001;
    self.thirdBottle.yScale = self.size.width* 0.001;
    self.fourthBottle = [SKSpriteNode spriteNodeWithImageNamed:@"redBottle.png"];
    [self addChild:self.fourthBottle];
    self.fourthBottle.position = CGPointMake(self.size.width* 0.23, self.size.height* 0.35);
    self.fourthBottle.name = @"red";
    self.fourthBottle.xScale = self.size.width* 0.001;
    self.fourthBottle.yScale = self.size.width* 0.001;
    self.fifthBottle = [SKSpriteNode spriteNodeWithImageNamed:@"redBottle.png"];
    [self addChild:self.fifthBottle];
    self.fifthBottle.position = CGPointMake(self.size.width* 0.29, self.size.height* 0.35);
    self.fifthBottle.name = @"red";
    self.fifthBottle.xScale = self.size.width* 0.001;
    self.fifthBottle.yScale = self.size.width* 0.001;
    self.sixthBottle = [SKSpriteNode spriteNodeWithImageNamed:@"redBottle.png"];
    [self addChild:self.sixthBottle];
    self.sixthBottle.position = CGPointMake(self.size.width* 0.35, self.size.height* 0.35);
    self.sixthBottle.name = @"red";
    self.sixthBottle.xScale = self.size.width* 0.001;
    self.sixthBottle.yScale = self.size.width* 0.001;
    self.seventhBottle = [SKSpriteNode spriteNodeWithImageNamed:@"redBottle.png"];
    [self addChild:self.seventhBottle];
    self.seventhBottle.position = CGPointMake(self.size.width* 0.41, self.size.height* 0.35);
    self.seventhBottle.name = @"red";
    self.seventhBottle.xScale = self.size.width* 0.001;
    self.seventhBottle.yScale = self.size.width* 0.001;
    self.eighthBottle = [SKSpriteNode spriteNodeWithImageNamed:@"blueBottle.png"];
    [self addChild:self.eighthBottle];
    self.eighthBottle.position = CGPointMake(self.size.width* 0.47, self.size.height* 0.35);
    self.eighthBottle.name = @"blue";
    self.eighthBottle.xScale = self.size.width* 0.001;
    self.eighthBottle.yScale = self.size.width* 0.001;
    self.ninethBottle = [SKSpriteNode spriteNodeWithImageNamed:@"redBottle.png"];
    [self addChild:self.ninethBottle];
    self.ninethBottle.position = CGPointMake(self.size.width* 0.53, self.size.height* 0.35);
    self.ninethBottle.name = @"red";
    self.ninethBottle.xScale = self.size.width* 0.001;
    self.ninethBottle.yScale = self.size.width* 0.001;
    self.tenthBottle = [SKSpriteNode spriteNodeWithImageNamed:@"redBottle.png"];
    [self addChild:self.tenthBottle];
    self.tenthBottle.position = CGPointMake(self.size.width* 0.59, self.size.height* 0.35);
    self.tenthBottle.name = @"red";
    self.tenthBottle.xScale = self.size.width* 0.001;
    self.tenthBottle.yScale = self.size.width* 0.001;
    self.eleventhBottle = [SKSpriteNode spriteNodeWithImageNamed:@"blueBottle.png"];
    [self addChild:self.eleventhBottle];
    self.eleventhBottle.position = CGPointMake(self.size.width* 0.65, self.size.height* 0.35);
    self.eleventhBottle.name = @"blue";
    self.eleventhBottle.xScale = self.size.width* 0.001;
    self.eleventhBottle.yScale = self.size.width* 0.001;
    self.twelvethBottle = [SKSpriteNode spriteNodeWithImageNamed:@"blueBottle.png"];
    [self addChild:self.twelvethBottle];
    self.twelvethBottle.position = CGPointMake(self.size.width* 0.71, self.size.height* 0.35);
    self.twelvethBottle.name = @"blue";
    self.twelvethBottle.xScale = self.size.width* 0.001;
    self.twelvethBottle.yScale = self.size.width* 0.001;
    self.thirdteenthBottle = [SKSpriteNode spriteNodeWithImageNamed:@"blueBottle.png"];
    [self addChild:self.thirdteenthBottle];
    self.thirdteenthBottle.position = CGPointMake(self.size.width* 0.77, self.size.height* 0.35);
    self.thirdteenthBottle.name = @"blue";
    self.thirdteenthBottle.xScale = self.size.width* 0.001;
    self.thirdteenthBottle.yScale = self.size.width* 0.001;
    self.fourteenthBottle = [SKSpriteNode spriteNodeWithImageNamed:@"blueBottle.png"];
    [self addChild:self.fourteenthBottle];
    self.fourteenthBottle.position = CGPointMake(self.size.width* 0.83, self.size.height* 0.35);
    self.fourteenthBottle.name = @"blue";
    self.fourteenthBottle.xScale = self.size.width* 0.001;
    self.fourteenthBottle.yScale = self.size.width* 0.001;
    self.fifteenthBottle = [SKSpriteNode spriteNodeWithImageNamed:@"blueBottle.png"];
    [self addChild:self.fifteenthBottle];
    self.fifteenthBottle.position = CGPointMake(self.size.width* 0.89, self.size.height* 0.35);
    self.fifteenthBottle.name = @"blue";
    self.fifteenthBottle.xScale = self.size.width* 0.001;
    self.fifteenthBottle.yScale = self.size.width* 0.001;
    self.sixteenthBottle = [SKSpriteNode spriteNodeWithImageNamed:@"redBottle.png"];
    [self addChild:self.sixteenthBottle];
    self.sixteenthBottle.position = CGPointMake(self.size.width* 0.95, self.size.height* 0.35);
    self.sixteenthBottle.name = @"red";
    self.sixteenthBottle.xScale = self.size.width* 0.001;
    self.sixteenthBottle.yScale = self.size.width* 0.001;
}

@end
