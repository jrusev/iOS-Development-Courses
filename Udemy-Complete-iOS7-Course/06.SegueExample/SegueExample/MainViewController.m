//
//  MainViewController.m
//  SegueExample
//
//  Created by JR on 11/2/14.
//  Copyright (c) 2014 JR. All rights reserved.
//

#import "MainViewController.h"
#import "DetailViewController.h"

@implementation MainViewController

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([sender isKindOfClass:[UIButton class]]) {
        if ([segue.destinationViewController isKindOfClass:[DetailViewController class] ]) {
            DetailViewController *nextController = segue.destinationViewController;
            nextController.message = self.messageTextField.text;
        }
    }
}

@end
