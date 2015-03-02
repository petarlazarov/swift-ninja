//
//  Knight.m
//  SwiftNinja
//
//  Created by game on 2/28/15.
//  Copyright (c) 2015 VP. All rights reserved.
//

#import "Knight.h"

@implementation Knight
/*     J
     I 0 x x 0 0
       0 0 x 0 0
       0 0 x 0 0
       0 0 0 0 0
       0 0 0 0 0
 
 */

-(BOOL) checkingIfPositionIsAvailable : (NSInteger) currentPosI andCurrentColumn: (NSInteger) currentPosJ andNextRow :(NSInteger) nextPosI andNextColumn : (NSInteger) nextPosJ {
    //The first check is for the bounds of the arrays
    //and the second is for the position itself
    
    //Up-left 
    if(currentPosI-2>=0 && currentPosJ-1 >=0)
        if(currentPosJ-1==nextPosJ && currentPosI-2==nextPosI)
            return 1;
    //Up-right
    if (currentPosI-2>=0 && currentPosJ+1<5)
        if(currentPosJ+1==nextPosJ && currentPosI-2==nextPosI)
            return 1;
    //Right-Up
    if(currentPosJ+2<5 && currentPosI-1>=0)
        if(currentPosJ+2==nextPosJ && currentPosI-1==nextPosI)
            return 1;
    //Right-down
    if(currentPosJ+2<5 && currentPosI+1<5)
        if(currentPosJ+2==nextPosJ && currentPosI+1==nextPosI)
            return 1;
    //Left-up
    if(currentPosJ-2>=0 && currentPosI-1>=0)
        if(currentPosJ-2==nextPosJ && currentPosI-1==nextPosI)
            return 1;
    //Left-down
    if(currentPosJ-2>=0 && currentPosI+1<5)
        if(currentPosJ-2==nextPosJ && currentPosI+1==nextPosI)
            return 1;
    //Down-left
    if(currentPosI+2<5 && currentPosJ-1>=0)
        if(currentPosJ-1==nextPosJ && currentPosI+2==nextPosI)
            return 1;
    //Down-right
    if(currentPosI+2<5 && currentPosJ+1<5)
        if(currentPosJ+1==nextPosJ && currentPosI+2==nextPosI)
            return 1;
    
    return 0;
}



@end
