//
//  ViewController.m
//  MyFirstApp
//
//  Created by JR on 10/26/14.
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

- (IBAction)buttonPressed:(UIButton *)sender {
    self.titleLabel.text = [NSString stringWithFormat:@"Hello, %@", self.textField.text];
    [self.textField resignFirstResponder];
}

@end
