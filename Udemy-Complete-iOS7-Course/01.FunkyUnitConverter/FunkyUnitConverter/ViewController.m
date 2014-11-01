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
    int numberOfFootballFields = numberOfBills / 91440.0;
    self.numOfBillsLabel.text = [NSString stringWithFormat:@"%d", numberOfFootballFields];
}
@end
