//
//  ViewController.h
//  FunkyUnitConverter
//
//  Created by JR on 10/31/14.
//  Copyright (c) 2014 JR. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *numOfBillsLabel;
@property (strong, nonatomic) IBOutlet UITextField *numOfBillsTextField;
- (IBAction)convertUnits:(id)sender;

@end

