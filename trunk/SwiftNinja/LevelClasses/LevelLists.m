

#import "LevelLists.h"

@interface LevelLists ()

@property(readwrite) NSMutableArray* levelList;

@end

@implementation LevelLists

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self.levelList = [[NSMutableArray alloc] init];
        [self.levelList addObject:@"FlyLevel"];
        [self.levelList addObject:@"PopingCirclesLevel"];
        [self.levelList addObject:@"RunLevel"];
        [self.levelList addObject:@"TypeNinja"];
        [self.levelList addObject:@"CardsLevel"];
        [self.levelList addObject:@"BalanceAndMemoryLevel"];
        [self.levelList addObject:@"BottlesLevel"];
        [self.levelList addObject:@"PuzzleLevel"];
    }
    return self;
}



@end
