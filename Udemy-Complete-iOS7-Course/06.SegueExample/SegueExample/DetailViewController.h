//
//  DetailViewController.h
//  SegueExample
//
//  Created by JR on 11/2/14.
//  Copyright (c) 2014 JR. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) NSString *message;
@property (strong, nonatomic) IBOutlet UILabel *messageLabel;

@end
