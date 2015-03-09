

#import "AbstractLevelFactory.h"

@implementation AbstractLevelFactory


+sceneFactory :(NSString*) name{
    id instance = nil;
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth = screenRect.size.width;
    CGFloat screenHeight = screenRect.size.height;
    
    if ([name isEqual:@"FlyLevel"]) {
        NSLog(@"Creating FlyLevel");
        instance = [[FlyLevel alloc] initWithSize:CGSizeMake(screenWidth, screenHeight) andTotalTime:kFlyLevelTime];
    }
    
    if ([name isEqual:@"PopingCirclesLevel"]) {
        NSLog(@"Creating PopingCirclesLevel");
        instance = [[PopingCirclesLevel alloc] initWithSize:CGSizeMake(screenWidth, screenHeight) andTotalTime:kPopingCirclesLevelTime];
    }
    if ([name isEqual:@"CardsLevel"]) {
        NSLog(@"Creating CardsLevel");
        instance = [[CardsLevel alloc] initWithSize:CGSizeMake(screenWidth, screenHeight) andTotalTime:kCardsLevelTime];
    }
    
    if ([name isEqual:@"RunLevel"]) {
        NSLog(@"Creating RunLevel");
//        instance = [[GameScene alloc] initWithSize:CGSizeMake(screenWidth, screenHeight) andTotalTime:kRunLevelTime];
        instance = [[ObstacleLevel alloc] initWithSize:CGSizeMake(screenWidth, screenHeight) andTotalTime:kChessLevelTime];
        
    }
    
    if ([name isEqual:@"BalanceAndMemoryLevel"]) {
        NSLog(@"Creating BalanceAndMemoryLevel");
//        instance = [[BalanceAndMemoryScene alloc] initWithSize:CGSizeMake(screenWidth, screenHeight) andTotalTime:kBalanceAndMemoryTime];
        instance = [[ObstacleLevel alloc] initWithSize:CGSizeMake(screenWidth, screenHeight) andTotalTime:kChessLevelTime];
        
    }
    if ([name isEqual:@"BottlesLevel"]) {
        NSLog(@"Creating BottlesLevel");
        instance = [[Bottles alloc] initWithSize:CGSizeMake(screenWidth, screenHeight) andTotalTime:kBottlesLevelTime];
        
    }
    if ([name isEqual:@"TypeNinja"]) {
        NSLog(@"Creating TypeNinja");
        instance = [[TypeNinja alloc] initWithSize:CGSizeMake(screenWidth, screenHeight) andTotalTime:kTypeNinjaLevelTime];
        
        
    }
    if ([name isEqual:@"PuzzleLevel"]) {
        NSLog(@"Creating PuzzleLevel");
        instance = [[PuzzleLevel alloc] initWithSize:CGSizeMake(screenWidth, screenHeight) andTotalTime:kPuzzleLevelTime];
    }
    if ([name isEqual:@"ChessBoardLevel"]) {
        NSLog(@"ChessBoardLevel");
        instance = [[ChessBoardLevel alloc] initWithSize:CGSizeMake(screenWidth, screenHeight) andTotalTime:kCardsLevelTime];
    }
   

    if ([name isEqual:@"ObstacleLevel"]) {
        NSLog(@"Creating ObstacleLevel");
        instance = [[ObstacleLevel alloc] initWithSize:CGSizeMake(screenWidth, screenHeight) andTotalTime:kChessLevelTime];
    }
    
    
    return instance ;
}


@end
