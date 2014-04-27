//
//  FPAppDelegate.m
//  FitPal
//
//  Created by Ahmet Karalar on 26/4/14.
//  Copyright (c) 2014 Ahmet Karalar. All rights reserved.
//

#import "FPAppDelegate.h"

#import "FPNavigationController.h"

#import <PayPal-iOS-SDK/PayPalMobile.h>

//NSInteger const PayPalProductionClientID =
NSString * const PayPalSandboxClientID = @"AYGKChDeXt-Pt0sSZ7C5fOJfJ_ms-TkQMy-RCrQ3CbkneW0jLJg_nwqGncUF";



@implementation FPAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [PayPalMobile initializeWithClientIdsForEnvironments:@{PayPalEnvironmentSandbox : PayPalSandboxClientID}];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    FPNavigationController *navCont = [[FPNavigationController alloc] init];
    
    self.window.rootViewController = navCont;
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    UILocalNotification *localNotification = [[UILocalNotification alloc] init];
    localNotification.fireDate = [[NSDate date] dateByAddingTimeInterval:10.0];;
    localNotification.alertBody = @"You haven't done your 7 min workout today!";
    localNotification.alertAction = @"Let's do it!";
    localNotification.timeZone = [NSTimeZone timeZoneWithAbbreviation:@"EET"];
    [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
