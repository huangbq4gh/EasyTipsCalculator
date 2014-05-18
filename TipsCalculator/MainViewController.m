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
@property (nonatomic) IBOutlet UITextField *amountTextField;
@property (nonatomic) IBOutlet UILabel *tipsLabel;
@property (nonatomic) IBOutlet UILabel *totalLabel;
@property (nonatomic) NSString *s;
@property (nonatomic) float f;
@property (nonatomic) float n;
@property (nonatomic) IBOutlet UIButton *t10;
@property (nonatomic) IBOutlet UIButton *t15;
@property (nonatomic) IBOutlet UIButton *t18;
@property (nonatomic) IBOutlet UIButton *t20;
@property (nonatomic) IBOutlet UISlider *tipScroll;
@property (nonatomic) IBOutlet UILabel *sliderLabel;

@end

@implementation MainViewController

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
    self.s = @"";
    self.n = 1;
    self.f = 10;
	// Do any additional setup after loading the view.
   
    [self.amountTextField addTarget:self
                    action:@selector(textFieldDidChange:)
          forControlEvents:UIControlEventEditingChanged];
    UITapGestureRecognizer *tapToDismissKeyboard = [[UITapGestureRecognizer alloc]initWithTarget:self
                                                                                          action:@selector(dismissKeyboard)];
    [self.view addGestureRecognizer:tapToDismissKeyboard];
    //[[UIApplication sharedApplication]setStatusBarStyle:UIStatusBarStyleLightContent];
    [self setNeedsStatusBarAppearanceUpdate];
    [self.amountTextField becomeFirstResponder];
    
    [self.tipScroll addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];
    
    [self.tipScroll setMaximumTrackImage:[UIImage imageNamed:@"slidertracker_max.png"] forState:UIControlStateNormal];
    [self.tipScroll setMinimumTrackImage:[UIImage imageNamed:@"slidertracker_min.png"] forState:UIControlStateNormal];
    [self.tipScroll setThumbImage:[UIImage imageNamed:@"scrollthumb.png"] forState:UIControlStateNormal];
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
    [self.sliderLabel setText:[NSString stringWithFormat:@"%@",str]];
    self.f = num;
    if ([self.t10 isSelected]||[self.t15 isSelected]||[self.t18 isSelected]||[self.t20 isSelected]) {
        [self.t10 setSelected:NO];
        [self.t15 setSelected:NO];
        [self.t18 setSelected:NO];
        [self.t20 setSelected:NO];
    }
    [self updateTextFields];
}

- (IBAction)textFieldDidChange:(id)sender {
    [self updateTextFields];
    
}

- (IBAction)tipButton10:(UIButton *)sender {
    self.f=10;
    [self updateTextFields];
    [sender setSelected:YES];
    [self.t15 setSelected:NO];
    [self.t18 setSelected:NO];
    [self.t20 setSelected:NO];
    [self.tipScroll setValue:10];
    [self.sliderLabel setText:[NSString stringWithFormat:@"10%%"]];
}
- (IBAction)tipButton15:(UIButton *)sender {
    self.f=15;
    [self updateTextFields];
    [sender setSelected:YES];
    [self.t10 setSelected:NO];
    [self.t18 setSelected:NO];
    [self.t20 setSelected:NO];
    [self.tipScroll setValue:15];
    [self.sliderLabel setText:[NSString stringWithFormat:@"15%%"]];
}
- (IBAction)tipButton18:(UIButton *)sender {
    self.f=18;
    [self updateTextFields];
    [sender setSelected:YES];
    [self.t15 setSelected:NO];
    [self.t10 setSelected:NO];
    [self.t20 setSelected:NO];
    [self.tipScroll setValue:18];
    [self.sliderLabel setText:[NSString stringWithFormat:@"18%%"]];
}
- (IBAction)tipButton20:(UIButton *)sender {
    self.f=20;
    [self updateTextFields];
    [sender setSelected:YES];
    [self.t15 setSelected:NO];
    [self.t18 setSelected:NO];
    [self.t10 setSelected:NO];
    [self.tipScroll setValue:20];
    [self.sliderLabel setText:[NSString stringWithFormat:@"20%%"]];
}

-(void)updateTextFields{
    float bill = (float)[self.amountTextField.text floatValue];
    [self.tipsLabel setText:[NSString stringWithFormat:@"%0.2f",bill*self.f/100]];
    [self.totalLabel setText:[NSString stringWithFormat:@"%0.2f",bill*(self.f/100+1)]];
    
}

-(void)dismissKeyboard {
    [self.amountTextField resignFirstResponder];
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
