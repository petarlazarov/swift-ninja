//
//  RandomNumberHandler.m
//  BalanceAndMemory
//
//  Created by User-03 on 12/10/14.
//  Copyright (c) 2014 TrainingCamp. All rights reserved.
//

#import "RandomNumberHandler.h"

@interface RandomNumberHandler()

@property(readwrite) NSMutableArray* numberList;

@end

@implementation RandomNumberHandler


- (instancetype)init
{
    self = [super init];
    if (self) {
        self.numberList = [[NSMutableArray alloc] init];
        [self getNewNumber];
    }
    return self;
}

//generates new number
- (NSUInteger) generateNumber {
    NSUInteger randomNumber;
    randomNumber = arc4random_uniform(10);
    return randomNumber;
}


//generates new number and inserts it in the array
- (void) getNewNumber {
    NSUInteger number = [self generateNumber];
    NSLog(@"Generated number: %lu", (unsigned long)number);
    [self.numberList insertObject: [NSNumber numberWithUnsignedInteger:number]atIndex:0];
    if ([self.numberList count]>3) {
        [self.numberList removeObjectAtIndex:3];
        NSLog(@"Array: %@, %@, %@", self.numberList[0], self.numberList[1], self.numberList[2]);
    }
    
    
    
}

//checks if input number is the one generated two before
- (BOOL) checkNumber: (NSUInteger) number {
    NSNumber* numberInNSNumber = [NSNumber numberWithUnsignedInteger:number];
    if ([self.numberList count]<3) {
        return NO;
    }
    if ([self.numberList[2] isEqual: numberInNSNumber]) {
        return YES;
    }
    else {
        return NO;
    }
}

@end
