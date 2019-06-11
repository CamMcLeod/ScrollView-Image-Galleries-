//
//  ViewController.m
//  ScrollView-Image-Galleries
//
//  Created by Cameron Mcleod on 2019-06-10.
//  Copyright © 2019 Cameron Mcleod. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _scrollView = self.scrollView;
    
    self.scrollView.delegate = self;
    
    self.scrollView.maximumZoomScale = 1.0;
    self.scrollView.minimumZoomScale = 0.5;
    
    UIImageView *firstImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed: @"Lighthouse-in-Field"]];
    
    UIImageView *secondImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed: @"Lighthouse-night"]];
    
    UIImageView *thirdImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed: @"Lighthouse-zoomed"]];
    
    [self.scrollView addSubview:firstImageView];
    [self.scrollView addSubview:secondImageView];
    [self.scrollView addSubview:thirdImageView];
    
    secondImageView.frame = CGRectOffset(secondImageView.frame, firstImageView.frame.size.width, 0);
    thirdImageView.frame = CGRectOffset(thirdImageView.frame, secondImageView.frame.size.width, 0);
    NSLog(@"%@", NSStringFromCGSize( self.scrollView.contentSize));
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
//    con
//    [self.scrollView scrollRectToVisible: animated:YES];
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    
}

- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(CGFloat)scale {
    
}

@end
