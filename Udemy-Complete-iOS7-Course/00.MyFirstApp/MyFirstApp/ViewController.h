//
//  ViewController.h
//  MyFirstApp
//
//  Created by JR on 10/26/14.
//  Copyright (c) 2014 JR. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UITextField *textField;
- (IBAction)buttonPressed:(UIButton *)sender;


@end

