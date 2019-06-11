//
//  DetailViewController.m
//  ScrollView-Image-Galleries
//
//  Created by Cameron Mcleod on 2019-06-10.
//  Copyright © 2019 Cameron Mcleod. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController () <UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *detailScrollView;

@property (weak, nonatomic) UIImage *currentImage;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _detailScrollView = self.detailScrollView;
    _detailImageView = self.detailImageView;

    self.detailScrollView.delegate = self;
    [self.view addSubview:self.detailScrollView];

    self.detailScrollView.maximumZoomScale = 5.0;
    self.detailScrollView.minimumZoomScale = 1.0;

    self.detailImageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.detailImageView setImage: self.currentImage];
   [self.detailScrollView addSubview:self.detailImageView];
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(void)inheritDetailImageView: (UIImageView *) sentView {
    self.currentImage = sentView.image;
    
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {

    return self.detailImageView;

}

- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(CGFloat)scale {

}

@end
