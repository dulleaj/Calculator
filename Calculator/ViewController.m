//
//  ViewController.m
//  Calculator
//
//  Created by Andrew Dulle on 3/30/16.
//  Copyright © 2016 Andrew Dulle. All rights reserved.
//

#import "ViewController.h"
#import "Calculations.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *zero;
@property (weak, nonatomic) IBOutlet UIButton *one;
@property (weak, nonatomic) IBOutlet UIButton *two;
@property (weak, nonatomic) IBOutlet UIButton *three;
@property (weak, nonatomic) IBOutlet UIButton *four;
@property (weak, nonatomic) IBOutlet UIButton *five;
@property (weak, nonatomic) IBOutlet UIButton *six;
@property (weak, nonatomic) IBOutlet UIButton *seven;
@property (weak, nonatomic) IBOutlet UIButton *eight;
@property (weak, nonatomic) IBOutlet UIButton *nine;
@property (weak, nonatomic) IBOutlet UIButton *AC;
@property (weak, nonatomic) IBOutlet UIButton *period;
@property (weak, nonatomic) IBOutlet UIButton *equals;
@property (weak, nonatomic) IBOutlet UIButton *plus;
@property (weak, nonatomic) IBOutlet UIButton *minus;
@property (weak, nonatomic) IBOutlet UIButton *multiply;
@property (weak, nonatomic) IBOutlet UIButton *divide;
@property (weak, nonatomic) IBOutlet UIButton *tip20Percent;
@property (weak, nonatomic) IBOutlet UIButton *tip18Percent;
@property (weak, nonatomic) IBOutlet UIButton *tip15Percent;
@property (weak, nonatomic) IBOutlet UITextView *mainDisplay;
@property Calculations* equation;
@property int runningTotal;
@property int operationSelected;
@property int firstInt;
@property int secondInt;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.equation = [[Calculations alloc] init];
    
    self.mainDisplay.text = @"0";
}

- (void)removeDefaultZero{
    
    if ([self.mainDisplay.text isEqual: @"0"]/* || self.operationSelected != 0*/) {
        
        self.mainDisplay.text = @"";
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


- (IBAction)zeroWasPushed:(id)sender {
    
    [self removeDefaultZero];
    self.mainDisplay.text = [self.mainDisplay.text stringByAppendingString:@"0"];
}


- (IBAction)oneWasPushed:(id)sender {
    
    [self removeDefaultZero];
    self.mainDisplay.text = [self.mainDisplay.text stringByAppendingString:@"1"];
}


- (IBAction)twoWasPushed:(id)sender {
    
    [self removeDefaultZero];
    self.mainDisplay.text = [self.mainDisplay.text stringByAppendingString:@"2"];
}


- (IBAction)threeWasPushed:(id)sender {
    
    [self removeDefaultZero];
    self.mainDisplay.text = [self.mainDisplay.text stringByAppendingString:@"3"];
}


- (IBAction)fourWasPushed:(id)sender {

    [self removeDefaultZero];
    self.mainDisplay.text = [self.mainDisplay.text stringByAppendingString:@"4"];
}


- (IBAction)fiveWasPushed:(id)sender {

    [self removeDefaultZero];
    self.mainDisplay.text = [self.mainDisplay.text stringByAppendingString:@"5"];
}


- (IBAction)sixWasPushed:(id)sender {

    [self removeDefaultZero];
    self.mainDisplay.text = [self.mainDisplay.text stringByAppendingString:@"6"];
}


- (IBAction)sevenWasPushed:(id)sender {
    
    [self removeDefaultZero];
    self.mainDisplay.text = [self.mainDisplay.text stringByAppendingString:@"7"];
}


- (IBAction)eightWasPushed:(id)sender {
    
    [self removeDefaultZero];
    self.mainDisplay.text = [self.mainDisplay.text stringByAppendingString:@"8"];
}


- (IBAction)nineWasPushed:(id)sender {
    
    [self removeDefaultZero];
    self.mainDisplay.text = [self.mainDisplay.text stringByAppendingString:@"9"];
}


- (IBAction)ACWasPushed:(id)sender {

    self.runningTotal = 0;
    self.mainDisplay.text = @"0";
}


- (IBAction)periodWasPushed:(id)sender {

    self.mainDisplay.text = [self.mainDisplay.text stringByAppendingString:@"0."];
}


- (IBAction)equalsWasPushed:(id)sender {
    
    self.secondInt = [self.mainDisplay.text intValue];
    
    [self equalsUsesOperationSelected:self.operationSelected];
    
    self.mainDisplay.text = [NSString stringWithFormat:@"%d",self.runningTotal];
    
    self.runningTotal = 0;
    
}


- (void)equalsUsesOperationSelected:(int)operation {
    
    if (operation == 1){
        
        self.runningTotal = self.runningTotal + self.secondInt;
        
    }else if (operation == 2){
        
        self.runningTotal = self.runningTotal - self.secondInt;
        
    }else if (operation == 3){
        
        self.runningTotal = self.runningTotal * self.secondInt;
        
    }else if (operation == 4){
        
        self.runningTotal = self.runningTotal / self.secondInt;
    }
}


- (IBAction)plusWasPushed:(id)sender { //1
    
    self.operationSelected = 1;
    
    [self currentTextToInt];
}


- (IBAction)minusWasPushed:(id)sender { //2
    
    self.operationSelected = 2;
    
    [self currentTextToInt];
}


- (IBAction)multiplyWasPushed:(id)sender { //3
    
    self.operationSelected = 3;
    
    [self currentTextToInt];
}


- (IBAction)divideWasPushed:(id)sender { //4
    
    self.operationSelected = 4;
    
    [self currentTextToInt];
}


- (IBAction)tip20WasPushed:(id)sender {
}


- (IBAction)tip18WasPushed:(id)sender {
}


- (IBAction)tip15WasPushed:(id)sender {
}


- (void)currentTextToInt { // happens when operation is pushed
    
    self.firstInt = [self.mainDisplay.text intValue];
    self.runningTotal = self.runningTotal + self.firstInt;
    self.mainDisplay.text = nil;
}

/* CHANGES THAT I'M TESTING

in currentTextToInt, I'm erasing running total.
 
*/


/* TO DO:
 
- Could be cool to make text box larger and show equation being typed out?
- If a number is pushed, display should show that number. If a sign is pushed, it's alpha should be changed to 0.75.
 
*/




/* RANDOM NOTES;
 
Buttons: "1 + 1 = + 1 =" (2)
 
 - "1" is pressed, making textView equal to (1)
 
 - "+" is pressed, calling the method that makes self.firstInt equal to what's in the textview (1). Then, self.runningTotal (0) = self.runningTotal (0) + firstInt (1), which means self.runningTotal equals (1). TextView is then cleared.
 
 - "1" is pressed again, making the textView equal to (1)
 
 - "=" is pressed, making self.secondInt equal to the textView, which is (1). It then calls the method that uses the formula: [self.runningTotal (1)] = [self.runningTotal (1)] + [self.secondInt (1)]. self.runningTotal now equals 2 (from 1 + 1), and the textview equals (2).
 
 - "+" is pressed, calling the method that makes self.firstInt equal to what's in the textview (2). Then, self.runningTotal (2) = self.runningTotal (2) + firstInt (now 2), which means self.runningTotal equals (4). textview is then cleared.
 
 - "1" is pressed, making the textview equal to (1)
 
 - "=" is pressed, making self.secondInt equal to the textView, which is (1). It then calls the method that uses the formula: [self.runningTotal (4)] = [self.runningTotal (4)] + [self.secondInt (1)]. self.runningTotal now equals 5 (from 4 + 1), and the textview equals (5).
 
 
 
----------
 
 
 
 Buttons: "1 + 1 + 1 =" (2)
 
 - "1" is pressed, making textView equal to (1)
 
 - "+" is pressed, calling the method that makes self.firstInt equal to what's in the textview (1). Then, self.runningTotal (0) = self.runningTotal (0) + firstInt (1), which means self.runningTotal equals (1). TextView is then cleared.
 
 - "1" is pressed again, making the textView equal to (1)
 
 - "+" is pressed, calling the method that makes self.firstInt equal to what's in the textview (1). Then, self.runningTotal (1) = self.runningTotal (1) + firstInt (now 1), which means self.runningTotal equals (2). textview is then cleared.
 
 - "1" is pressed, making the textview equal to (1)
 
 - "=" is pressed, making self.secondInt equal to the textView, which is (1). It then calls the method that uses the formula: [self.runningTotal (2)] = [self.runningTotal (2)] + [self.secondInt (1)]. self.runningTotal now equals 3 (from 2 + 1), and the textview equals (3).


 _____________________________________________________________________________________________________
 VS 
 

 
When "=" is pushed, at the end we need to set running total equal to 0. The textview will still equal the running total, then when the next operation is pressed the running total will be set back to where it should be.
 
 
 
 */

@end
