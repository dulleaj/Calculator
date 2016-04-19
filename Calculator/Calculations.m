//
//  Calculations.m
//  Calculator
//
//  Created by Andrew Dulle on 4/6/16.
//  Copyright © 2016 Andrew Dulle. All rights reserved.
//

#import "Calculations.h"

@implementation Calculations

// METHOD FOR SOLVING EQUATION AFTER EQUALS WAS PRESSED, OR UPDATING TEXTVIEW DURING EQUATION
- (NSString *)solveCurrentEquation:(int)operation for:(NSString*)currentTextView{
    
    self.operationButtonWasPressed = YES;
    
    self.decimalAdjuster = [[NSNumberFormatter alloc] init];
    self.decimalAdjuster.numberStyle = NSNumberFormatterDecimalStyle;
    self.decimalAdjuster.maximumFractionDigits = 7;
    
    if ((self.decimalWasPressed == YES) || ([currentTextView containsString:@"."])){
        
        self.secondFloat = [currentTextView floatValue];
        
        self.decimalWasPressed = nil;
        
    }else if (self.decimalWasPressed == NO){
        
        self.secondInt = [currentTextView intValue];
        
        self.secondFloat = (float)self.secondInt;
        
        self.decimalWasPressed = nil;
    }
    
    if (operation == 0){
        
        self.runningTotalFloat = 0;
        self.firstFloat = 0;
        self.secondFloat = 0;
        self.operationSelected = 0;
        self.operationButtonWasPressed = NO;
        return @"0";
        
    }else if (operation == 1){
        
        self.runningTotalFloat = self.runningTotalFloat + self.secondFloat;
        
    }else if (operation == 2){
        
        self.runningTotalFloat = self.runningTotalFloat - self.secondFloat;
        
    }else if (operation == 3){
        
        self.runningTotalFloat = self.runningTotalFloat * self.secondFloat;
        
    }else if (operation == 4){
        
        if(self.secondFloat == 0){
            
            return @"Error";
            
        }else{
            
            self.runningTotalFloat = self.runningTotalFloat / self.secondFloat;
        }
    }else{
        
        return @"Error";
    }
    
    self.operationSelected = 0;
    
    NSNumber *totalNumber = [NSNumber numberWithFloat:self.runningTotalFloat];
    
    return [self.decimalAdjuster stringFromNumber:totalNumber];

}


// METHOD FOR SETTING FIRST FLOAT
- (void)convertTextViewToUserFloat:(NSString *)currentTextView {
    
    if ((self.decimalWasPressed == YES) || ([currentTextView containsString:@"."])){
        
        self.firstFloat = [currentTextView floatValue];
        
    }else if (self.decimalWasPressed == NO){
        
        self.firstInt = [currentTextView intValue];
        
        self.firstFloat = (float)self.firstInt;
    }
    
    self.runningTotalFloat = self.runningTotalFloat + self.firstFloat;
    
    self.decimalWasPressed = nil;

}

// METHOD FOR SOLVING PERCENTAGES
- (NSString *)percentageAnswer:(int)percentButton of:(NSString *)currentTextView {
    
    [self convertTextViewToUserFloat:currentTextView];
    
    if (percentButton == 5) {
        
        self.runningTotalFloat = self.runningTotalFloat * .20;
    
    }else if (percentButton == 6) {
        
        self.runningTotalFloat = self.runningTotalFloat * .18;
    
    }else if (percentButton == 7) {
        
        self.runningTotalFloat = self.runningTotalFloat * .15;
        
    }
    
    self.decimalAdjuster = [[NSNumberFormatter alloc] init];
    self.decimalAdjuster.numberStyle = NSNumberFormatterDecimalStyle;
    self.decimalAdjuster.maximumFractionDigits = 2;

    NSNumber *totalNumber = [NSNumber numberWithFloat:self.runningTotalFloat];
    
    return [self.decimalAdjuster stringFromNumber:totalNumber];
    
}



@end
