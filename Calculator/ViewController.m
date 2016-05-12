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

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.equation = [[Calculations alloc] init];
    
    self.mainDisplay.text = @"0";
}


//  METHOD TO REMOVE ZERO FROM BEGINNING OF NUMBERS
- (void)removeDefaultZero{
    
    if ([self.mainDisplay.text isEqual: @"0"] || self.equation.operationButtonWasPressed == YES) {
        
        self.mainDisplay.text = @"";
        self.equation.operationButtonWasPressed = NO;
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


- (IBAction)ACWasPushed:(id)sender { //0

    [self changeButtonAlphaBack];

    self.mainDisplay.text = [self.equation solveCurrentEquation:0 for:self.mainDisplay.text];
}


- (IBAction)periodWasPushed:(id)sender {
    
    self.equation.decimalWasPressed = YES;
    
    [self removeDefaultZero];
    
    if ([self.mainDisplay.text isEqualToString:@""]){
        self.mainDisplay.text = [self.mainDisplay.text stringByAppendingString:@"0."];
        
    }else{
        
        self.mainDisplay.text = [self.mainDisplay.text stringByAppendingString:@"."];
    }
}


- (IBAction)equalsWasPushed:(id)sender {
    
    [self changeButtonAlphaBack];
    
    self.equals.enabled = NO;
    
    self.mainDisplay.text = [self.equation solveCurrentEquation:self.equation.operationSelected for:self.mainDisplay.text];
    
    self.equation.runningTotalFloat = 0;
}


- (IBAction)plusWasPushed:(id)sender { //1
    
    [self wasEqualsButtonPressed:1];
    self.plus.alpha = .5;
}


- (IBAction)minusWasPushed:(id)sender { //2
    
    [self wasEqualsButtonPressed:2];
    self.minus.alpha = .5;
}


- (IBAction)multiplyWasPushed:(id)sender { //3
    
    [self wasEqualsButtonPressed:3];
    self.multiply.alpha = .5;
}


- (IBAction)divideWasPushed:(id)sender { //4
    
    [self wasEqualsButtonPressed:4];
    self.divide.alpha = .5;
}


- (IBAction)tip20WasPushed:(id)sender { //5

    self.equals.enabled = NO;
    
    [self changeButtonAlphaBack];
    self.tip20Percent.alpha = .5;
    
    self.mainDisplay.text = [self.equation percentageAnswer:5 of:self.mainDisplay.text];
    self.equation.runningTotalFloat = 0;
}


- (IBAction)tip18WasPushed:(id)sender { //6

    self.equals.enabled = NO;
    
    [self changeButtonAlphaBack];
    self.tip18Percent.alpha = .5;

    self.mainDisplay.text = [self.equation percentageAnswer:6 of:self.mainDisplay.text];
    self.equation.runningTotalFloat = 0;
}


- (IBAction)tip15WasPushed:(id)sender { //7

    self.equals.enabled = NO;
    
    [self changeButtonAlphaBack];
    self.tip15Percent.alpha = .5;

    self.mainDisplay.text = [self.equation percentageAnswer:7 of:self.mainDisplay.text];
    self.equation.runningTotalFloat = 0;
}


// METHOD FOR MAKING ALL OPERATION BUTTONS LOOK NORMAL AGAIN
- (void)changeButtonAlphaBack {
    
    if((self.plus.alpha == .5) || (self.minus.alpha == .5)||(self.multiply.alpha == .5)||(self.divide.alpha == .5)||(self.tip20Percent.alpha == .5)||(self.tip18Percent.alpha == .5)||(self.tip15Percent.alpha == .5)){
        
    self.plus.alpha = 1;
    self.minus.alpha = 1;
    self.multiply.alpha = 1;
    self.divide.alpha = 1;
    self.tip15Percent.alpha = 1;
    self.tip18Percent.alpha = 1;
    self.tip20Percent.alpha = 1;
    
    }
}


// METHOD UPDATING TEXTVIEW DURING EQUATION AND FOR REFERENCING CALCULATIONS METHOD FOR SETTING FIRST FLOAT
- (void)wasEqualsButtonPressed: (int)operation {
    
    self.equals.enabled = YES;
    
    [self changeButtonAlphaBack];
    
    if (self.equation.operationSelected == 0){
        self.equation.operationSelected = operation;
        self.equation.operationButtonWasPressed = YES;
        NSString *sansCommas = [self.mainDisplay.text stringByReplacingOccurrencesOfString:@"," withString:@""];//added
        [self.equation convertTextViewToUserFloat:sansCommas];//changed to sansCommas
    }else{
        
        self.mainDisplay.text = [self.equation solveCurrentEquation:self.equation.operationSelected for:self.mainDisplay.text];
        self.equation.operationSelected = operation;
        self.equation.operationButtonWasPressed = YES;
    }
}


/* TO DO:
 
need to add commas to text as it's entered, then go to wasEqualsPressed and convert string using same format.
 
could also stand to fix how user can hit plus then equals instantly again. Might need to change when number is pressed?
 
*/

@end
