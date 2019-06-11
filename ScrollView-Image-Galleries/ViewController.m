//
//  ViewController.m
//  ScrollView-Image-Galleries
//
//  Created by Cameron Mcleod on 2019-06-10.
//  Copyright © 2019 Cameron Mcleod. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () < UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    // Do any additional setup after loading the view.
    _scrollView = self.scrollView;
    self.scrollView.pagingEnabled = YES;
    self.scrollView.showsHorizontalScrollIndicator = NO;

    self.scrollView.delegate = self;
    [self.view addSubview:self.scrollView];
    self.scrollView.maximumZoomScale = 1.0;
    self.scrollView.minimumZoomScale = 0.5;
    
    UIImageView *firstImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed: @"Lighthouse-in-Field"]];

    UIImageView *secondImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed: @"Lighthouse-night"]];

    UIImageView *thirdImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed: @"Lighthouse-zoomed"]];
    
        [self.scrollView addSubview:firstImageView];
        [self.scrollView addSubview:secondImageView];
        [self.scrollView addSubview:thirdImageView];
    
    firstImageView.contentMode = UIViewContentModeScaleAspectFit;
    secondImageView.contentMode = UIViewContentModeScaleAspectFit;
    thirdImageView.contentMode = UIViewContentModeScaleAspectFit;

    CGFloat startingPointOfX = 0;
    
    firstImageView.frame = CGRectOffset(firstImageView.frame,startingPointOfX, 0);
    startingPointOfX += firstImageView.frame.size.width;
    secondImageView.frame = CGRectOffset(secondImageView.frame,startingPointOfX, 0);
    startingPointOfX += secondImageView.frame.size.width;
    thirdImageView.frame = CGRectOffset(thirdImageView.frame,startingPointOfX, 0);
    startingPointOfX += thirdImageView.frame.size.width;
    
    self.scrollView.contentSize = CGSizeMake(startingPointOfX, CGRectGetHeight(self.scrollView.frame));
    
    
    NSLayoutConstraint *firstImageViewCenterYConstraint = [NSLayoutConstraint constraintWithItem: firstImageView
                                                                                       attribute:NSLayoutAttributeCenterY
                                                                                       relatedBy:NSLayoutRelationEqual
                                                                                          toItem:self.scrollView
                                                                                       attribute:NSLayoutAttributeCenterY
                                                                                      multiplier:1.0
                                                                                        constant:0.0];
    firstImageViewCenterYConstraint.active = YES;
    
    NSLayoutConstraint *secondImageViewCenterYConstraint = [NSLayoutConstraint constraintWithItem: secondImageView
                                                                                        attribute:NSLayoutAttributeCenterY
                                                                                        relatedBy:NSLayoutRelationEqual
                                                                                           toItem:self.scrollView
                                                                                        attribute:NSLayoutAttributeCenterY
                                                                                       multiplier:1.0
                                                                                         constant:0.0];
    secondImageViewCenterYConstraint.active = YES;
    
    NSLayoutConstraint *thirdImageViewCenterYConstraint = [NSLayoutConstraint constraintWithItem: thirdImageView
                                                                                       attribute:NSLayoutAttributeCenterY
                                                                                       relatedBy:NSLayoutRelationEqual
                                                                                          toItem:self.scrollView
                                                                                       attribute:NSLayoutAttributeCenterY
                                                                                      multiplier:1.0
                                                                                        constant:0.0];
    thirdImageViewCenterYConstraint.active = YES;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
//    con
//    [self.scrollView scrollRectToVisible: animated:YES];
    
}

//- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
//
//}
//
//- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(CGFloat)scale {
//
//}
//
@end
