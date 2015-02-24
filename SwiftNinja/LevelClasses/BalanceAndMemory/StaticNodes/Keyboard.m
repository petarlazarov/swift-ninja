//
//  Keyboard.m
//  BalanceAndMemory
//
//  Created by User-03 on 12/17/14.
//  Copyright (c) 2014 TrainingCamp. All rights reserved.
//

#import "Keyboard.h"
#import "ConstantsBalanceAndMemory.h"


@interface Keyboard ()

@property(readwrite) NSMutableArray* buttonArray;


@end

@implementation Keyboard

+ (instancetype) keyboardWithScene:(SKScene *)parentScene{
    
    CGFloat keyboardWidth = parentScene.view.bounds.size.width*kKeyboardToScreenWidthFactor;
    CGFloat keyboardHeight = parentScene.view.bounds.size.height*kKeyboardToScreenHeightFactor;
    Keyboard* keyboard = [self spriteNodeWithColor:[UIColor clearColor] size:CGSizeMake(keyboardWidth, keyboardHeight)];
    keyboard.buttonArray = [[NSMutableArray alloc] init];
    
    CGPoint startingButtonPosition = CGPointMake(keyboardWidth*0.25, keyboardHeight*kKeysHeightInKeyboardFactor);
    for (int i=0; i<10; i++) {
        AGSpriteButton* button = [AGSpriteButton buttonWithColor:[UIColor grayColor] andSize:CGSizeMake(keyboardWidth*kKeysSizeToKeyboardSizeFactor, keyboardWidth*kKeysSizeToKeyboardSizeFactor)];
        [button setLabelWithText:[NSString stringWithFormat:@"%d", i] andFont:nil withColor:nil];
        if (i%2==0) {
            startingButtonPosition.y -= keyboardHeight*0.2;
            button.position = CGPointMake(startingButtonPosition.x, startingButtonPosition.y);
        }
        else {
            button.position = CGPointMake(startingButtonPosition.x+ keyboardWidth/2, startingButtonPosition.y);
        }
        [keyboard.buttonArray addObject:button];
        [keyboard addChild:keyboard.buttonArray[i]];
        
    }
    
    keyboard.displayLabel = [[SKLabelNode alloc] initWithFontNamed:@"Arial"];
    //keyboard.displayLabel.fontSize = 20;
    keyboard.displayBackground = [SKSpriteNode spriteNodeWithColor:[UIColor blackColor] size:CGSizeMake(keyboardWidth, keyboardWidth*0.48)];
    keyboard.displayLabel.position = CGPointMake(0, 0);
    [keyboard.displayBackground addChild:keyboard.displayLabel];
    keyboard.displayBackground.position = CGPointMake(keyboardWidth*0.5, keyboardHeight*0.6);
    [keyboard addChild:keyboard.displayBackground];
    
    
    return keyboard;
}

@end
