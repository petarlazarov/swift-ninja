/*
 Do not instantiate this class.It is an Abstract class that needs to be only inherited from the different Level classes.
*/

#import <Foundation/Foundation.h>
#import "LevelProtocol.h"
#import <SpriteKit/SpriteKit.h>
#import "ProgressNode.h"
#import "BurningProgressbar.h"
#import "AlartViewController.h"

@interface AbstractLevel : SKScene<LevelProtocol,UIAlertViewDelegate,ExpendableAlartViewDelegate>

@property (readonly) NSString*  levelRules;
//@property  CGFloat currentScore;
@property SKLabelNode* pointsLabel;
@property(readonly) NSTimeInterval totalTime;
@property(readonly)NSTimeInterval elapsedTime;

//
//@property (strong,nonatomic) UIViewController * presentingViewController;

@property BOOL hasLevelEnded;

//common nodes
@property BurningProgressbar* progressBarNode;

- (instancetype)initWithSize:(CGSize)size andTotalTime: (NSTimeInterval) totalTime;

-(CGFloat) getCurrentScore;
-(void) setCurrentScore : (CGFloat) levelScore;

- (void) removeSceneAndChildren;
-(CGFloat) getTimeForLevel;
-(NSInteger) getRemainingLives;
- (void) endLevel;
-(SKLabelNode*) getLabelWithPoints;
@end
