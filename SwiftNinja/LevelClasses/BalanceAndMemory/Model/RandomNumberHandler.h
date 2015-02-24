//
//  RandomNumberHandler.h
//  BalanceAndMemory
//
//  Created by User-03 on 12/10/14.
//  Copyright (c) 2014 TrainingCamp. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RandomNumberHandler : NSObject

@property(readonly) NSMutableArray* numberList;

- (NSUInteger) generateNumber;
- (void) getNewNumber;
- (BOOL) checkNumber: (NSUInteger) number;

@end
