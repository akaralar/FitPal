//
//  FPJawboneViewController.m
//  FitPal
//
//  Created by Ahmet Karalar on 27/4/14.
//  Copyright (c) 2014 Ahmet Karalar. All rights reserved.
//

#import "FPJawboneViewController.h"
#import <UPPlatformSDK/UPPlatformSDK.h>

NSString * const UPPlatformClientID = @"dVKNSQqrntE";
NSString * const UPPlatformAppSecret = @"3ea8594cb10f119b02796b94c30adbbc78479944";

@interface FPJawboneViewController ()

@end

@implementation FPJawboneViewController

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)buttonTapped:(id)sender
{
    [super buttonTapped:sender];
//    [[UPPlatform sharedPlatform] startSessionWithClientID:UPPlatformClientID
//                                             clientSecret:UPPlatformAppSecret
//                                                authScope:(UPPlatformAuthScopeAll)
//                                               completion:^(UPSession *session, NSError *error) {
//                                                   if (session != nil) {
//                                                       [super buttonTapped:sender];
//                                                   }
//                                               }];
}

@end
