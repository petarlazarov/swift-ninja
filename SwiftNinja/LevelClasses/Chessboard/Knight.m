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
     I x 0 0
       0 0 1
       0 0 0
 
 */

-(BOOL) checkingIfPositionIsAvailable : (NSInteger) currentPosI andCurrentColumn: (NSInteger) currentPosJ andNextRow :(NSInteger) nextPosI andNextColumn : (NSInteger) nextPosJ {
    //The first check is for the bounds of the arrays
    //and the second is for the position itself
    
    
    /* J  1st posible move
     I x 0 0
       0 0 T
       0 T 0
     
     */
    if (currentPosI==0 && currentPosJ==0 ) {
        if (nextPosI==1 && nextPosJ==2) {
            return YES;
        }
        if (nextPosI==2 && nextPosJ==1) {
            return YES;
        }
    }
    
    /* J  2nd posible move
     I 0 x 0
       0 0 0
       T 0 T
     
     */
    
    if (currentPosI==0 && currentPosJ==1 ) {
        if (nextPosI==2 && nextPosJ==0) {
            return YES;
        }
        if (nextPosI==2 && nextPosJ==2) {
            return YES;
            
        }
    }
    
    /* J  3rd posible move
     I 0 0 x
       T 0 0
       0 T 0
     
     */
    
    if (currentPosI==0 && currentPosJ==2 ) {
        if (nextPosI==1 && nextPosJ==0) {
            return YES;
        }
        if (nextPosI==2 && nextPosJ==1) {
            return YES;
            
        }
    }

    /* J  4th posible move
     I 0 0 T
       x 0 0
       0 0 T
     
     */
    
    if (currentPosI==1 && currentPosJ==0 ) {
        if (nextPosI==0 && nextPosJ==2) {
            return YES;
        }
        if (nextPosI==2 && nextPosJ==2) {
            return YES;
            
        }
    }

    /* J  5th posible move
     I T 0 0
       0 0 x
       T 0 0
     
     */
    
    if (currentPosI==1 && currentPosJ==2 ) {
        if (nextPosI==0 && nextPosJ==0) {
            return YES;
        }
        if (nextPosI==2 && nextPosJ==0) {
            return YES;
            
        }
    }
    
    /* J  6th posible move
     I 0 T 0
       0 0 T
       x 0 0
     
     */
    
    if (currentPosI==2 && currentPosJ==0 ) {
        if (nextPosI==0 && nextPosJ==1) {
            return YES;
        }
        if (nextPosI==1 && nextPosJ==2) {
            return YES;
            
        }
    }
    
    /* J  7th posible move
     I T 0 T
       0 0 0
       0 x 0
     
     */
    
    if (currentPosI==2 && currentPosJ==1 ) {
        if (nextPosI==0 && nextPosJ==0) {
            return YES;
        }
        if (nextPosI==0 && nextPosJ==2) {
            return YES;
            
        }
    }


    /* J  8th posible move
     I 0 T 0
       T 0 0
       0 0 x
     
     */
    
    if (currentPosI==2 && currentPosJ==2 ) {
        if (nextPosI==0 && nextPosJ==1) {
            return YES;
        }
        if (nextPosI==1 && nextPosJ==0) {
            return YES;
            
        }
    }

    
    //Up-left 
//    if(currentPosI-2>=0 && currentPosJ-1 >=0)
//        if(currentPosJ-1==nextPosJ && currentPosI-2==nextPosI)
//            return 1;
//    //Up-right
//    if (currentPosI-2>=0 && currentPosJ+1<5)
//        if(currentPosJ+1==nextPosJ && currentPosI-2==nextPosI)
//            return 1;
//    //Right-Up
//    if(currentPosJ+2<5 && currentPosI-1>=0)
//        if(currentPosJ+2==nextPosJ && currentPosI-1==nextPosI)
//            return 1;
//    //Right-down
//    if(currentPosJ+2<5 && currentPosI+1<5)
//        if(currentPosJ+2==nextPosJ && currentPosI+1==nextPosI)
//            return 1;
//    //Left-up
//    if(currentPosJ-2>=0 && currentPosI-1>=0)
//        if(currentPosJ-2==nextPosJ && currentPosI-1==nextPosI)
//            return 1;
//    //Left-down
//    if(currentPosJ-2>=0 && currentPosI+1<5)
//        if(currentPosJ-2==nextPosJ && currentPosI+1==nextPosI)
//            return 1;
//    //Down-left
//    if(currentPosI+2<5 && currentPosJ-1>=0)
//        if(currentPosJ-1==nextPosJ && currentPosI+2==nextPosI)
//            return 1;
//    //Down-right
//    if(currentPosI+2<5 && currentPosJ+1<5)
//        if(currentPosJ+1==nextPosJ && currentPosI+2==nextPosI)
//            return 1;
    
    return 0;
}



@end
