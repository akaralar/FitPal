//
//  FPRootViewController.m
//  FitPal
//
//  Created by Ahmet Karalar on 26/4/14.
//  Copyright (c) 2014 Ahmet Karalar. All rights reserved.
//

#import "FPRootViewController.h"
#import "FPNavigationController.h"

@interface FPRootViewController ()

@property (nonatomic) UIImage *backgroundImage;
@property (nonatomic) UIImage *buttonImage;

@property (nonatomic) UIImageView *background;
@property (nonatomic) UIButton *button;

- (void)buttonTapped:(id)sender;

@end

@implementation FPRootViewController

- (instancetype)initWithImage:(UIImage *)image buttonImage:(UIImage *)buttonImage
{
    self = [self initWithNibName:nil bundle:nil];
    
    if (!self) {
        return nil;
    }
    
    _backgroundImage = image;
    _buttonImage = buttonImage;
    
    return self;
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
    
    self.navigationController.navigationBarHidden = YES;
    
    self.background = [[UIImageView alloc] initWithImage:self.backgroundImage];
    [self.view addSubview:self.background];
    
    self.button = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.button addTarget:self action:@selector(buttonTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.button setImage:self.buttonImage forState:UIControlStateNormal];

    self.button.frame = CGRectMake(35, 468, 250, 60);
    [self.view addSubview:self.button];
    

}

- (void)buttonTapped:(id)sender
{
    FPNavigationController *navCont = (FPNavigationController *)self.navigationController;
    [navCont showNextPage];
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

@end
