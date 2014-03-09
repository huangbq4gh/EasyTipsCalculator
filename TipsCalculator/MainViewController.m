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
@property (strong, nonatomic) IBOutlet UILabel *tipPercLabel;
@property (strong, nonatomic) IBOutlet UISlider *tipSlider;
@property (strong, nonatomic) NSString *s;
@property (nonatomic) float f;
@property (nonatomic) float n;
@end

@implementation MainViewController
@synthesize amount;
@synthesize s;
@synthesize f;
@synthesize n;
@synthesize splitByLabel;
@synthesize splitSlider;
@synthesize splitTotal;
@synthesize tipPercLabel;
@synthesize tipSlider;

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
    n = 1;
    f = 10;
	// Do any additional setup after loading the view.
   
    [amount addTarget:self
                    action:@selector(textFieldDidChange:)
          forControlEvents:UIControlEventEditingChanged];
    
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
    [self updateTextFields];
}
- (IBAction)tipSliderValueChanged:(UISlider *)sender {
    int num = roundf([sender value]);
    [sender setValue:num];
    self.f = (float)num;
    [self.tipPercLabel setText:[NSString stringWithFormat:@"%d%%",num]];
    [self updateTextFields];
}

- (IBAction)splitSliderValueChanged:(UISlider *)sender {
    int num = roundf([sender value]);
    [sender setValue:num];
    self.n = (float)num;
    [self.splitByLabel setText:[NSString stringWithFormat:@"%d",num]];
    [self updateTextFields];
}

-(void)updateTextFields{
    float bill = (float)[self.amount.text floatValue];
    [self.tipsLabel setText:[NSString stringWithFormat:@"%0.2f",bill*f/100]];
    [self.totalLabel setText:[NSString stringWithFormat:@"%0.2f",bill*(f+1)/100]];
    NSString *str = [NSString stringWithFormat:@"%0.2f",(float)bill*(f+1)/n/100];
    [self.splitTotal setText:str];
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
