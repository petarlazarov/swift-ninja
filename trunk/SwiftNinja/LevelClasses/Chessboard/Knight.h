

#import <Foundation/Foundation.h>

@interface Knight : NSObject

-(BOOL) checkingIfPositionIsAvailable : (NSInteger) currentPosI andCurrentColumn: (NSInteger) currentPosJ andNextRow :(NSInteger) nextPosI andNextColumn : (NSInteger) nextPosJ;

@end
