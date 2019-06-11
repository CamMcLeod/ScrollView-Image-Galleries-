//
//  DetailViewController.h
//  ScrollView-Image-Galleries
//
//  Created by Cameron Mcleod on 2019-06-10.
//  Copyright © 2019 Cameron Mcleod. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DetailViewController : UIViewController <UIScrollViewDelegate>

@property (strong, nonatomic) IBOutlet UIImageView *detailImageView;

@end

NS_ASSUME_NONNULL_END
