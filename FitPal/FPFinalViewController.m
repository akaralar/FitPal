//
//  FPFinalViewController.m
//  FitPal
//
//  Created by Ahmet Karalar on 27/4/14.
//  Copyright (c) 2014 Ahmet Karalar. All rights reserved.
//

#import "FPFinalViewController.h"
#import "FPNavigationController.h"

@interface FPFinalViewController ()

- (void)screenTapped:(UIGestureRecognizer *)recognizer;
@end

@implementation FPFinalViewController

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
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Final"]];
    [self.view addSubview:imageView];
    
    UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                 action:@selector(screenTapped:)];
    [self.view addGestureRecognizer:recognizer];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)screenTapped:(UIGestureRecognizer *)recognizer
{
    FPNavigationController *navCont = (FPNavigationController *)self.navigationController;
    [navCont reset];

}

@end
