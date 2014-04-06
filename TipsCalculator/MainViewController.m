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
@property (strong, nonatomic) IBOutlet UIButton *t10;
@property (strong, nonatomic) IBOutlet UIButton *t15;
@property (strong, nonatomic) IBOutlet UIButton *t18;
@property (strong, nonatomic) IBOutlet UIButton *t25;
@end

@implementation MainViewController
@synthesize amountTextField;
@synthesize s;
@synthesize f;
@synthesize n;
@synthesize t10;
@synthesize t15;
@synthesize t18;
@synthesize t25;


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
   
    [amountTextField addTarget:self
                    action:@selector(textFieldDidChange:)
          forControlEvents:UIControlEventEditingChanged];
    UITapGestureRecognizer *tapToDismissKeyboard = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tapToDismissKeyboard];
    //[[UIApplication sharedApplication]setStatusBarStyle:UIStatusBarStyleLightContent];
    [self setNeedsStatusBarAppearanceUpdate];
    [amountTextField becomeFirstResponder];
    
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

- (IBAction)tipButton10:(UIButton *)sender {
    f=10;
    [self updateTextFields];
}
- (IBAction)tipButton15:(UIButton *)sender {
    f=15;
    [self updateTextFields];
}
- (IBAction)tipButton18:(UIButton *)sender {
    f=18;
    [self updateTextFields];
}
- (IBAction)tipButton25:(UIButton *)sender {
    f=25;
    [self updateTextFields];
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
//Tableview musts
/*
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    // Return the number of sections.
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"MyStaticCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"Test%d",indexPath.row+1];
    return cell;
}
*/


@end
