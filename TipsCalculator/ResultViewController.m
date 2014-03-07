//
//  ResultViewController.m
//  TipsCalculator
//
//  Created by Bingqing Huang on 3/7/14.
//  Copyright (c) 2014 Bingqing Huang. All rights reserved.
//

#import "ResultViewController.h"
#import "MainViewController.h"

@interface ResultViewController ()
@property (weak, nonatomic) IBOutlet UILabel *value15;
@property (weak, nonatomic) IBOutlet UILabel *value18;
@property (weak, nonatomic) IBOutlet UILabel *value20;
@property (weak, nonatomic) IBOutlet UILabel *value25;
@property (weak, nonatomic) IBOutlet UILabel *total15;
@property (weak, nonatomic) IBOutlet UILabel *total18;
@property (weak, nonatomic) IBOutlet UILabel *total20;
@property (weak, nonatomic) IBOutlet UILabel *total25;

@end

@implementation ResultViewController
@synthesize value15;
@synthesize value18;
@synthesize value20;
@synthesize value25;
@synthesize total15;
@synthesize total18;
@synthesize total20;
@synthesize total25;
@synthesize valueCal;


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
	// Do any additional setup after loading the view.
    CGFloat result = (CGFloat)[valueCal floatValue];
    [value15 setText: [NSString stringWithFormat:@"%0.2f",result*0.15]];
    [value18 setText: [NSString stringWithFormat:@"%0.2f",result*0.18]];
    [value20 setText: [NSString stringWithFormat:@"%0.2f",result*0.20]];
    [value25 setText: [NSString stringWithFormat:@"%0.2f",result*0.25]];
    [total15 setText: [NSString stringWithFormat:@"%0.2f",result*1.15]];
    [total18 setText: [NSString stringWithFormat:@"%0.2f",result*1.18]];
    [total20 setText: [NSString stringWithFormat:@"%0.2f",result*1.2]];
    [total25 setText: [NSString stringWithFormat:@"%0.2f",result*1.25]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)dismissResult:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES
                             completion:^{
                                 // instantiate and initialize the new controller
                                 MainViewController *newViewController = [[MainViewController alloc] init];
                                 [[self presentingViewController] presentViewController:newViewController
                                                                               animated:NO
                                                                             completion:nil];
                             }];
}

@end
