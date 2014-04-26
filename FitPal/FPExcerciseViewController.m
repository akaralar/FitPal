//
//  FPExcerciseViewController.m
//  FitPal
//
//  Created by Ahmet Karalar on 26/4/14.
//  Copyright (c) 2014 Ahmet Karalar. All rights reserved.
//

#import "FPExcerciseViewController.h"
#import <UIView+AutoLayout/UIView+AutoLayout.h>

NSInteger const kExcerciseDuration = 1.0;
NSInteger const kRestDuration = 1.0;

@interface FPExcerciseViewController ()

@property (nonatomic) NSDate *targetDate;
@property (nonatomic) UILabel *countDownLabel;
@property (nonatomic) UIImageView *counter;
@property (nonatomic) UIImageView *restCounter;
@property (nonatomic) NSArray *excerciseImages;
@property (nonatomic) UIScrollView *excerciseViewer;
@property (nonatomic) NSTimer *countDownTimer;

- (void)countDown:(NSTimer *)timer;

@end

@implementation FPExcerciseViewController

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
    self.excerciseViewer = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:self.excerciseViewer];
    self.excerciseViewer.pagingEnabled = YES;
    self.excerciseViewer.userInteractionEnabled = NO;
    
    NSString *imageNamePrefix = @"Move";
    
    NSMutableArray *images = [NSMutableArray array];

    for (NSInteger i = 1; i <= 12; i++) {
    
        NSString *imageName = [NSString stringWithFormat:@"%@%ld", imageNamePrefix, (long)i];
        UIImage *image = [UIImage imageNamed:imageName];
        [images addObject:image];
        
        if (i != 12) {
            
            image = [UIImage imageNamed:@"Rest"];
            [images addObject:image];

        }
    }
    
    self.excerciseImages = [images copy];
    [self.excerciseImages enumerateObjectsUsingBlock:^(UIImage *image, NSUInteger idx, BOOL *stop) {
       
        UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
        imageView.frame = CGRectMake(idx * 320, 0, 320, 568);
        [self.excerciseViewer addSubview:imageView];
    }];
    
    self.excerciseViewer.contentSize = CGSizeMake(self.excerciseImages.count * 320, 568);
    
    NSLog(@"contentSize = %@", NSStringFromCGSize(self.excerciseViewer.contentSize));
    self.restCounter = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"rest-timer"]];
    [self.view addSubview:self.restCounter];
    self.restCounter.frame = CGRectMake(108, 423, CGRectGetWidth(self.restCounter.bounds), CGRectGetHeight(self.restCounter.bounds));
    
    self.counter = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"timer"]];
    [self.view addSubview:self.counter];
    self.counter.frame = self.restCounter.frame;
    
    self.countDownLabel = [[UILabel alloc] init];
    self.countDownLabel.textAlignment = NSTextAlignmentCenter;
    self.countDownLabel.textColor = [UIColor whiteColor];
    self.countDownLabel.font = [UIFont fontWithName:@"HelveticaNeue-Medium" size:40.0];
    [self.view addSubview:self.countDownLabel];
}

- (void)viewWillAppear:(BOOL)animated
{
    

}

- (void)viewDidAppear:(BOOL)animated
{
    self.targetDate = [[NSDate date] dateByAddingTimeInterval:kExcerciseDuration];
    NSLog(@"%@", [NSDate date]);
    NSLog(@"%@", self.targetDate);
    
//    self.countDownTimer = [[NSTimer alloc] initWithFireDate:[NSDate date]
//                                                   interval:0.1
//                                                     target:self
//                                                   selector:@selector(countDown:)
//                                                   userInfo:nil
//                                                    repeats:YES];
    self.countDownTimer = [NSTimer timerWithTimeInterval:0.1
                                                  target:self
                                                selector:@selector(countDown:)
                                                userInfo:nil
                                                 repeats:YES];
    
    [[NSRunLoop mainRunLoop] addTimer:self.countDownTimer forMode:NSRunLoopCommonModes];
    
    [self.countDownTimer fire];
}

- (void)countDown:(NSTimer *)timer
{
    NSLog(@"count down");
    NSTimeInterval remaining = [self.targetDate timeIntervalSinceDate:[NSDate date]];
    
    if (remaining > 0) {
        
        self.countDownLabel.text = [NSString stringWithFormat:@"%0.1f", remaining];
        [self.countDownLabel sizeToFit];
        self.countDownLabel.center = CGPointMake(self.counter.center.x, self.counter.center.y + 6);
    
    } else {
        
        [timer invalidate];
        
        CGPoint contentOffset = self.excerciseViewer.contentOffset;
        
        if (contentOffset.x + 320.0 == self.excerciseViewer.contentSize.width) {
            
        }
        
        if (((int)(contentOffset.x / 320.0) % 2) == 0) {
            
            [UIView animateWithDuration:0.2
                             animations:^{
                                 
                                 self.excerciseViewer.contentOffset = CGPointMake(contentOffset.x + 320.0, 0);
                                 self.counter.alpha = 0.0;
                             }
                             completion:^(BOOL finished) {
                                
                                 self.counter.hidden = YES;
                                 self.targetDate = [[NSDate date] dateByAddingTimeInterval:kRestDuration];
                                 self.countDownTimer = [NSTimer timerWithTimeInterval:0.1
                                                                               target:self
                                                                             selector:@selector(countDown:)
                                                                             userInfo:nil
                                                                              repeats:YES];
                                 [[NSRunLoop mainRunLoop] addTimer:self.countDownTimer forMode:NSRunLoopCommonModes];
                                 [self.countDownTimer fire];
                                 
                             }];
        } else {
            self.counter.hidden = NO;
            [UIView animateWithDuration:0.2
                             animations:^{
                                 
                                 self.excerciseViewer.contentOffset = CGPointMake(contentOffset.x + 320, 0);
                                 self.counter.alpha = 1.0;
                             }
                             completion:^(BOOL finished) {
                                
                                 
                                 self.targetDate = [[NSDate date] dateByAddingTimeInterval:kExcerciseDuration];
                                 self.countDownTimer = [NSTimer timerWithTimeInterval:0.1
                                                                               target:self
                                                                             selector:@selector(countDown:)
                                                                             userInfo:nil
                                                                              repeats:YES];
                                 [[NSRunLoop mainRunLoop] addTimer:self.countDownTimer forMode:NSRunLoopCommonModes];
                                 [self.countDownTimer fire];
                             }];
            
        }
    }
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

@end
