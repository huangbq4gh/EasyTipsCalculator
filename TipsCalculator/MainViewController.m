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
@property (weak, nonatomic) IBOutlet UITextField *amount;
@property (strong, nonatomic) IBOutlet UILabel *tipsLabel;
@property (strong, nonatomic) IBOutlet UILabel *totalLabel;
@property (strong, nonatomic) IBOutlet UISlider *splitSlider;
@property (strong, nonatomic) IBOutlet UILabel *splitByLabel;
@property (strong, nonatomic) IBOutlet UILabel *splitTotal;
@property (strong, nonatomic) NSString *s;
@property (nonatomic) float f;
@end

@implementation MainViewController
@synthesize amount;
@synthesize s;
@synthesize f;

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
   
    [amount addTarget:self
                    action:@selector(textFieldDidChange:)
          forControlEvents:UIControlEventEditingChanged];
    
    self.f = 0.15;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if (textField == self.amount)
    {
        NSString *newString = [textField.text stringByReplacingCharactersInRange:range withString:string];
        NSString *expression = @"^(0|[1-9][0-9]*)?(\\.([0-9]{1,2})?)?$";
        NSError *error = nil;
        NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:expression
                                                                               options:NSRegularExpressionCaseInsensitive
                                                                                 error:&error];
        NSUInteger numberOfMatches = [regex numberOfMatchesInString:newString
                                                            options:0
                                                              range:NSMakeRange(0, [newString length])];
        if (numberOfMatches == 0)
            return NO;
    }
    return YES;
}

- (IBAction)textFieldDidChange:(id)sender {
    CGFloat *bill = (CGFloat)[self.amount.text floatValue];
    [self.tipsLabel setText:[NSString stringWithFormat:@"%0.2f",];
}


- (IBAction)press15:(UIButton *)sender {
    f=0.15;
}
- (IBAction)press18:(UIButton *)sender {
    f=0.18;
}
- (IBAction)press20:(UIButton *)sender {
    f=0.20;
}
- (IBAction)press25:(UIButton *)sender {
    f=0.25;
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
