//
//  ViewController.h
//  MansBestFriend
//
//  Created by JR on 11/1/14.
//  Copyright (c) 2014 JR. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIImageView *myImageView;
@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) IBOutlet UILabel *breedLabel;

@property (strong, nonatomic) NSMutableArray *dogs;

- (IBAction)nextDogButtonPressed:(id)sender;

@end

