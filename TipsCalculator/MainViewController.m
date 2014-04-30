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
@property (weak, nonatomic) IBOutlet UITextField *amountTextField;
@property (strong, nonatomic) IBOutlet UILabel *tipsLabel;
@property (strong, nonatomic) IBOutlet UILabel *totalLabel;
@property (strong, nonatomic) NSString *s;
@property (nonatomic) float f;
@property (nonatomic) float n;
@property (weak, nonatomic) IBOutlet UIButton *t10;
@property (weak, nonatomic) IBOutlet UIButton *t15;
@property (weak, nonatomic) IBOutlet UIButton *t18;
@property (weak, nonatomic) IBOutlet UIButton *t20;
@property (strong, nonatomic) IBOutlet UISlider *tipScroll;
@property (weak, nonatomic) IBOutlet UILabel *sliderLabel;

@end

@implementation MainViewController
@synthesize amountTextField;
@synthesize s;
@synthesize f;
@synthesize n;
@synthesize t10;
@synthesize t15;
@synthesize t18;
@synthesize t20;
@synthesize tipScroll;
@synthesize sliderLabel;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    
    return self;
}

-(void)awakeFromNib{
    /*
    UIImageView *bg = [[UIImageView alloc] initWithFrame:CGRectMake(40, 80, 280, 100)];
    [bg setImage:[UIImage imageNamed:@"inputbg.png"]];
    [self.view addSubview:bg];
     */
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    s = @"";
    n = 1;
    f = 10;
	// Do any additional setup after loading the view.
   
    [amountTextField addTarget:self
                    action:@selector(textFieldDidChange:)
          forControlEvents:UIControlEventEditingChanged];
    UITapGestureRecognizer *tapToDismissKeyboard = [[UITapGestureRecognizer alloc]initWithTarget:self
                                                                                          action:@selector(dismissKeyboard)];
    [self.view addGestureRecognizer:tapToDismissKeyboard];
    //[[UIApplication sharedApplication]setStatusBarStyle:UIStatusBarStyleLightContent];
    [self setNeedsStatusBarAppearanceUpdate];
    [amountTextField becomeFirstResponder];
    
    [tipScroll addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];
    
    [tipScroll setMaximumTrackImage:[UIImage imageNamed:@"slidertracker_max.png"] forState:UIControlStateNormal];
    [tipScroll setMinimumTrackImage:[UIImage imageNamed:@"slidertracker_min.png"] forState:UIControlStateNormal];
    [tipScroll setThumbImage:[UIImage imageNamed:@"scrollthumb.png"] forState:UIControlStateNormal];
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"appbg.jpg"]]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIStatusBarStyle) preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if (textField == self.amountTextField)
    {
        NSString *newString = [textField.text stringByReplacingCharactersInRange:range
                                                                      withString:string];
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

- (IBAction)sliderValueChanged:(UISlider *)sender {
    int num = roundf(sender.value);
    NSString *str = [NSString stringWithFormat:@"%d%%",num];
    [sliderLabel setText:[NSString stringWithFormat:@"%@",str]];
    f = num;
    if ([t10 isSelected]||[t15 isSelected]||[t18 isSelected]||[t20 isSelected]) {
        [t10 setSelected:NO];
        [t15 setSelected:NO];
        [t18 setSelected:NO];
        [t20 setSelected:NO];
    }
    [self updateTextFields];
}

- (IBAction)textFieldDidChange:(id)sender {
    [self updateTextFields];
    
}

- (IBAction)tipButton10:(UIButton *)sender {
    f=10;
    [self updateTextFields];
    [sender setSelected:YES];
    [t15 setSelected:NO];
    [t18 setSelected:NO];
    [t20 setSelected:NO];
    [tipScroll setValue:10];
    [sliderLabel setText:[NSString stringWithFormat:@"10%%"]];
}
- (IBAction)tipButton15:(UIButton *)sender {
    f=15;
    [self updateTextFields];
    [sender setSelected:YES];
    [t10 setSelected:NO];
    [t18 setSelected:NO];
    [t20 setSelected:NO];
    [tipScroll setValue:15];
    [sliderLabel setText:[NSString stringWithFormat:@"15%%"]];
}
- (IBAction)tipButton18:(UIButton *)sender {
    f=18;
    [self updateTextFields];
    [sender setSelected:YES];
    [t15 setSelected:NO];
    [t10 setSelected:NO];
    [t20 setSelected:NO];
    [tipScroll setValue:18];
    [sliderLabel setText:[NSString stringWithFormat:@"18%%"]];
}
- (IBAction)tipButton20:(UIButton *)sender {
    f=20;
    [self updateTextFields];
    [sender setSelected:YES];
    [t15 setSelected:NO];
    [t18 setSelected:NO];
    [t10 setSelected:NO];
    [tipScroll setValue:20];
    [sliderLabel setText:[NSString stringWithFormat:@"20%%"]];
}

-(void)updateTextFields{
    float bill = (float)[self.amountTextField.text floatValue];
    [self.tipsLabel setText:[NSString stringWithFormat:@"%0.2f",bill*f/100]];
    [self.totalLabel setText:[NSString stringWithFormat:@"%0.2f",bill*(f/100+1)]];
    
}

-(void)dismissKeyboard {
    [amountTextField resignFirstResponder];
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
