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

@implementation ViewController {
    UIImageView *firstImageView;
    UIImageView *secondImageView;
    UIImageView *thirdImageView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
//    // Do any additional setup after loading the view.
    _scrollView = self.scrollView;
    self.scrollView.pagingEnabled = YES;
    self.scrollView.showsHorizontalScrollIndicator = NO;

    self.scrollView.delegate = self;
    [self.view addSubview:self.scrollView];
    
    firstImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed: @"Lighthouse-in-Field"]];

    secondImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed: @"Lighthouse-night"]];

    thirdImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed: @"Lighthouse-zoomed"]];
    
        [self.scrollView addSubview:firstImageView];
        [self.scrollView addSubview:secondImageView];
        [self.scrollView addSubview:thirdImageView];
    
    firstImageView.contentMode = UIViewContentModeScaleAspectFit;
    secondImageView.contentMode = UIViewContentModeScaleAspectFit;
    thirdImageView.contentMode = UIViewContentModeScaleAspectFit;
    
    firstImageView.frame = CGRectMake(firstImageView.frame.origin.x, firstImageView.frame.origin.y, 200, firstImageView.frame.size.height);
    secondImageView.frame = CGRectMake(secondImageView.frame.origin.x, secondImageView.frame.origin.y, 200, secondImageView.frame.size.height);
    thirdImageView.frame = CGRectMake(thirdImageView.frame.origin.x, thirdImageView.frame.origin.y,200, thirdImageView.frame.size.height);
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
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapToDetailView:)];
    
    [self.scrollView addGestureRecognizer:tapGesture];

}

-(void)tapToDetailView: (UITapGestureRecognizer *)tapGesture {
    
    UIImageView *tappedImageView;
    CGPoint tapLocation = [tapGesture locationInView:self.scrollView];
    
    for (UIImageView *imageView in self.scrollView.subviews) {
        if (CGRectContainsPoint(imageView.frame, tapLocation)) {
            tappedImageView = imageView;
        }
    }
    
    
}
@end
