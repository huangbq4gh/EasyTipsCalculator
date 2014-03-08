//
//  MainViewController.m
//  TipsCalculator
//
//  Created by Bingqing Huang on 3/6/14.
//  Copyright (c) 2014 Bingqing Huang. All rights reserved.
//

#import "MainViewController.h"
#import "ResultViewController.h"

@interface MainViewController ()

@property (strong, nonatomic) IBOutlet UILabel *amount;

@property (strong, nonatomic) NSString *s;
@end

@implementation MainViewController
@synthesize amount;
@synthesize s;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    s = @"";
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)pressOne:(UIButton *)sender {
    if ([amount.text  isEqual: @"0"]) {
        
        s = [s stringByAppendingString:@"1"];
        [amount setText:s];
    }
    else{
        s = amount.text;
        s = [s stringByAppendingString:@"1"];
        [amount setText:s];

    }
   
}
- (IBAction)pressTwo:(UIButton *)sender {
    if ([amount.text  isEqual: @"0"]) {
        
        s = [s stringByAppendingString:@"2"];
        [amount setText:s];
    }
    else{
        s = amount.text;
        s = [s stringByAppendingString:@"2"];
        [amount setText:s];
        
    }
}
- (IBAction)pressThree:(UIButton *)sender {
    if ([amount.text  isEqual: @"0"]) {
        
        s = [s stringByAppendingString:@"3"];
        [amount setText:s];
    }
    else{
        s = amount.text;
        s = [s stringByAppendingString:@"3"];
        [amount setText:s];
        
    }
}
- (IBAction)pressFour:(UIButton *)sender {
    if ([amount.text  isEqual: @"0"]) {
        
        s = [s stringByAppendingString:@"4"];
        [amount setText:s];
    }
    else{
        s = amount.text;
        s = [s stringByAppendingString:@"4"];
        [amount setText:s];
        
    }
}
- (IBAction)pressFive:(UIButton *)sender {
    if ([amount.text  isEqual: @"0"]) {
        
        s = [s stringByAppendingString:@"5"];
        [amount setText:s];
    }
    else{
        s = amount.text;
        s = [s stringByAppendingString:@"5"];
        [amount setText:s];
        
    }
}
- (IBAction)pressSix:(UIButton *)sender {
    if ([amount.text  isEqual: @"0"]) {
        
        s = [s stringByAppendingString:@"6"];
        [amount setText:s];
    }
    else{
        s = amount.text;
        s = [s stringByAppendingString:@"6"];
        [amount setText:s];
        
    }
}
- (IBAction)pressSeven:(UIButton *)sender {
    if ([amount.text  isEqual: @"0"]) {
        
        s = [s stringByAppendingString:@"7"];
        [amount setText:s];
    }
    else{
        s = amount.text;
        s = [s stringByAppendingString:@"7"];
        [amount setText:s];
        
    }
}
- (IBAction)pressEight:(UIButton *)sender {
    if ([amount.text  isEqual: @"0"]) {
        
        s = [s stringByAppendingString:@"8"];
        [amount setText:s];
    }
    else{
        s = amount.text;
        s = [s stringByAppendingString:@"8"];
        [amount setText:s];
        
    }
}
- (IBAction)pressNine:(UIButton *)sender {
    if ([amount.text  isEqual: @"0"]) {
        
        s = [s stringByAppendingString:@"9"];
        [amount setText:s];
    }
    else{
        s = amount.text;
        s = [s stringByAppendingString:@"9"];
        [amount setText:s];
        
    }
}
- (IBAction)pressZero:(UIButton *)sender {
    if ([amount.text  isEqual: @"0"]) {
        
        s = [s stringByAppendingString:@"0"];
        [amount setText:s];
    }
    else{
        s = amount.text;
        s = [s stringByAppendingString:@"0"];
        [amount setText:s];
        
    }
}
- (IBAction)pressDecimal:(UIButton *)sender {
    if ([amount.text rangeOfString:@"."].location == NSNotFound) {
        s = amount.text;
        s = [s stringByAppendingString:@"."];
        [amount setText:s];
    }
}

- (IBAction)pressClear:(UIButton *)sender {
    s = @"";
    [amount setText:@""];
}
- (IBAction)pressConfirm:(UIButton *)sender {
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"toResult"]) {
        ResultViewController *a = segue.destinationViewController;
        a.valueCal = amount.text;
    }
}





@end
