//
//  FPNavigationControllerViewController.m
//  FitPal
//
//  Created by Ahmet Karalar on 26/4/14.
//  Copyright (c) 2014 Ahmet Karalar. All rights reserved.
//

#import "FPNavigationController.h"
#import "FPRootViewController.h"
#import "FPExcerciseViewController.h"
#import "FPPaypalViewController.h"
#import "FPJawboneViewController.h"
#import "FPFinalViewController.h"

@interface FPNavigationController ()

@property (nonatomic) NSArray *controllers;

- (NSArray *)prepareControllers;

@end

@implementation FPNavigationController

- (void)reset
{
    self.controllers = nil;
    self.viewControllers = nil;
    self.controllers = [self prepareControllers];
    [self showNextPage];
}


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
    
    self.controllers = [self prepareControllers];
    [self showNextPage];
    // Do any additional setup after loading the view.
}

- (NSArray *)prepareControllers
{
    
    FPRootViewController *vc1 = [[FPRootViewController alloc] initWithImage:[UIImage imageNamed:@"Landing"]
                                                                buttonImage:[UIImage imageNamed:@"button1"]];
    FPRootViewController *vc2 = [[FPRootViewController alloc] initWithImage:[UIImage imageNamed:@"Landing2"]
                                                                buttonImage:[UIImage imageNamed:@"button2"]];
    FPRootViewController *vc3 = [[FPPaypalViewController alloc] initWithImage:[UIImage imageNamed:@"Landing3"]
                                                                buttonImage:[UIImage imageNamed:@"button3"]];
    FPRootViewController *vc4 = [[FPJawboneViewController alloc] initWithImage:[UIImage imageNamed:@"Landing4"]
                                                                buttonImage:[UIImage imageNamed:@"button4"]];
    FPRootViewController *vc5 = [[FPRootViewController alloc] initWithImage:[UIImage imageNamed:@"Landing5"]
                                                                buttonImage:[UIImage imageNamed:@"button5"]];
    FPExcerciseViewController *excerciseVC = [[FPExcerciseViewController alloc] init];
    FPFinalViewController *finalVC = [[FPFinalViewController alloc] init];

    return @[vc1, vc2, vc3, vc4, vc5, excerciseVC, finalVC];
}

- (void)showNextPage
{
    if (self.viewControllers.count == 0) {
        
        [self pushViewController:self.controllers[0] animated:NO];
        
    } else if (self.viewControllers.count == self.controllers.count) {
        
    } else {

        NSInteger index = [self.controllers indexOfObject:[self.viewControllers lastObject]];
        [self pushViewController:self.controllers[++index] animated:YES];

    }
}

@end
