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
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;

@end

@implementation ViewController {
    UIImageView *firstImageView;
    UIImageView *secondImageView;
    UIImageView *thirdImageView;
    UIImageView *tappedImageView;
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

    firstImageView.frame = CGRectMake(firstImageView.frame.origin.x, firstImageView.frame.origin.y+200, self.view.frame.size.width, 400);
    secondImageView.frame = CGRectMake(secondImageView.frame.origin.x, secondImageView.frame.origin.y+200, self.view.frame.size.width, 400);
    thirdImageView.frame = CGRectMake(thirdImageView.frame.origin.x, thirdImageView.frame.origin.y+200,self.view.frame.size.width, 400);
    CGFloat startingPointOfX = 0;
    
    firstImageView.frame = CGRectOffset(firstImageView.frame,startingPointOfX, 0);
    startingPointOfX += firstImageView.frame.size.width;
    secondImageView.frame = CGRectOffset(secondImageView.frame,startingPointOfX+20, 0);
    startingPointOfX += secondImageView.frame.size.width+20;
    thirdImageView.frame = CGRectOffset(thirdImageView.frame,startingPointOfX+20, 0);
    startingPointOfX += thirdImageView.frame.size.width;
    
    self.scrollView.contentSize = CGSizeMake(startingPointOfX, CGRectGetHeight(self.scrollView.frame));
    
    
    NSLayoutConstraint *firstImageViewCenterYConstraint = [NSLayoutConstraint constraintWithItem: firstImageView
                                                                                       attribute:NSLayoutAttributeCenterY
                                                                                       relatedBy:NSLayoutRelationEqual
                                                                                          toItem:self.scrollView
                                                                                       attribute:NSLayoutAttributeCenterY
                                                                                      multiplier:1.2
                                                                                        constant:0.0];
    firstImageViewCenterYConstraint.active = YES;
    
    NSLayoutConstraint *secondImageViewCenterYConstraint = [NSLayoutConstraint constraintWithItem: secondImageView
                                                                                        attribute:NSLayoutAttributeCenterY
                                                                                        relatedBy:NSLayoutRelationEqual
                                                                                           toItem:self.scrollView
                                                                                        attribute:NSLayoutAttributeCenterY
                                                                                       multiplier:1.2
                                                                                         constant:0.0];
    secondImageViewCenterYConstraint.active = YES;
    
    NSLayoutConstraint *thirdImageViewCenterYConstraint = [NSLayoutConstraint constraintWithItem: thirdImageView
                                                                                       attribute:NSLayoutAttributeCenterY
                                                                                       relatedBy:NSLayoutRelationEqual
                                                                                          toItem:self.scrollView
                                                                                       attribute:NSLayoutAttributeCenterY
                                                                                      multiplier:1.2
                                                                                        constant:0.0];
    thirdImageViewCenterYConstraint.active = YES;
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapToDetailView:)];
    
    [self.scrollView addGestureRecognizer:tapGesture];

}

-(void)tapToDetailView: (UITapGestureRecognizer *)tapGesture {
    
    CGPoint tapLocation = [tapGesture locationInView:self.scrollView];
    
    for (UIImageView *imageView in self.scrollView.subviews) {
        if (CGRectContainsPoint(imageView.frame, tapLocation)) {
            [self performSegueWithIdentifier:@"showDetailSegue" sender:imageView];
        }
    }
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    NSLog(@"%f", firstImageView.center.x);
    NSLog(@"%f", secondImageView.center.x);
    NSLog(@"%f", thirdImageView.center.x);

    CGFloat distanceToFirst = ABS(self.scrollView.contentOffset.x + (self.view.frame.size.width / 2) - firstImageView.center.x);
    CGFloat distanceToSecond = ABS(self.scrollView.contentOffset.x + (self.view.frame.size.width / 2) - secondImageView.center.x);
    CGFloat distanceToThird = ABS(self.scrollView.contentOffset.x + (self.view.frame.size.width / 2) - thirdImageView.center.x);
    
    
    if( distanceToFirst < distanceToSecond){
        [self.pageControl setCurrentPage:0];
    } else if (distanceToSecond < distanceToThird){
        [self.pageControl setCurrentPage:1];
    } else {
        [self.pageControl setCurrentPage:2];
    }
    [self.view bringSubviewToFront:self.pageControl];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(UIImageView *)sender
{
    if ([[segue identifier] isEqualToString:@"showDetailSegue"]) {
        
        if ([segue.destinationViewController respondsToSelector:@selector(inheritDetailImageView:)]) {
            [segue.destinationViewController performSelector:@selector(inheritDetailImageView:)
                                                  withObject:sender];
        }
    }
    
}

@end
