//
//  ViewController.h
//  AgeOfLaika
//
//  Created by JR on 11/1/14.
//  Copyright (c) 2014 JR. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *yearsTextField;
@property (strong, nonatomic) IBOutlet UILabel *yearsLabel;

- (IBAction)convertToDogYears:(id)sender;

@end

