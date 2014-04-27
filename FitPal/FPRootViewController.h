//
//  FPRootViewController.h
//  FitPal
//
//  Created by Ahmet Karalar on 26/4/14.
//  Copyright (c) 2014 Ahmet Karalar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FPRootViewController : UIViewController

- (instancetype)initWithImage:(UIImage *)image buttonImage:(UIImage *)buttonImage;
- (void)buttonTapped:(id)sender;

@end
