/*
 Do not instantiate this class.It is an Abstract class that needs to be only inherited from the different Level classes.
*/

#import <Foundation/Foundation.h>
#import "LevelProtocol.h"
#import <SpriteKit/SpriteKit.h>
#import "ProgressNode.h"
#import "BurningProgressbar.h"

@interface AbstractLevel : SKScene<LevelProtocol,UIAlertViewDelegate>

@property (readonly) NSString*  levelRules;
@property CGFloat currentScore;
@property SKLabelNode* pointsLabel;
@property(readonly) NSTimeInterval totalTime;
@property(readonly)NSTimeInterval elapsedTime;

//
//@property (strong,nonatomic) UIViewController * presentingViewController;

@property BOOL hasLevelEnded;

//common nodes
@property BurningProgressbar* progressBarNode;

- (instancetype)initWithSize:(CGSize)size andTotalTime: (NSTimeInterval) totalTime;

- (void) removeSceneAndChildren;
-(CGFloat) getTimeForLevel;
-(NSInteger) getRemainingLives;
- (void) endLevel;
-(SKLabelNode*) getLabelWithPoints;
@end
