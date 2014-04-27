//
//  FPPaypalViewController.m
//  FitPal
//
//  Created by Ahmet Karalar on 27/4/14.
//  Copyright (c) 2014 Ahmet Karalar. All rights reserved.
//

#import "FPPaypalViewController.h"
#import "FPNavigationController.h"

#import <PayPal-iOS-SDK/PayPalMobile.h>

@interface FPPaypalViewController () <PayPalFuturePaymentDelegate>

@property (nonatomic) PayPalConfiguration *payPalConfiguration;

- (void)sendAuthorizationToServer:(NSDictionary *)authorization;

@end

@implementation FPPaypalViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];

    if (!self) {
        return nil;
    }
    
    _payPalConfiguration = [[PayPalConfiguration alloc] init];
    
    _payPalConfiguration.merchantName = @"FitPal";
    _payPalConfiguration.merchantPrivacyPolicyURL = [NSURL URLWithString:@"http://localhost"];
    _payPalConfiguration.merchantUserAgreementURL = [NSURL URLWithString:@"http://localhost"];

    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [PayPalMobile preconnectWithEnvironment:PayPalEnvironmentNoNetwork];
}

- (void)buttonTapped:(id)sender
{
    PayPalFuturePaymentViewController *fpViewController;
    fpViewController = [[PayPalFuturePaymentViewController alloc] initWithConfiguration:self.payPalConfiguration
                                                                               delegate:self];
    
    [self presentViewController:fpViewController
                       animated:YES
                     completion:nil];
    
}

- (void)sendAuthorizationToServer:(NSDictionary *)authorization
{
    
    NSData *consentJSONData = [NSJSONSerialization dataWithJSONObject:authorization
                                                              options:0
                                                                error:nil];
    
    
    // (Your network code here!)
    //
    // Send the authorization response to your server, where it can exchange the authorization code
    // for OAuth access and refresh tokens.
    //
    // Your server must then store these tokens, so that your server code can execute payments
    // for this user in the future.
}

#pragma mark - PayPalFuturePaymentDelegate

- (void)payPalFuturePaymentDidCancel:(PayPalFuturePaymentViewController *)futurePaymentViewController
{

    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)payPalFuturePaymentViewController:(PayPalFuturePaymentViewController *)futurePaymentViewController
                didAuthorizeFuturePayment:(NSDictionary *)futurePaymentAuthorization
{
    
    [self sendAuthorizationToServer:futurePaymentAuthorization];
    
    [self dismissViewControllerAnimated:YES
                             completion:^{

        FPNavigationController *navCont = (FPNavigationController *)self.navigationController;
        [navCont showNextPage];

    }];
}
@end
