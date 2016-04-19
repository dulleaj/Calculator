//
//  Calculations.h
//  Calculator
//
//  Created by Andrew Dulle on 4/6/16.
//  Copyright © 2016 Andrew Dulle. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Calculations : NSObject

@property float runningTotalFloat;

@property int firstInt;
@property int secondInt;

@property float firstFloat;
@property float secondFloat;

@property int operationSelected;

@property BOOL decimalWasPressed;

@property BOOL operationButtonWasPressed;

@property NSNumberFormatter* decimalAdjuster;
//http://stackoverflow.com/questions/22419044/how-do-i-delete-trailing-zeros-on-floats-without-rounding-in-objective-c

- (NSString *)solveCurrentEquation: (int)operation for:(NSString*)currentTextView;

- (void)convertTextViewToUserFloat: (NSString *)currentTextView;

- (NSString *)percentageAnswer: (int)percentButton of: (NSString *)currentTextView;

@end
