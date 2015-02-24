#import "CardsLevel.h"
#import "NinjaNode.h"
#import "GroundNode.h"
#import "DaggerNode.h"
#import "ConstantsAndHelpers.h"
#import "PondObstacleNode.h"
#import "EnemyNode.h"
#import "BurningProgressbar.h"
#import "ProgressNode.h"
#import "CardsConstants.h"
#import "AbstractLevelFactory.h"

@interface CardsLevel ()

@property CGPoint viewCordinats;
@property SKLabelNode* hint;
@property SKSpriteNode* labelCards;
@property SKSpriteNode* firstCard;
@property SKSpriteNode* secondCard;
@property SKSpriteNode* thirdCard;
@property SKSpriteNode* fourthCard;
@property SKSpriteNode* fifthCard;
@property SKSpriteNode* sixthCard;

@end


@implementation CardsLevel

NSInteger counter = 1;
NSInteger numIndex = 0;
NSInteger winIndex = 0;

NSString* hintLabel = @"A - B - B - Q - A - Q";
NSString* typeCard1 = @"back.jpg";
NSString* typeCard2 = @"back.jpg";
NSString* typeCard3 = @"back.jpg";
NSString* typeCard4 = @"back.jpg";
NSString* typeCard5 = @"back.jpg";
NSString* typeCard6 = @"back.jpg";

BurningProgressbar* progressBar;

-(void)didMoveToView:(SKView *)view{
    [self createSceneContents];
    [super didMoveToView:view];
    
}

-(void)createSceneContents {
    [self generateCards];
}


-(void) updateSceneContents {
    [self.firstCard removeFromParent];
    [self.secondCard removeFromParent];
    [self.thirdCard removeFromParent];
    [self.fourthCard removeFromParent];
    [self.fifthCard removeFromParent];
    [self.sixthCard removeFromParent];
    [self.hint removeFromParent];
    [self generateCards];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    //    CGPoint location = [touch locationInNode:self];
    NSArray *nodes = [self nodesAtPoint:[touch locationInNode:self]];
    for (SKNode *node in nodes) {
        //go through nodes, get the zPosition if you want
        //        int nodePos = node.zPosition;
        
        //or check the node against your nodes
        if ([node.name isEqualToString:@"firstCard"])  {
            NSLog(@"HIT 1");
            NSLog(@"%@",self.getLabelWithPoints);
            counter++;
            if (numIndex == kStartIndex && ![typeCard1  isEqualToString: @"Green_tick_1.png"]) {
                numIndex = kIndexCard1;
                typeCard1 = @"ace.jpg";
            }else {
                if (numIndex != kIndexCard1 && numIndex != kIndexCard5) {
                    numIndex = kStartIndex;
                }
            }
            [self updateSceneContents];
            if (numIndex == kIndexCard5) {
                typeCard1 = @"Green_tick_1.png";
                typeCard5 = @"Green_tick_1.png";
                winIndex++;
                [self updateSceneContents];
                numIndex = kStartIndex;
            }
            [self updateProgress];
        }
        if ([node.name isEqualToString:@"secondCard"]) {
            NSLog(@"HIT 2");
            counter++;
            if (numIndex == kStartIndex && ![typeCard2  isEqualToString: @"Green_tick_1.png"]) {
                numIndex = kIndexCard2;
                typeCard2 = @"king.jpg";
                
            }else {
                if (numIndex != kIndexCard2 && numIndex != kIndexCard3) {
                    numIndex = kStartIndex;
                }
            }
            [self updateSceneContents];
            if (numIndex == kIndexCard3) {
                typeCard3 = @"Green_tick_1.png";
                typeCard2 = @"Green_tick_1.png";
                winIndex++;
                [self updateSceneContents];
                numIndex = kStartIndex;
            }
            [self updateProgress];
        }
        if ([node.name isEqualToString:@"thirdCard"])  {
            NSLog(@"HIT 3");
            counter++;
            if (numIndex == kStartIndex && ![typeCard3  isEqualToString: @"Green_tick_1.png"]) {
                numIndex = kIndexCard3;
                typeCard3 = @"king.jpg";
                
            }else {
                if (numIndex != kIndexCard3 && numIndex != kIndexCard2) {
                    numIndex = kStartIndex;
                }
            }
            [self updateSceneContents];
            if (numIndex == kIndexCard2) {
                typeCard3 = @"Green_tick_1.png";
                typeCard2 = @"Green_tick_1.png";
                winIndex++;
                [self updateSceneContents];
                numIndex = kStartIndex;
            }
            [self updateProgress];
        }
        if ([node.name isEqualToString:@"fourthCard"]) {
            NSLog(@"HIT 4");
            counter++;
            if (numIndex == kStartIndex && ![typeCard4  isEqualToString: @"Green_tick_1.png"]) {
                numIndex = kIndexCard4;
                typeCard4 = @"queen.jpg";
                
            }else {
                if (numIndex != kIndexCard4 && numIndex != kIndexCard6) {
                    numIndex = kStartIndex;
                }
            }
            [self updateSceneContents];
            if (numIndex == kIndexCard6) {
                typeCard4 = @"Green_tick_1.png";
                typeCard6 = @"Green_tick_1.png";
                winIndex++;
                [self updateSceneContents];
                numIndex = kStartIndex;
            }
            [self updateProgress];
        }
        if ([node.name isEqualToString:@"fifthCard"])  {
            NSLog(@"HIT 5");
            counter++;
            if (numIndex == kStartIndex && ![typeCard5  isEqualToString: @"Green_tick_1.png"]) {
                numIndex = kIndexCard5;
                typeCard5 = @"ace.jpg";
                
            }else {
                if (numIndex != kIndexCard5 && numIndex != kIndexCard1) {
                    numIndex = kStartIndex;
                }
            }
            [self updateSceneContents];
            if (numIndex == kIndexCard1) {
                typeCard1 = @"Green_tick_1.png";
                typeCard5 = @"Green_tick_1.png";
                winIndex++;
                [self updateSceneContents];
                numIndex = kStartIndex;
            }
            [self updateProgress];
        }
        if ([node.name isEqualToString:@"sixthCard"])  {
            NSLog(@"HIT 6");
            counter++;
            if (numIndex == kStartIndex && ![typeCard6  isEqualToString: @"Green_tick_1.png"]) {
                numIndex = kIndexCard6;
                typeCard6 = @"queen.jpg";
                
            }else {
                if (numIndex != kIndexCard6 && numIndex != kIndexCard4) {
                    numIndex = kStartIndex;
                }
            }
            [self updateSceneContents];
            if (numIndex == kIndexCard4) {
                typeCard4 = @"Green_tick_1.png";
                typeCard6 = @"Green_tick_1.png";
                winIndex++;
                [self updateSceneContents];
                numIndex = kStartIndex;
            }
            [self updateProgress];
        }
    }
}

- (void)updateProgress {
    NSLog(@"%d", numIndex);
//    hintLabel = @"";
    if (counter == kIndexChecker) {
        if (![typeCard1  isEqualToString: @"Green_tick_1.png"]) {
            typeCard1 = @"back.jpg";
        }
        if (![typeCard2  isEqualToString: @"Green_tick_1.png"]) {
            typeCard2 = @"back.jpg";
        }
        if (![typeCard3  isEqualToString: @"Green_tick_1.png"]) {
            typeCard3 = @"back.jpg";
        }
        if (![typeCard4  isEqualToString: @"Green_tick_1.png"]) {
            typeCard4 = @"back.jpg";
        }
        if (![typeCard5  isEqualToString: @"Green_tick_1.png"]) {
            typeCard5 = @"back.jpg";
        }
        if (![typeCard6  isEqualToString: @"Green_tick_1.png"]) {
            typeCard6 = @"back.jpg";
        }
        if (winIndex == kIndexChecker) {
            self.currentScore +=(self.totalTime- self.elapsedTime)* kIndexPoints;
            typeCard1 = @"back.jpg";
            typeCard2 = @"back.jpg";
            typeCard3 = @"back.jpg";
            typeCard4 = @"back.jpg";
            typeCard5 = @"back.jpg";
            typeCard6 = @"back.jpg";
            counter = kStartIndex+1;
            numIndex = kStartIndex;
            winIndex = kStartIndex;
            [[NSNotificationCenter defaultCenter]
             postNotificationName:@"DemandNewScene"
             object:self];
            hintLabel = @"A - B - B - Q - A - Q";
            [self endGame];
        }
        [self updateSceneContents];
        counter = 1;
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
-(void) generateCards {
    
    SKLabelNode *labelDescr = [SKLabelNode labelNodeWithFontNamed:@"Arial"];
    labelDescr.position = CGPointMake(500, 650);
    labelDescr.fontSize = 25;
    labelDescr.fontColor = [UIColor whiteColor];
    labelDescr.text = [NSString stringWithFormat:@"Match the cards"];
    labelDescr.name = @"descriptionLabel";
    [self addChild:labelDescr];
    self.hint = [SKLabelNode labelNodeWithFontNamed:@"Arial"];
    self.hint.position = CGPointMake(500, 580);
    self.hint.fontSize = 35;
    self.hint.fontColor = [UIColor whiteColor];
    self.hint.text = [NSString stringWithFormat:hintLabel];
    self.hint.name = @"hint";
    [self addChild:self.hint];
    
    
    self.firstCard = [SKSpriteNode spriteNodeWithImageNamed:typeCard1];
    [self addChild:self.firstCard];
    self.firstCard.position = CGPointMake(150, kWidth);
    self.firstCard.name = @"firstCard";
    self.firstCard.xScale = kIndexScaleNodes;
    self.firstCard.yScale = kIndexScaleNodes;
    self.secondCard = [SKSpriteNode spriteNodeWithImageNamed:typeCard2];
    [self addChild:self.secondCard];
    self.secondCard.position = CGPointMake(300, kWidth);
    self.secondCard.name = @"secondCard";
    self.secondCard.xScale = kIndexScaleNodes;
    self.secondCard.yScale = kIndexScaleNodes;
    self.thirdCard = [SKSpriteNode spriteNodeWithImageNamed:typeCard3];
    [self addChild:self.thirdCard];
    self.thirdCard.position = CGPointMake(450, kWidth);
    self.thirdCard.name = @"thirdCard";
    self.thirdCard.xScale = kIndexScaleNodes;
    self.thirdCard.yScale = kIndexScaleNodes;
    self.fourthCard = [SKSpriteNode spriteNodeWithImageNamed:typeCard4];
    [self addChild:self.fourthCard];
    self.fourthCard.position = CGPointMake(600, kWidth);
    self.fourthCard.name = @"fourthCard";
    self.fourthCard.xScale = kIndexScaleNodes;
    self.fourthCard.yScale = kIndexScaleNodes;
    self.fifthCard = [SKSpriteNode spriteNodeWithImageNamed:typeCard5];
    [self addChild:self.fifthCard];
    self.fifthCard.position = CGPointMake(750, kWidth);
    self.fifthCard.name = @"fifthCard";
    self.fifthCard.xScale = kIndexScaleNodes;
    self.fifthCard.yScale = kIndexScaleNodes;
    self.sixthCard = [SKSpriteNode spriteNodeWithImageNamed:typeCard6];
    [self addChild:self.sixthCard];
    self.sixthCard.position = CGPointMake(900, kWidth);
    self.sixthCard.name = @"sixthCard";
    self.sixthCard.xScale = kIndexScaleNodes;
    self.sixthCard.yScale = kIndexScaleNodes;
}
-(void)update:(CFTimeInterval)currentTime {
    [super update:currentTime];
}
-(SKLabelNode *)getLabelWithPoints{
    return [super getLabelWithPoints];
    
}




@end
