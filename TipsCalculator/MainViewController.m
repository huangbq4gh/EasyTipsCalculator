//
//  MainViewController.m
//  TipsCalculator
//
//  Created by Bingqing Huang on 3/6/14.
//  Copyright (c) 2014 Bingqing Huang. All rights reserved.
//

#import "MainViewController.h"
#import "dotField.h"

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
/*
- (BOOL)textField:(dotField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSString *stringPlace = @"0|[1-9][0-9]*";
    NSPredicate *testPlace = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", stringPlace];
    BOOL matches = [testPlace evaluateWithObject:string];
    
    if (!matches && string.length > 5)
    {
        return NO;
    }
    return YES;
}
*/
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    NSCharacterSet *nonNumberSet = [[NSCharacterSet decimalDigitCharacterSet] invertedSet];
    return ([string stringByTrimmingCharactersInSet:nonNumberSet].length > 0) || [string isEqualToString:@""];
}



/*
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"toResult"]) {
        ResultViewController *a = segue.destinationViewController;
        a.valueCal = amount.text;
    }
}
*/




@end
