
#import <Foundation/Foundation.h>
#import "AbstractLevel.h"
#import "FlyLevel.h"
#import "PopingCirclesLevel.h"
#import "GameScene.h"
#import "CommonLevelConstants.h"
#import "CardsLevel.h"
#import "BalanceAndMemoryScene.h"
#import "Bottles.h"
#import "TypeNinja.h"
#import "PuzzleLevel.h"
#import "ChessBoardLevel.h"
#import "ObstacleLevel.h"


/*
 This class contains a factory method that returns the desired level.
 Add your levels in the +sceneFactory method.
 */

@interface AbstractLevelFactory : NSObject


+sceneFactory :(NSString*) name;


@end
