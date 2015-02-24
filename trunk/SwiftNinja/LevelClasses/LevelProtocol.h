
#import <Foundation/Foundation.h>
#import <SpriteKit/SpriteKit.h>

@protocol LevelProtocol <NSObject>

-(BOOL) levelDidStart;

//Just call [super LevelDidEnd] and give it the appropriate arguments

-(BOOL) levelDidEnd : (SKView*) skView andWithNewScene: (SKScene*) newScene andWithTransition : (SKTransition*) transition;

@end
