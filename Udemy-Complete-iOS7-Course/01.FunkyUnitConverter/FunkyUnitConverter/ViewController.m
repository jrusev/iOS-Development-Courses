//
//  ViewController.m
//  FunkyUnitConverter
//
//  Created by JR on 10/31/14.
//  Copyright (c) 2014 JR. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)convertUnits:(id)sender {
    int numberOfBills = [self.numOfBillsTextField.text intValue];
    if (numberOfBills < 0) {
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle:@"Error"
                              message:@"Number of bills cannot be negative!"
                              delegate:nil
                              cancelButtonTitle:@"OK"
                              otherButtonTitles:nil];
        [alert show];
        return;
    }
    int numberOfFootballFields = numberOfBills / 91440.0;
    self.numOfBillsLabel.text = [NSString stringWithFormat:@"%d", numberOfFootballFields];
}
@end
